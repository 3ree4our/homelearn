<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<%@ page import="org.threefour.homelearn.order.domain.GetOrderResponse" %>
<%@ page import="static org.threefour.homelearn.cart.RequestConstant.*" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Favicon icons -->
    <link href="images/favicon.png" rel="shortcut icon">

    <!-- All CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

    <title>Elearning - Tutor, Education HTML Template</title>
</head>
<body>

<!-- Preloader -->
<div id="preloader">
    <div id="status"></div>
</div>

<c:import url="${pageContext.request.contextPath}/resources/common/jsp/header.jsp"/>
<%
    GetOrderResponse getOrderResponse = (GetOrderResponse) request.getAttribute(ORDER_PARAMETER_NAME);
%>

<section class="course-details">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="order-details">
                    <h4>주문 내역</h4>
                    <br>
                    <p><strong>결제번호 (Imp UID):</strong> <%= getOrderResponse.getImpUid() %>
                    </p>
                    <p><strong>주문번호 (Merchant UID):</strong> <%= getOrderResponse.getMerchantUid() %>
                    </p>
                    <br>
                    <p><strong>결제 금액:</strong> <%= getOrderResponse.getPaidAmount() %>원</p>
                    <p><strong>환불 금액:</strong> <%= getOrderResponse.getRefundedAmount() %>원</p>
                    <p><strong>실 결제 금액:</strong> <%= getOrderResponse.getRemainedAmount() %>원</p>
                    <br>
                    <p><strong><h5>주문 강좌 목록</h5></strong></p>
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
                        <form action="cancel-order.do" method="post"
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

<c:import url="${pageContext.request.contextPath}/resources/common/jsp/footer.jsp"/>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCxYLtelXg0PGjeTiFDtlN7nrH_47buDWo"></script>
<script src="js/scripts.js"></script>
</body>
</html>
