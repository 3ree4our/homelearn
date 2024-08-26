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
          <span class="tagline"></span>
          <div id="profileImageWrapper" class="sec-title">
            <img id="profileImage" src="${pageContext.request.contextPath}/resources/images/member/금발카리나.jpg"
                 alt="프로필 이미지">
          </div>
          <label for="profileImageInput">
            <div>
              <img src="${pageContext.request.contextPath}/resources/images/member/카메라.png" alt="">
            </div>
          </label>
        </div>
      </div>
    </div>

    <%--navbar start--%>
    <div class="row d-flex justify-content-center" id="navbar">
      <div class="align-content-center" id="mypageNav">
        <a href="#">수강목록 보기</a>
        <a href="#">결제내역 보기</a>
        <a href="#">장바구니 보기</a>
      </div>
    </div>
    <%--navbar end--%>

    <div class="row">

      <%--수강 목록 시작--%>
      <div class="col-md-8" id="navbarList"></div>
      <%--수강 목록 끝--%>

      <div class="col-md-4">
        <aside class="sidebar">
          <div class="widget contact-info">
            <h3 class="widget-title">Contact info</h3>
            <p>여기다 무엇을 적어야 좋다고 소문이 날까?</p>

            <form action="" method="post" enctype="multipart/form-data">
              <input type="file" name="profileImage" id="profileImageInput" style="display: none">
              <div>
                <div>
                  <label for="email">이메일</label>
                  <input type="text" name="email" class="form-control" id="email" readonly>
                </div>
                <div>
                  <label for="createdAt">가입날짜</label>
                  <input type="text" class="form-control" id="createdAt" readonly>
                </div>
                <div>
                  <label for="nickname">닉네임</label>
                  <input type="text" name="nickname" class="form-control" id="nickname">
                </div>
                <div>
                  <label for="password">비밀번호</label>
                  <input type="password" name="password" class="form-control" id="password">
                </div>
              </div>
              <button type="submit" class="btn btn-default">정보 수정</button>
            </form>

          </div>
        </aside>
      </div>
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