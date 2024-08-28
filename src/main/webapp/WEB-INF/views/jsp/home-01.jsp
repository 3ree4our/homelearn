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


  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home/home.css">
  <script defer type="module"
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
    <div class="slide slide-3"
         style="background-image: url(${pageContext.request.contextPath}/resources/images/member/금발카리나.jpg);"></div>
    <div class="slide slide-1"
         style="background-image: url(${pageContext.request.contextPath}/resources/images/member/오타니.jpeg);"></div>
    <div class="slide slide-2"
         style="background-image: url(${pageContext.request.contextPath}/resources/images/member/zk.jpeg);"></div>
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
        <span>${totalSubscriber}</span>
        <p>총 회원 수!</p>
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
            <h3><a href="courseDetail.do?course_id=${course.id}">${course.name}</a></h3>
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
<c:import url="${pageContext.request.contextPath}/resources/common/jsp/footer.jsp"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Footer end -->
<script>
  $(function () {
    $("#search").on("keyup", function () {

      $.ajax({
        url     : "/autocomplete",
        type    : "POST",
        dataType: 'json',
        data    : {keyword: $("#keyword").val(), search: $("#search").val()},
        success : function (data) {
          console.log(data);
          $('#search').autocomplete({
            source   : data,
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
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</html>