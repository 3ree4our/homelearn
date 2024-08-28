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
  <style>
      .total{
          margin-top: 50px;
          font-weight: bold;
          display: flex;
          justify-content: center;
          align-items: center;
      }
      .king{
          margin-top: 30px;
          margin-bottom: 100px;
          display: flex;
          justify-content: center;
      }
      .col-lg-4{
          background-color: #f8f9fa;
          padding: 20px;
          border: 1px solid #dee2e6;
          text-align: center;
      }
      #title{
          font-size: 12px;
          display: flex;
          justify-content: flex-start;
      }
      hr{
          border: none; /* 기본 테두리 제거 */
          height: 2px; /* 두께 설정 */
          background-color: #333; /* 색상 설정 */
          margin: 20px 0; /* 위아래 여백 설정 */
      }

  </style>
</head>
<body>

<!-- Preloader -->
<div id="preloader">
  <div id="status"></div>
</div>

<c:import url="${pageContext.request.contextPath}/resources/common/jsp/header.jsp"/>
<div class="total">
  총 결제 내역 : ${totalItems} 건
</div>
<div class="king">
  <div class="col-lg-4">
    <div class="widget categories">
      <ul>
        <c:if test="${empty payments}">
          없음
        </c:if>
        <c:forEach var="payment" items="${payments}">
          <h3 class="widget-title" id="title">결제 번호 : <a href="/order.do?impUid=${payment.imp_uid}"><span>${payment.imp_uid}</span></a></h3>
          <li><a href="#">결제 금액: <span>${payment.paid_amount} 원</span></a></li>
          <li><a href="#">환불 금액: <span>${payment.refunded_amount} 원</span></a></li>
          <li><a href="#">실 결제 금액: <span>${payment.remained_amount} 원</span></a></li>
          <li><a href="#">처리 시간: <span>${payment.created_at}</span></a></li>
          <hr>
          <br>
          <br>
        </c:forEach>
      </ul>
      <%--    페이징--%>
      <div class="pagination">
        <c:if test="${currentPage > 0}">
          <a href="?orderer_id=${param.orderer_id}&page=${currentPage - 1}&size=${param.size}">&laquo; Previous</a>
        </c:if>
        <c:choose>
          <c:when test="${totalPages > 0}">
            <c:forEach var="i" begin="0" end="${totalPages - 1}">
              <a href="?orderer_id=${param.orderer_id}&page=${i}&size=${param.size}"
                 class="<c:if test='${i == currentPage}'>active</c:if>">${i + 1}</a>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <%--<!-- No pages available -->--%>
            <%--<p>No pages available</p>--%>
          </c:otherwise>
        </c:choose>
        <c:if test="${currentPage < totalPages - 1}">
          <a href="?orderer_id=${param.orderer_id}&page=${currentPage + 1}&size=${param.size}">Next &raquo;</a>
        </c:if>
      </div>
    </div>



  </div>
</div>

<c:import url="${pageContext.request.contextPath}/resources/common/jsp/footer.jsp"/>






<!-- JS -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
</body>

</html>