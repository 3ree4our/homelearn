<%@ page session="false" pageEncoding="UTF-8" %>

<!-- Header strat -->
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
        <li class="has-menu-child current-menu-item">
          <a href="/" style="font-weight: bold">홈</a>
          <ul class="sub-menu">
            <li><a href="/">Home 01</a></li>
            <li><a href="home-02">Home 02</a></li>
            <li><a href="home-03">Home 03</a></li>
          </ul>
        </li>
        <li class="has-menu-child">
          <a href="javascript:void(0);" style="font-weight: bold">강좌목록</a>
          <ul class="sub-menu">
            <li><a href="courses">Courses</a></li>
            <li><a href="course-details">Course Details</a></li>
          </ul>
        </li>
        <li class="has-menu-child">
          <a href="#" style="font-weight: bold">마이페이지</a>
          <ul class="sub-menu">
            <li><a href="blog.html">Blog</a></li>
            <li><a href="blog-details.html">Blog Details</a></li>
          </ul>
        </li>

        <li><a href="contact.html" style="font-weight: bold">관라자 페이지</a></li>
        <li><a class="navbar--login" href='/members/login' style="font-weight: bold">로그인</a>
        </li>
      </ul>
    </nav>
  </div>
</header>
<script defer type="module"
        src="${pageContext.request.contextPath}/resources/js/common/header.js"></script>
<!-- Header end -->
