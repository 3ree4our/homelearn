<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Favicon icons -->
  <link href="${pageContext.request.contextPath}/resources/images/favicon.png" rel="shortcut icon">

  <!-- All CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">


  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/mypage.css">
  <script defer type="module" src="${pageContext.request.contextPath}/resources/js/member/mypage.js"></script>
  <script defer type="module"
          src="${pageContext.request.contextPath}/resources/js/member/member-api-request.js"></script>
  <title>Elearning - Tutor, Education HTML Template</title>
</head>
<body>

<!-- Preloader -->
<div id="preloader">
  <div id="status"></div>
</div>

<c:import url="${pageContext.request.contextPath}/resources/common/jsp/header.jsp"/>

<!-- Page feature start -->
<section class="page-feature">
  <div class="container text-center">
    <h2>Contact</h2>
  </div>
</section>
<!-- Page feature end -->

<!-- Contact section start -->
<section class="contact">
  <div class="container">
    <div class="row">
      <div class="col-lg-7 col-md-9 m-auto text-center">
        <button id="logoutBtn">로그아웃</button>
        <div class="sec-heading">
          <div id="profileImageWrapper" class="sec-title">
            <img id="profileImage" src="${pageContext.request.contextPath}/resources/images/member/금발카리나.jpg"
                 alt="프로필 이미지">
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="container">
    <div class="row">
      <c:forEach items="${courses}" var="course">
        <div class="col-xs-8 col-md-6 col-lg-5 col-xl-4">
          <div class="card" style="width: 100%;">
            <img src="${course.ffname}" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">${course.name}</h5>
              <p>평점 </p>
              <div>
                <a href=${SERVER_API}/courseDetail.do?course_id=${course.id} class="btn btn-primary">이동하기</a>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>

</section>
<!-- Contact section end -->

<!-- Footer strat -->
<c:import url="${pageContext.request.contextPath}/resources/common/jsp/footer.jsp"/>

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