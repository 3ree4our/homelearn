<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.threefour.homelearn.order.domain.GetOrderResponse" %>
<%@ page import="org.threefour.homelearn.order.domain.CourseOrderRequest" %>
<%@ page import="java.util.List" %>
<%@ page import="static org.threefour.homelearn.cart.RequestConstant.*" %>
<%@ include file="header.jsp" %>
<%
    GetOrderResponse getOrderResponse = (GetOrderResponse) request.getAttribute(ORDER_PARAMETER_NAME);
%>

<section class="course-details">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="order-details">
                    <h4>주문 내역</h4>
                    <p><strong>결제번호 (Imp UID):</strong> <%= getOrderResponse.getImpUid() %>
                    </p>
                    <p><strong>주문번호 (Merchant UID):</strong> <%= getOrderResponse.getMerchantUid() %>
                    </p>
                    <p><strong>결제금액:</strong> <%= getOrderResponse.getPaidAmount() %>원</p>
                    <p><strong>환불금액:</strong> <%= getOrderResponse.getRefundedAmount() %>원</p>
                    <p><strong>주문 강좌 목록</strong></p>
                    <%
                        for (int i = 0; i < getOrderResponse.getCourses().size(); i++) {
                    %>
                    <div class="course-content" style="position: relative; padding-bottom: 20px;">
                        <h5 style="display: inline-block;"><%= getOrderResponse.getCourses().get(i).getName() %>
                        </h5>
                        <span style="margin-left: 20px;"><%= getOrderResponse.getCourses().get(i).getPrice() %>원</span>
                        <%
                            if (getOrderResponse.getEnrolledCourses().get(i).isRefunded()) {
                        %>
                        <span style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); color: green; font-weight: bold;">환불 완료</span>
                        <%
                        } else {
                        %>
                        <form action="payment/cancel.do" method="post"
                              style="display: inline; position: absolute; right: 10px; top: 50%; transform: translateY(-50%);">
                            <input type="hidden" name="ordererId" value="<%= getOrderResponse.getOrdererId() %>">
                            <input type="hidden" name="courseId"
                                   value="<%= getOrderResponse.getCourses().get(i).getId() %>">
                            <input type="hidden" name="impUid" value="<%= getOrderResponse.getImpUid() %>">
                            <input type="hidden" name="price"
                                   value="<%= getOrderResponse.getCourses().get(i).getPrice() %>">
                            <button type="submit" class="btn btn-danger btn-sm"
                                    style="padding: 5px 15px; font-size: 14px;">결제 취소
                            </button>
                        </form>
                        <%
                            }
                        %>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</section>

<div style="position: fixed; bottom: 60px; right: 120px;">
    <a href="orders.do?ordererId=<%= getOrderResponse.getOrdererId() %>" class="btn btn-primary btn-lg">주문 목록</a>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
