<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.threefour.homelearn.course.domain.Course" %>
<%@ page import="org.threefour.homelearn.chapter.domain.Chapter" %>
<%@ page import="java.util.*" %>

<!doctype html>
<html lang="ko">
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

  <script defer type="module" src="${pageContext.request.contextPath}/resources/js/courses/course-details.js"></script>

  <title>Elearning - Tutor, Education HTML Template</title>
</head>
<body>

<!-- Preloader -->
<div id="preloader">
  <div id="status"></div>
</div>

<!-- Header strat -->
<c:import url="${pageContext.request.contextPath}/resources/common/jsp/header.jsp"/>

<!-- Header strat -->

<!-- Page feature start -->
<section class="page-feature">
  <div class="container text-center">
    <h2>Course details</h2>
    <div class="breadcrumb">
      <a href="home.html">Home</a>
      <span>/ Course details</span>
    </div>
  </div>
</section>
<!-- Page feature end -->

<%
  Course course = (Course) request.getAttribute("course");
  //List<Chapter> chapter = (List<Chapter>)request.getAttribute("chapter");
  //System.out.println("sadsa+ ${chapter.name}" + chapter.toString());
%>
<!-- Course Details section start -->

<section class="course-details">
  <div class="container">
    <div class="row">
      <div class="col-lg-8">
        <div class="course-preview">
          <img src="images/course-preview.jpg" alt="">
          <a href="#" class="preview-btn"><i class="ti-control-play"></i></a>
        </div>
        <div class="course-content">
          <h3><%=course.getName()%>
          </h3>
          <p><%=course.getDescription()%>
          </p>
          <div class="details">
            <span>By <a href="#">Von wick</a></span>
            <span>Last update 10 Sep. 2019</span>
            <div class="ratings">
              <span>39 Reviews</span>
              <a href="#"><i class="ti-star"></i>
              </a><a href="#"><i class="ti-star"></i>
            </a><a href="#"><i class="ti-star"></i>
            </a><a href="#"><i class="ti-star"></i>
            </a><a href="#"><i class="ti-star"></i>
            </a>
            </div>
          </div>
        </div>

        <div class="course-curriculum">
          <ul class="nav nav-tabs">
            <li><a data-toggle="tab" href="#curriculum">챕터</a></li>
          </ul>

          <div class="tab-content">

            <%
              List<Chapter> chapter = (List<Chapter>) request.getAttribute("chapter");
              //System.out.println("sadsa+ ${chapter.name}" + chapter.toString());
            %>

            <div id="curriculum" class="tab-pane fade">
              <div class="accordion" id="accordion">
                <div class="accordion-item active">
                  <%
                    int i = 0;
                    for (i = 0; i < chapter.size(); i++) {
                  %>

                  <h5 class="" data-toggle="collapse" data-target="#acpan1"
                      aria-expanded="true">
                    <%= chapter.get(i).getName()%>
                    <span>08 lectures</span>
                  </h5>

                  <div id="acpan1" class="collapse show" data-parent="#accordion">
                    <div class="acr-body">
                      <ul>
                        <li><a href="<%= chapter.get(i).getUrl()%>"><i
                                class="ti-control-play"></i><%=chapter.get(
                                i).getChapter_name()%>
                        </a></li>
                      </ul>
                    </div>
                  </div>


                  <%}%>


                </div>
              </div>
            </div>

          </div>
        </div>

        <div class="comments">
          <h4 class="comment-title">리뷰</h4>
          <c:forEach items="${reviews}" var="review">
            <ul>
              <li>
                <div class="single-comment">
                  <div class="user-thumb">
                    <img class="avatar-small circle" src="images/avatar-small.png"
                         alt="">
                  </div>
                  <div class="comments-body">
                    <h4>닉네임: ${review.COURSE_ID}</h4>
                    <p> ${review.content} </p>
                    <a href="#"><i class="ti-back-right"></i>댓글</a>
                  </div>
                </div>
            </ul>
          </c:forEach>
        </div>
        <div class="comment-form">
          <h4 class="comment-title">리뷰를 작성 하세요.</h4>
          <form action="writeReview" method="post">
            <textarea id="content" name="content" placeholder="리뷰를 작성하세요."></textarea>
            <button class="btn btn-filled btn-round ml-auto" type="button" onclick="writeReview()"><span
                    class="bh"></span>
              <span>전송</span></button>
          </form>
        </div>

      </div>
      <div class="col-lg-4">
        <aside class="sidebar">
          <div class="widget buy-course">
            <p class="price"><strong>$11.39</strong><span>$111.00</span></p>
            <span class="discount-price"><i
                    class="ti-timer"></i>90% off for 23 hours</span>
            <a href="#" class="btn btn-outline mb-3">장바구니에 담기</a>
            <a href="#" class="btn btn-filled">수강 신청</a>
          </div>
          <div class="widget instractors">
            <figure>
              <img src="images/avatar-small.png" alt="" class="avatar-md circle">
            </figure>
            <h4>Lisa Sordan</h4>
            <span>Web designer</span>
            <!-- <span class="total-courses"><i class="ti-user"></i> 09 Courses</span> -->
            <div class="socials">
              <a href="#" class="facebook"><i class="ti-facebook"></i></a>
              <a href="#" class="twitter"><i class="ti-twitter-alt"></i></a>
              <a href="#" class="linkedin"><i class="ti-linkedin"></i></a>
              <a href="#" class="youtube"><i class="ti-youtube"></i></a>
            </div>
          </div>
          <div class="widget categories">
            <h3 class="widget-title">Categories</h3>
            <ul>
              <li><a href="#">App Design <span>(5)</span></a></li>
              <li><a href="#">Web Design <span>(9)</span></a></li>
              <li><a href="#">UI-UX Design <span>(23)</span></a></li>
              <li><a href="#">Print Design <span>(7)</span></a></li>
              <li><a href="#">Game Design <span>(3)</span></a></li>
              <li><a href="#">Graphic Design <span>(2)</span></a></li>
              <li><a href="#">Logo Design <span>(5)</span></a></li>
            </ul>
          </div>
          <div class="widget recent-courses">
            <h3 class="widget-title">recent Courses</h3>
            <ul>
              <li>
                <a href="#">
                  <img src="images/lectures/3.jpg" alt="">
                  <h5>David Kymen</h5>
                  <span class="skills">English, Communication, Social</span>
                  <span class="lectures">5 lectures</span>
                </a>
              </li>
              <li>
                <a href="#">
                  <img src="images/lectures/4.jpg" alt="">
                  <h5>Jessi Green</h5>
                  <span class="skills">Communication, Social, Marketing</span>
                  <span class="lectures">5 lectures</span>
                </a>
              </li>
              <li>
                <a href="#">
                  <img src="images/lectures/1.jpg" alt="">
                  <h5>Adam wood</h5>
                  <span class="skills">Spanish, sociology</span>
                  <span class="lectures">5 lectures</span>
                </a>
              </li>
            </ul>
          </div>
        </aside>
      </div>
    </div>
  </div>
</section>
<!-- Courses Details section end -->

<!-- Footer strat -->
<c:import url="${pageContext.request.contextPath}/resources/common/jsp/footer.jsp"/>

<!-- Footer end -->

<!-- JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>

  function writeReview() {
    var url = window.location.href;
    $.ajax({
      url     : "/writeReview",
      type    : "POST",
      dataType: 'json',
      data    : {content: $("#content").val(), url: url},
      success : function (data) {
        console.log('실행됨 자바스크립트')
        listReview(url);
      }
    });
  }

  function listReview(url) {
    $.ajax({
      url     : "/reviewList",
      type    : "POST",
      dataType: 'json',
      success : function (data) {
        console.log(data)
      }
    });
  }
</script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/jquery.countdown.min.js"></script>
<script src="resources/js/jquery.nice-select.min.js"></script>

<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/scripts.js"></script>
</body>
</html>