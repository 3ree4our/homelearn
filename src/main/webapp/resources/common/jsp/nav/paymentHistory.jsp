<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
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

<div class="widget categories">
  <h3 class="widget-title">주문번호 : <span>${payment.merchant_uid}</span></h3>
  <ul>
    <c:forEach var="payment" items="${payments}">
      <%--            <li><a href="#">주문번호: <span>${payment.orderer_id}</span></a></li>--%>
      <li><a href="#">결제 금액: <span>${payment.paid_amount}</span></a></li>
      <li><a href="#">환불 금액: <span>${payment.refunded_amount}</span></a></li>
      <li><a href="#">누적 환불 금액: <span>${payment.remained_amount}</span></a></li>
      <li><a href="#">처리 시간: <span>${payment.created_at}</span></a></li>
    </c:forEach>
  </ul>

  <%--    페이징--%>
  <div class="pagination">
    <c:if test="${currentPage > 0}">
      <a href="?orderer_id=${param.orderer_id}&page=${currentPage - 1}&size=${param.size}">&laquo; Previous</a>
    </c:if>
    <c:forEach var="i" begin="0" end="${totalPages - 1}">
      <a href="?orderer_id=${param.orderer_id}&page=${i}&size=${param.size}"
         class="<c:if test="${i == currentPage}">active</c:if>">${i + 1}</a>
    </c:forEach>
    <c:if test="${currentPage < totalPages - 1}">
      <a href="?orderer_id=${param.orderer_id}&page=${currentPage + 1}&size=${param.size}">Next &raquo;</a>
    </c:if>
  </div>

  <div>
    Total items: ${totalItems}
  </div>

</div>






<!-- JS -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
</body>
</html>