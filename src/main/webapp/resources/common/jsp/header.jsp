<%@ page session="false" pageEncoding="UTF-8" %>

<header class="header">
  <div class="container">
    <nav class="navbar">
      <!-- Site logo -->
      <a href="/" class="logo">
        <img src="${pageContext.request.contextPath}/resources/images/logo.png"
             alt="logo image">
      </a>
      <a href="javascript:void(0);" id="mobile-menu-toggler">
        <i class="ti-align-justify"></i>
      </a>
      <ul class="navbar-nav">
        <li><a class="navbar--course" href="/coursesList.do" style="font-weight: bold">강의</a></li>
        <li><a class="navbar--cart" href="/cart.do?studentId=" style="font-weight: bold">장바구니</a></li>
        <li><a class="navbar--login" href='/members/login' style="font-weight: bold">로그인</a></li>
      </ul>
    </nav>
  </div>
</header>
<script defer type="module"
        src="${pageContext.request.contextPath}/resources/js/common/header.js"></script>