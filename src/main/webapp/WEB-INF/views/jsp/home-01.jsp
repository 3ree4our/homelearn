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
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/themify-icons.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/fontawesome.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

    <script type="module"
            src="${pageContext.request.contextPath}/resources/js/common/request.js"></script>

    <title>Elearning - Tutor, Education HTML Template</title>
</head>


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
            <h2><span>Home Learn</span> 똑똑한 학습</h2>
            <form method="post" class="search-form" action="homeSearch">
                <select name="keyword" id="keyword">
                    <option value="국어" id="keyword1" name="keyword">찾기</option>
                    <option value="국어" id="keyword2" name="keyword">국어</option>
                    <option value="영어" id="keyword3" name="keyword">영어</option>
                    <option value="수학" id="keyword4" name="keyword">수학</option>
                </select>

                <input type="text" name="search" style="font-weight: bold" id="search"
                       placeholder="강좌명을 입력하세요."/>

                <button type="submit"><i class="ti-search"></i></button>
            </form>
        </div>
    </div>
</section>

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
<!-- Slider section end -->

<!-- Feature Box section start -->

<!-- Feature Box section end -->

<!-- Categories sectiion start -->
<section class="categories bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-md-9 m-auto text-center">
                <div class="sec-heading">

                    <h3 class="sec-title">카테고리</h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-6">
                <a href="#" class="icon-list-block">
                    <img src="${pageContext.request.contextPath}/resources/images/icons/categories/1.png"
                         alt=""/>
                    <span>국어</span>
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="#" class="icon-list-block">
                    <img src="${pageContext.request.contextPath}/resources/images/icons/categories/2.png"
                         alt=""/>
                    <span>영어</span>
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="#" class="icon-list-block">
                    <img src="${pageContext.request.contextPath}/resources/images/icons/categories/3.png"
                         alt=""/>
                    <span style="align: center">수학</span>
                </a>
            </div>


        </div>
    </div>
</section>
<!-- Categories sectiion end -->

<!-- Trial section start -->

<!-- Trial section end -->

<!-- Courses section start -->
<section class="courses">
    <div class="container">

      <span class="row">
        <div class="col-lg-7 col-md-3 m-auto text-center">
          <div class="sec-heading">
            <h3 class="sec-title">인기 강좌</h3>
          </div>
        </div>
      </span>
        <div class="row">
            <c:forEach items="${course}" var="course">

                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                    <img src="${pageContext.request.contextPath}/resources/images/${course.ffname}"
                         alt=""/>
                    <strong class="ribbon">${course.price}</strong>
                    <div class="course-content">
                        <h3><a href="course-details.html">${course.name}</a></h3>
                        <p>Lorem
                        </p>
                        <div class="enroll">
                            <div class="ratings">
                                <span class="total-students"><i
                                        class="ti-user"></i> 220 Students</span>
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
            </c:forEach>
        </div>

    </div>
</section>
<!-- Courses section end -->


<!-- Blog section start -->

<!-- Blog section end -->

<!-- Testimonial section start -->

<!-- Testimonial section end -->

<!-- Call to action section start -->

<!-- Call to action section end -->

<!-- Footer strat -->
<footer class="footer" style="background-color: #0c2e60">
    <div class="foo-top" style="background-color: #0c2e60">
        <div class="container" style="background-color: #0c2e60">
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
            <p class="copyright">Copyright © 2019 <a href="#">themeies.com</a>. All rights reserved.
            </p>
        </div>
    </div>

</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Footer end -->
<script>
  $(function () {
    $("#search").on("keyup", function () {

      $.ajax({
        url: "/autocomplete",
        type: "POST",
        dataType: 'json',
        data: {keyword: $("#keyword").val(), search: $("#search").val()},
        success: function (data) {
          console.log(data);
          $('#search').autocomplete({
            source: data,
            minLength: 0,

          });
          if (!data || data.length === 0) {
            console.log("존재하지 않는 SEQ");
            return false;
          }

          console.log(data);
        }
      });
    });
  });
</script>
<!-- JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.countdown.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/https://maps.googleapis.com/maps/api/js?key=AIzaSyCxYLtelXg0PGjeTiFDtlN7nrH_47buDWo"></script>
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</html>