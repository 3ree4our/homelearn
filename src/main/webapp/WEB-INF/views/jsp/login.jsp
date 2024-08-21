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

  <script type="module" defer src="${pageContext.request.contextPath}/resources/js/member/login.js"></script>

  <title>Elearning - Tutor, Education HTML Template</title>
</head>
<body>

<!-- Preloader -->
<div id="preloader">
  <div id="status"></div>
</div>

<!-- Header strat -->
<header class="header abs-header">
  <div class="container">
    <nav class="navbar">
      <!-- Site logo -->
      <a href="home-01.html" class="logo">
        <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="">
      </a>
      <a href="javascript:void(0);" id="mobile-menu-toggler">
        <i class="ti-align-justify"></i>
      </a>
      <ul class="navbar-nav">
        <li class="has-menu-child current-menu-item">
          <a href="javascript:void(0);">Home</a>
          <ul class="sub-menu">
            <li><a href="home-01.html">Home 01</a></li>
            <li><a href="home-02.html">Home 02</a></li>
            <li><a href="home-03.html">Home 03</a></li>
          </ul>
        </li>
        <li><a href="about.jsp">About</a></li>
        <li class="has-menu-child">
          <a href="javascript:void(0);">Courses</a>
          <ul class="sub-menu">
            <li><a href="courses.html">Courses</a></li>
            <li><a href="course-details.html">Course Details</a></li>
          </ul>
        </li>
        <li class="has-menu-child">
          <a href="#">Blog</a>
          <ul class="sub-menu">
            <li><a href="blog.html">Blog</a></li>
            <li><a href="blog-details.html">Blog Details</a></li>
          </ul>
        </li>
        <li class="has-menu-child">
          <a href="#">Events</a>
          <ul class="sub-menu">
            <li><a href="events.html">Events</a></li>
            <li><a href="event-details.html">event Details</a></li>
          </ul>
        </li>
        <li class="has-menu-child">
          <a href="javascript:void(0);">Pages</a>
          <ul class="sub-menu">
            <li><a href="pricing.html">Pricing</a></li>
            <li><a href="terms-condition.html">Terms & Conditions</a></li>
            <li><a href='/members/login'>Login</a></li>
            <li><a href="signup">Sign up</a></li>
          </ul>
        </li>
        <li><a href="contact.html">Contact</a></li>
        <li><a href='/members/login'>Log in</a></li>
      </ul>
    </nav>
  </div>
</header>
<!-- Header strat -->

<!-- Login / Registration start -->
<section class="banner login-registration">
  <div class="vector-img">
    <img src="${pageContext.request.contextPath}/resources/images/vector.png" alt="">
  </div>
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <div class="content-box">
          <h2>Login Account</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit sedo<br> eiusmod tempor incididunt dolore.</p>
        </div>
        <form action="login-proc" class="sl-form" method="POST">
          <div class="form-group">
            <label>Email</label>
            <input type="email" name="username" placeholder="example@gmail.com" required>
          </div>
          <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" placeholder="Password" required>
          </div>
          <div class="form-check">
            <input type="checkbox" class="form-check-input">
            <label class="form-check-label">Remember Password</label>
          </div>
          <button id="loginBtn" class="btn btn-filled btn-round"><span class="bh"></span> <span>Login</span></button>
          <p class="notice">Don’t have an account? <a href="signup">Signup Now</a></p>
        </form>
      </div>
    </div>
  </div>
</section>
<!-- Login / Registration end -->

<!-- Footer strat -->
<footer class="footer">
  <div class="foo-top">
    <div class="container">
      <div class="row">
        <div class="col-md-3 col-sm-6">
          <div class="widget widget-navigation">
            <h4 class="widget-title">Information for</h4>
            <ul>
              <li><a href="#">Prospective undergraduates</a></li>
              <li><a href="#">Prospective graduate students</a></li>
              <li><a href="#">Businesses/Partnerships</a></li>
              <li><a href="#">Visitors/Tourists</a></li>
              <li><a href="#">Parliamentarians</a></li>
            </ul>
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="widget widget-navigation">
            <h4 class="widget-title">Quick Links</h4>
            <ul>
              <li><a href="#">Contact Searches</a></li>
              <li><a href="#">Jobs and Vacancies</a></li>
              <li><a href="#">University images</a></li>
              <li><a href="#">Privacy Policy</a></li>
              <li><a href="#">Terms and Conditions</a></li>
            </ul>
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="widget widget-navigation">
            <h4 class="widget-title">Information About</h4>
            <ul>
              <li><a href="#">Strategic Plan</a></li>
              <li><a href="#">Fees and Funding</a></li>
              <li><a href="#">Museums and collections</a></li>
              <li><a href="#">Statement on Modern Slavery</a></li>
              <li><a href="#">Data privacy / GDPR</a></li>
            </ul>
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="widget widget-navigation">
            <h4 class="widget-title">Security Brand</h4>
            <ul>
              <li><a href="#">Privacy Statement</a></li>
              <li><a href="#">Report Copyright Infringement</a></li>
              <li><a href="#">Report Security Issue</a></li>
              <li><a href="#">Trademark Notice</a></li>
              <li><a href="#">Access Control</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>


  <div class="foo-btm">
    <div class="container">
      <p class="copyright">Copyright © 2019 <a href="#">themeies.com</a>. All rights reserved.</p>
    </div>
  </div>

</footer>
<!-- Footer end -->

<!-- JS -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
</body>
</html>