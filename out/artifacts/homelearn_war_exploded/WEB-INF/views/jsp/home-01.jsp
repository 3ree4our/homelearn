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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

  <script type="module" src="${pageContext.request.contextPath}/resources/js/common/request.js"></script>

  <title>Elearning - Tutor, Education HTML Template</title>
</head>
<body>

<!-- Preloader -->
<div id="preloader">
  <div id="status"></div>
</div>

<%--헤더 자리--%>
<c:import url="${pageContext.request.contextPath}/resources/common/jsp/header.jsp"/>

<!-- Slider section start -->
<section class="slider-banner p-0">
  <div class="slider-carousel owl-carousel">
    <div class="slide slide-3" style="background-image: url(images/slider/3.jpg);"></div>
    <div class="slide slide-1" style="background-image: url(images/slider/2.jpg);"></div>
    <div class="slide slide-2" style="background-image: url(images/slider/1.jpg);"></div>
  </div>
  <div class="container">
    <div class="col-md-11 slider-content m-auto text-center">
      <h2><span>Educate!</span> Smart is Great</h2>
      <form class="search-form" action="#">
        <select name="country">
          <option>All Categories</option>
          <option value="usa">IT & Software</option>
          <option value="canada">Development</option>
          <option value="australia">Marketing & SEO</option>
        </select>
        <input type="text" placeholder="Enter a Subject">
        <button type="submit"><i class="ti-search"></i></button>
      </form>
    </div>
  </div>
</section>
<!-- Slider section end -->

<!-- Feature Box section start -->
<section class="featureBox">
  <div class="container">
    <div class="row">
      <div class="col-md-4">
        <div class="sfBox">
          <i class="fas fa-drafting-compass"></i>
          <strong>100,000 online courses</strong>
          <span>Explore a variety of fresh topics</span>
        </div>
      </div>
      <div class="col-md-4 d-md-flex justify-content-center">
        <div class="sfBox">
          <i class="far fa-user-circle"></i>
          <strong>Expert instruction</strong>
          <span>Find the right instructor for you</span>
        </div>
      </div>
      <div class="col-md-4 d-md-flex justify-content-md-end">
        <div class="sfBox mb-0">
          <i class="fas fa-history"></i>
          <strong>Lifetime access</strong>
          <span>Learn on your schedule</span>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Feature Box section end -->

<!-- Categories sectiion start -->
<section class="categories bg-light">
  <div class="container">
    <div class="row">
      <div class="col-lg-7 col-md-9 m-auto text-center">
        <div class="sec-heading">
          <span class="tagline">Top categories</span>
          <h3 class="sec-title">Pick the right category Build your career</h3>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-3 col-sm-6">
        <a href="#" class="icon-list-block">
          <img src="${pageContext.request.contextPath}/resources/images/icons/categories/1.png" alt="">
          <span>IT & Software</span>
        </a>
      </div>
      <div class="col-md-3 col-sm-6">
        <a href="#" class="icon-list-block">
          <img src="${pageContext.request.contextPath}/resources/images/icons/categories/2.png" alt="">
          <span>Data science</span>
        </a>
      </div>
      <div class="col-md-3 col-sm-6">
        <a href="#" class="icon-list-block">
          <img src="${pageContext.request.contextPath}/resources/images/icons/categories/3.png" alt="">
          <span>Development</span>
        </a>
      </div>
      <div class="col-md-3 col-sm-6">
        <a href="#" class="icon-list-block">
          <img src="${pageContext.request.contextPath}/resources/images/icons/categories/4.png" alt="">
          <span>Graphics design</span>
        </a>
      </div>
      <div class="col-md-3 col-sm-6">
        <a href="#" class="icon-list-block">
          <img src="${pageContext.request.contextPath}/resources/images/icons/categories/5.png" alt="">
          <span>Marketing</span>
        </a>
      </div>
      <div class="col-md-3 col-sm-6">
        <a href="#" class="icon-list-block">
          <img src="${pageContext.request.contextPath}/resources/images/icons/categories/6.png" alt="">
          <span>Music</span>
        </a>
      </div>
      <div class="col-md-3 col-sm-6">
        <a href="#" class="icon-list-block">
          <img src="${pageContext.request.contextPath}/resources/images/icons/categories/7.png" alt="">
          <span>Photography</span>
        </a>
      </div>
      <div class="col-md-3 col-sm-6">
        <a href="#" class="icon-list-block">
          <img src="${pageContext.request.contextPath}/resources/images/icons/categories/8.png" alt="">
          <span>Self Development</span>
        </a>
      </div>
    </div>
  </div>
</section>
<!-- Categories sectiion end -->

<!-- Trial section start -->
<section class="trial-sec">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-5 col-md-6 offset-lg-1">
        <div class="coupon">
          <h2 class="coupon-title">50% Discout <br/> Voucher <span>on your next Enroll</span></h2>
          <p>Use coupon code <strong>Elearnhub</strong></p>
          <div class="clock"></div>
        </div>
      </div>
      <div class="col-lg-5 col-md-6 offset-lg-1">
        <form action="#" class="form trial-form bg-light">
          <h3 class="form-title">15 day free trial</h3>
          <input type="text" placeholder="Your Name">
          <input type="email" placeholder="Your Email">
          <input type="tel" placeholder="Your Phone">
          <button type="submit" class="btn btn-filled">Get your free trial</button>
        </form>
      </div>
    </div>
  </div>
</section>
<!-- Trial section end -->

<!-- Courses section start -->
<section class="courses">
  <div class="container">
    <div class="row">
      <div class="col-lg-7 col-md-9 m-auto text-center">
        <div class="sec-heading">
          <h3 class="sec-title">Popular Courses</h3>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="course-caro owl-carousel">
        <div class="col-12">
          <div class="single-course">
            <figure class="course-thumb">
              <img src="${pageContext.request.contextPath}/resources/images/course/1.jpg" alt="">
              <strong class="ribbon">$29.00</strong>
            </figure>
            <div class="course-content">
              <h3><a href="course-details.html">HTML5 for beginners</a></h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam dicta at aliquam...
              </p>
              <div class="enroll">
                <div class="ratings">
                  <span class="total-students"><i class="ti-user"></i> 220 Students</span>
                  <a href="#"><i class="ti-star"></i>
                  </a><a href="#"><i class="ti-star"></i>
                </a><a href="#"><i class="ti-star"></i>
                </a><a href="#"><i class="ti-star"></i>
                </a><a href="#"><i class="ti-star"></i>
                </a>
                  <span class="enrolled">(330)</span>
                </div>
                <div class="course-meta text-right">
                  <!-- <strong class="course-price">$29.00</strong> -->
                  <a href="#" class="btn btn-filled">Enroll now</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-12">
          <div class="single-course">
            <figure class="course-thumb">
              <img src="${pageContext.request.contextPath}/resources/images/course/2.jpg" alt="">
              <strong class="ribbon">$23.00</strong>
            </figure>
            <div class="course-content">
              <h3><a href="course-details.html">Advance CSS3 animations</a></h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam dicta at aliquam...
              </p>
              <div class="enroll">
                <div class="ratings">
                  <span class="total-students"><i class="ti-user"></i> 220 Students</span>
                  <a href="#"><i class="ti-star"></i>
                  </a><a href="#"><i class="ti-star"></i>
                </a><a href="#"><i class="ti-star"></i>
                </a><a href="#"><i class="ti-star"></i>
                </a><a href="#"><i class="ti-star"></i>
                </a>
                  <span class="enrolled">(330)</span>
                </div>
                <div class="course-meta text-right">
                  <!-- <strong class="course-price">$29.00</strong> -->
                  <a href="#" class="btn btn-filled">Enroll now</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-12">
          <div class="single-course">
            <figure class="course-thumb">
              <img src="${pageContext.request.contextPath}/resources/images/course/3.jpg" alt="">
              <strong class="ribbon">$39.00</strong>
            </figure>
            <div class="course-content">
              <h3><a href="course-details.html">Core Javascript basics</a></h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam dicta at aliquam...
              </p>
              <div class="enroll">
                <div class="ratings">
                  <span class="total-students"><i class="ti-user"></i> 220 Students</span>
                  <a href="#"><i class="ti-star"></i>
                  </a><a href="#"><i class="ti-star"></i>
                </a><a href="#"><i class="ti-star"></i>
                </a><a href="#"><i class="ti-star"></i>
                </a><a href="#"><i class="ti-star"></i>
                </a>
                  <span class="enrolled">(330)</span>
                </div>
                <div class="course-meta text-right">
                  <!-- <strong class="course-price">$29.00</strong> -->
                  <a href="#" class="btn btn-filled">Enroll now</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-12">
          <div class="single-course">
            <figure class="course-thumb">
              <img src="${pageContext.request.contextPath}/resources/images/course/1.jpg" alt="">
              <strong class="ribbon">$39.00</strong>
            </figure>
            <div class="course-content">
              <h3><a href="course-details.html">Core Javascript basics</a></h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam dicta at aliquam...
              </p>
              <div class="enroll">
                <div class="ratings">
                  <span class="total-students"><i class="ti-user"></i> 220 Students</span>
                  <a href="#"><i class="ti-star"></i>
                  </a><a href="#"><i class="ti-star"></i>
                </a><a href="#"><i class="ti-star"></i>
                </a><a href="#"><i class="ti-star"></i>
                </a><a href="#"><i class="ti-star"></i>
                </a>
                  <span class="enrolled">(330)</span>
                </div>
                <div class="course-meta text-right">
                  <!-- <strong class="course-price">$29.00</strong> -->
                  <a href="#" class="btn btn-filled">Enroll now</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Courses section end -->

<!-- Funfacts start -->
<section class="funfacts-02 bg-light">
  <div class="container">
    <ul>
      <li>
        <span>291</span>
        <p>Amazing Courses</p>
      </li>
      <li>
        <span>38</span>
        <p>talented instructors</p>
      </li>
      <li>
        <span>3940</span>
        <p>Skilled Students</p>
      </li>
      <li>
        <span>14</span>
        <p>categories</p>
      </li>
    </ul>
  </div>
</section>
<!-- Funfacts end -->

<!-- Blog section start -->
<section class="blog">
  <div class="container">
    <div class="row">
      <div class="col-lg-7 col-md-9 m-auto text-center">
        <div class="sec-heading">
          <span class="tagline">What’s new</span>
          <h3 class="sec-title">Every Single Update From <br>Our Blog Page</h3>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-4 col-md-6">
        <div class="post-item">
          <img src="${pageContext.request.contextPath}/resources/images/post/1.jpg" alt="">
          <div class="post-content">
            <div class="meta-tags">
              <a href="#" class="post-meta category">creative
              </a> | <a href="#" class="post-meta date">07 July, 2019</a>
            </div>
            <h3 class="post-title"><a href="#">Own may face grass dot
              subdue brought</a></h3>
            <div class="meta-tags">
              <a href="#" class="post-meta category"><i class="ti-package"></i>Women Fashion</a><a href="#"
                                                                                                   class="post-meta commentCount"><i
                    class="ti-comments"></i>2 Comments</a>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-6">
        <div class="post-item">
          <img src="${pageContext.request.contextPath}/resources/images/post/2.jpg" alt="">
          <div class="post-content">
            <div class="meta-tags">
              <a href="#" class="post-meta category">technology
              </a> | <a href="#" class="post-meta date">07 June, 2019</a>
            </div>
            <h3 class="post-title"><a href="#">Dolores quis commodi ratione fugit optio</a></h3>
            <div class="meta-tags">
              <a href="#" class="post-meta category"><i class="ti-package"></i>creative</a><a href="#"
                                                                                              class="post-meta commentCount"><i
                    class="ti-comments"></i>2 Comments</a>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-6">
        <div class="post-item">
          <img src="${pageContext.request.contextPath}/resources/images/post/3.jpg" alt="">
          <div class="post-content">
            <div class="meta-tags">
              <a href="#" class="post-meta category">Marketing
              </a> | <a href="#" class="post-meta date">13 Feb, 2019</a>
            </div>
            <h3 class="post-title"><a href="#">Repellat delectus maiores accusantium</a></h3>
            <div class="meta-tags">
              <a href="#" class="post-meta category"><i class="ti-package"></i>Women Fashion</a>
              <a href="#" class="post-meta commentCount"><i class="ti-comments"></i>2 Comments</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Blog section end -->

<!-- Testimonial section start -->
<section class="testimonial">
  <div class="container">
    <div class="row">
      <div class="col-lg-7 col-md-9 m-auto text-center">
        <div class="sec-heading">
          <span class="tagline text-white">Testimonials</span>
          <h3 class="sec-title text-white">What Our Users Say About Us</h3>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-10 col-md-12 m-auto">
        <div class="testimonialBox">
          <span class="quote-sign"><i class="ti-quote-left"></i></span>
          <div class="test-caro owl-carousel" data-slider-id="1">
            <div class="single-testimonial">
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore eco
                dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan
                lacus vel facilisis.</p>
              <div class="testimonial-user">
                <img src="${pageContext.request.contextPath}/resources/images/avatar-small.png"
                     class="avatar-small circle" alt="">
                <strong>Sansa Stark</strong>
              </div>
            </div>
            <div class="single-testimonial">
              <p>Ypsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore eco
                dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan
                lacus vel facilisis.</p>
              <div class="testimonial-user">
                <img src="${pageContext.request.contextPath}/resources/images/avatar-small.png"
                     class="avatar-small circle" alt="">
                <strong>Linda heiday</strong>
              </div>
            </div>
            <div class="single-testimonial">
              <p>Qonsectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore eco dolore magna aliqua. Quis
                ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.</p>
              <div class="testimonial-user">
                <img src="${pageContext.request.contextPath}/resources/images/avatar-small.png"
                     class="avatar-small circle" alt="">
                <strong>Anna Gunn</strong>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Testimonial section end -->

<!-- Call to action section start -->
<section class="callto-action">
  <div class="container">
    <div class="row">
      <div class="col-md-8 m-auto text-center">
        <h3>Newsletter Subscription</h3>
        <p>Get updated with latest news</p>
        <form class="newsletter" action="#">
          <input type="text" placeholder="Enter your Email">
          <button type="submit"><i class="ti-location-arrow"></i>Subscribe</button>
        </form>
      </div>
    </div>
  </div>
</section>
<!-- Call to action section end -->

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
<script src="${pageContext.request.contextPath}/resources/js/jquery.countdown.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/https://maps.googleapis.com/maps/api/js?key=AIzaSyCxYLtelXg0PGjeTiFDtlN7nrH_47buDWo"></script>
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
</body>
</html>