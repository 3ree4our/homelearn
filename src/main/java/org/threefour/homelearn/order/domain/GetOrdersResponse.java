package org.threefour.homelearn.order.domain;

import lombok.Getter;
import org.threefour.homelearn.payment.service.PaymentService;

import java.util.ArrayList;
import java.util.List;

@Getter
public class GetOrdersResponse {
    private List<GetOrderResponse> getOrderResponses;

    public GetOrdersResponse(List<GetOrderResponse> getOrderResponses) {
        this.getOrderResponses = getOrderResponses;
    }

    public static GetOrdersResponse from(List<Order> orders, PaymentService paymentService) {
        List<GetOrderResponse> getOrderResponses = new ArrayList<>();
        for (Order order : orders) {
            System.out.println(paymentService.getPaymentByImpUid(order.getImpUid()).get(0).getPaid_amount());
            getOrderResponses.add(
                    GetOrderResponse.from(
                            order, paymentService.getPaymentByImpUid(order.getImpUid()),
                            new ArrayList<>(), new ArrayList<>()
                    ));
        }

        return new GetOrdersResponse(getOrderResponses);
    }

    public GetOrderResponse get(int index) {
        return getOrderResponses.get(index);
    }

    public int size() {
        return getOrderResponses.size();
    }
}
