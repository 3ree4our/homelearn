<!-- Header strat -->
<header class="header">
  <div class="container">
    <nav class="navbar">
      <!-- Site logo -->
      <a href="home-01.html" class="logo">
        <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo image">
      </a>
      <a href="javascript:void(0);" id="mobile-menu-toggler">
        <i class="ti-align-justify"></i>
      </a>
      <ul class="navbar-nav">
        <li class="has-menu-child current-menu-item">
          <a href="javascript:void(0);">Home</a>
          <ul class="sub-menu">
            <li><a href="/">Home 01</a></li>
            <li><a href="home-02">Home 02</a></li>
            <li><a href="home-03">Home 03</a></li>
          </ul>
        </li>
        <li><a href="about.jsp">About</a></li>
        <li class="has-menu-child">
          <a href="javascript:void(0);">Courses</a>
          <ul class="sub-menu">
            <li><a href="courses">Courses</a></li>
            <li><a href="course-details">Course Details</a></li>
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
            <li><a href="members/login">Login</a></li>
            <li><a href="members/signup">Sign up</a></li>
          </ul>
        </li>
        <li><a href="contact.html">Contact</a></li>
        <li><a class="navbar--login" href='/members/login'>Log in</a></li>
      </ul>
    </nav>
  </div>
</header>
<script defer type="module" src="${pageContext.request.contextPath}/resources/js/common/header.js"></script>
<!-- Header end -->