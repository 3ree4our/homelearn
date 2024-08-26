<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>

<div class="container">
  <h3>수강 목록</h3>
  <div class="row">

    <div class="col-xs-12 col-lg-6 col-xl-4">
      <div class="card" style="width: 100%;">
        <img src="${pageContext.request.contextPath}/resources/images/member/금발카리나.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">카리나와 연애하는법 같은게 있을까??</h5>
          <p>평점 </p>
          <a href="#" class="btn btn-primary">해당 강의 uri</a>
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
