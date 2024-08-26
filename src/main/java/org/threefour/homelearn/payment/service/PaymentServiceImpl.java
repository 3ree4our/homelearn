package org.threefour.homelearn.payment.service;

import lombok.RequiredArgsConstructor;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.threefour.homelearn.payment.domain.Payment;
import org.threefour.homelearn.payment.domain.PaymentRequest;
import org.threefour.homelearn.payment.mapper.PaymentMapper;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.List;

import static org.springframework.transaction.annotation.Isolation.READ_COMMITTED;

@Service
//@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentService {

  private static final String API_KEY = "1015112638425627";
  private static final String API_SECRET = "NOaAWOcvZt3mY1thcE3zvHyuuOHnZDmUBezl1QgtRLAsBPXPDqMSjihqLOuElFf1QuoWBevcILiwrPol";


  private final PaymentMapper paymentMapper;



  @Autowired
  public PaymentServiceImpl(PaymentMapper paymentMapper){ //OrderMapper orderMapper,
    this.paymentMapper = paymentMapper;
  }


  @Override
  @Transactional(isolation = READ_COMMITTED)
  public Payment verifyPayment(PaymentRequest paymentRequest) throws Exception {
    String accessToken = getAccessToken();
    JSONObject payment = getPaymentDetails(paymentRequest.getImp_uid(), accessToken);
    System.out.println("accessToken: " + accessToken + ", payment: " + payment);


    // 가격 비교 (주문 데이터를 실제로 조회해야 함)
    int order_amount = paymentRequest.getOrder_amount();
    System.out.println("@@@order_amount: " + order_amount);
    int paid_amount = payment.getInt("amount");

    if (order_amount == paid_amount) {


      switch (payment.getString("status")) {
        case "ready":
          // 가상 계좌가 발급된 상태입니다.
          System.out.println("Virtual account issued.");
          //orderMapper.updateOrderStatus(paymentRequest.getMerchant_uid(),"ready");
          break;
        case "paid":
          // 모든 금액을 지불했습니다!
          System.out.println("Payment completed.");
          //orderMapper.updateOrderStatus(paymentRequest.getMerchant_uid(),"paid");

          Payment paymentRecord = new Payment();
          paymentRecord.setImp_uid(paymentRequest.getImp_uid());
          paymentRecord.setMerchant_uid(paymentRequest.getMerchant_uid());
          paymentRecord.setOrderer_id(0);
          paymentRecord.setPaid_amount(paid_amount);
          paymentRecord.setRefunded_amount(0);
          paymentRecord.setRemained_amount(0);
          //paymentRecord.setStatus(payment.getString("status"));

          System.out.println(paymentRecord + "@");

          return paymentRecord;

        // Save the payment record to the database
        //savePayment(paymentRecord); //이거 만들어줘야함

        default:
          System.out.println("Unknown payment status.");
      }
    } else {
      // 결제 금액이 불일치하여 위/변조 시도가 의심됩니다.
      System.out.println("Amount mismatch detected.");
      cancelPaymentOnPortOne(paymentRequest.getImp_uid(), 0, accessToken);
      throw new RuntimeException("Amount mismatch");
    }
    return null;
  }

  @Override
  public void cancelPayment(PaymentRequest paymentRequest) throws Exception {
    //맨처음 결제 금액 결제히스토리에서 가져오기
    String accessToken = getAccessToken();
    //JSONObject payment = getPaymentDetails(paymentRequest.getImp_uid(), accessToken);
    // 포트원 API를 호출하여 결제를 취소합니다
    cancelPaymentOnPortOne(paymentRequest.getImp_uid(), paymentRequest.getCancel_amount(), accessToken);

    //결제 단건 조회
    JSONObject payment = getPaymentDetails(paymentRequest.getImp_uid(), accessToken);
    int paid_amount = payment.getInt("amount"); //실결제 금액
    int totalCancel_amount = payment.getInt("cancel_amount"); //누적 환불 금액

    // 주문 상태를 취소로 업데이트
    //orderMapper.updateOrderStatus(paymentRequest.getMerchant_uid(), "canceled");

    //결제히스토리 생성
    Payment paymentRecord = new Payment();
    //ID는 자동 생성 될 거고
    //주문자 ID
    paymentRecord.setOrderer_id(0);
    paymentRecord.setImp_uid(paymentRequest.getImp_uid());
    paymentRecord.setMerchant_uid(paymentRequest.getMerchant_uid());
    paymentRecord.setPaid_amount(paid_amount); //맨처음 결제 금액 //결제 히스토리.getPaid_amount() //특정 결제일 때
    paymentRecord.setRefunded_amount(paymentRequest.getCancel_amount());
    paymentRecord.setRemained_amount(totalCancel_amount);


    //paymentRecord.setCreated_at(payment.getDate("paid_at"));
    //paymentRecord.setStatus(payment.getString("status"));


    savePayment(paymentRecord);

  }

  @Override
  public void savePayment(Payment payment) {
    paymentMapper.insertPayment(payment);
  }

  private String getAccessToken() throws Exception {
    URL url = new URL("https://api.iamport.kr/users/getToken");
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
    connection.setRequestMethod("POST");
    connection.setRequestProperty("Content-Type", "application/json");
    connection.setDoOutput(true);

    // Request body
    JSONObject requestBody = new JSONObject();
    requestBody.put("imp_key", API_KEY);
    requestBody.put("imp_secret", API_SECRET);

    try (OutputStream os = connection.getOutputStream()) {
      os.write(requestBody.toString().getBytes());
    }

    // Response handling
    BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
    StringBuilder response = new StringBuilder();
    String line;
    while ((line = br.readLine()) != null) {
      response.append(line);
    }
    br.close();

    JSONObject jsonResponse = new JSONObject(response.toString());
    if (jsonResponse.getInt("code") != 0) {
      throw new RuntimeException("Error getting access token: " + jsonResponse.getString("message"));
    }

    return jsonResponse.getJSONObject("response").getString("access_token");
  }

  private JSONObject getPaymentDetails(String imp_uid, String accessToken) throws Exception {
    URL url = new URL("https://api.iamport.kr/payments/" + imp_uid);
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
    connection.setRequestMethod("GET");
    connection.setRequestProperty("Authorization", accessToken);

    // Response handling
    BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
    StringBuilder response = new StringBuilder();
    String line;
    while ((line = br.readLine()) != null) {
      response.append(line);
    }
    br.close();

    JSONObject jsonResponse = new JSONObject(response.toString());
    if (jsonResponse.getInt("code") != 0) {
      throw new RuntimeException("Error getting payment details: " + jsonResponse.getString("message"));
    }

    return jsonResponse.getJSONObject("response");
  }

  private void cancelPaymentOnPortOne(String imp_uid, int cancel_amount, String accessToken) throws Exception {
    URL url = new URL("https://api.iamport.kr/payments/cancel");
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();

    connection.setRequestMethod("POST");
    connection.setRequestProperty("Content-Type", "application/json");
    connection.setRequestProperty("Authorization", accessToken);
    connection.setDoOutput(true);

    // Request body
    JSONObject requestBody = new JSONObject();
    requestBody.put("imp_uid", imp_uid);
    requestBody.put("amount", cancel_amount); //취소하려는 금액 : 0/null 이면 전체 취소됨
    requestBody.put("reason", "Cancel requested by user");

    try (OutputStream os = connection.getOutputStream()) {
      os.write(requestBody.toString().getBytes());
      os.flush();
    }

    // Response handling
    BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
    StringBuilder response = new StringBuilder();
    String line;
    while ((line = br.readLine()) != null) {
      response.append(line);
    }
    br.close();

    JSONObject jsonResponse = new JSONObject(response.toString());
    if (jsonResponse.getInt("code") != 0) {
      throw new RuntimeException("Error canceling payment: " + jsonResponse.getString("message"));
    }
  }

  //@Override
  //public List<Payment> getPaymentsByOrderer_id(long orderer_id){
  //  return paymentMapper.selectPaymentByOrderer_id(orderer_id);
  //}

  @Override
  public List<Payment> getPaymentByImpUid(String imp_uid) {
    return paymentMapper.selectPaymentByImpUid(imp_uid);
  }

  @Override
  public List<Payment> getPaymentsByOrderer_id(long orderer_id, int offset, int limit) {
    return paymentMapper.selectPaymentsByOrderer_id(orderer_id, offset, limit);
  }

  @Override
  public int getTotalPaymentsByOrderer_id(long orderer_id) {
    return paymentMapper.countPaymentsByOrderer_id(orderer_id);
  }
}

