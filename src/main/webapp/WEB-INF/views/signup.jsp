<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Favicon icons -->
  <link href="resources/images/favicon.png" rel="shortcut icon">

  <!-- All CSS -->
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/css/themify-icons.css">
  <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
  <link rel="stylesheet" href="resources/css/style.css">

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
        <img src="resources/images/logo.png" alt="">
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
        <li><a href="about.html">About</a></li>
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
            <li><a href="/members/login">Login</a></li>
            <li><a href="signup.html">Sign up</a></li>
          </ul>
        </li>
        <li><a href="contact.html">Contact</a></li>
        <li><a href="/members/login">Log in</a></li>
      </ul>
    </nav>
  </div>
</header>
<!-- Header strat -->

<!-- Login / Registration start -->
<section class="banner login-registration">
  <div class="vector-img">
  </div>
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <div class="content-box">
          <h2>강좌개설</h2>
        </div>
        <form class="sl-form" name="input" method="post" action="courseWrite.do" enctype="multipart/form-data">
          <input type='radio' name='cate' value='korean' checked/>국어&nbsp;&nbsp;&nbsp;&nbsp;
          <input type='radio' name='cate' value='english'/>영어&nbsp;&nbsp;&nbsp;&nbsp;
          <input type='radio' name='cate' value='math'/>수학</br>&nbsp;&nbsp;&nbsp;&nbsp;
          </br>
          <div class="form-group">
            <label>코스명</label>
            <input type="text" id="name" name="name" placeholder="코스명을 입력해주세요.">
          </div>
          <div class="form-group">
            <label>설명</label>
            <input type="text" id="description" name="description" placeholder="설명을 입력해주세요.">
          </div>
          <div class="form-group">
            <label>수강기간</label>
            <input type="text" id="period" name="period" placeholder="수강기간을 입력해주세요.">
          </div>
          <div class="form-group">
            <label>가격</label>
            <input type="text" id="price" name="price" placeholder="가격을 입력해주세요.">
          </div>
          <div class="form-group">
            <label>대표 이미지</label>
            <input type="file" name="file">
          </div>
          <button type="button" class="btn btn-filled btn-round" onclick="check()">개설하기</button>
          <p class="notice">이미 로그인한 아이디가 있습니까? <a href="/members/login">로그인 하러가기</a></p>
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
      <p class="copyright">Copyright Â© 2019 <a href="#">themeies.com</a>. All rights reserved.</p>
    </div>
  </div>

</footer>
<!-- Footer end -->
<script>
  function check() {
    if (document.input.name.value == "") {
      alert("강좌명을 입력해주세요");
      return false;
    }
    if (document.input.description.value == "") {
      alert("설명을 입력해주세요");
      return false;
    }
    if (document.input.period.value == "") {
      alert("수강가능 기간을 입력해주세요");
      return false;
    }
    if (document.input.price.value == "") {
      alert("가격을 숫자로 입력해 주세요");
      return false;
    }
    if (document.input.file.value == "") {
      alert("비밀번호를 입력해주세요");
      return false;
    }


    document.input.submit();
  }
</script>
<!-- JS -->
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/scripts.js"></script>
</body>
</html>