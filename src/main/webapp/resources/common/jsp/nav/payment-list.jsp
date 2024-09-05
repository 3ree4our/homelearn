<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>

<div class="widget categories">
  <h3 class="widget-title">주문번호 : <span>${payment.orderer_id}</span></h3>
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

<%--
<div class="container">
  <h3>결제 목록</h3>
  <div class="row" id="paymentsList">

    &lt;%&ndash; <div class="col-12 mb-4">
       <div class="card">
         <div class="card-body">
           <span>수강명</span>
           <span>결제 금액</span>
           <span>결제 일자</span>
           <span>환불 상태</span>
         </div>
       </div>
     </div>&ndash;%&gt;
  </div>
</div>

<nav aria-label="Page navigation example">
  <ul class="pagination d-flex justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="javscript:void(0)">1</a></li>
    <li class="page-item"><a class="page-link" href="javscript:void(0)">2</a></li>
    <li class="page-item"><a class="page-link" href="javscript:void(0)">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
--%>
