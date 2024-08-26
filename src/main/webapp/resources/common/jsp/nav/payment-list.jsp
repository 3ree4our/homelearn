<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>

<div class="container">
  <h3>결제 목록</h3>
  <div class="row">
    <div class="col-12 mb-4">
      <div class="card">
        <div class="card-body">
          <span>수강명</span>
          <span>결제 금액</span>
          <span>결제 일자</span>
          <span>환불 상태</span>
        </div>
      </div>
    </div>
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
