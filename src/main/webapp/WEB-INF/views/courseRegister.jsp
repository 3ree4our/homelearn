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
<c:import url="${pageContext.request.contextPath}/resources/common/jsp/header.jsp"/>

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
        <form class="sl-form" name="input" method="post" action="courseWrite.do"
              enctype="multipart/form-data">
          <input type='radio' name='cate' value='korean' checked/>국어&nbsp;&nbsp;&nbsp;&nbsp;
          <input type='radio' name='cate' value='english'/>영어&nbsp;&nbsp;&nbsp;&nbsp;
          <input type='radio' name='cate' value='math'/>수학</br>&nbsp;&nbsp;&nbsp;&nbsp;
          </br>
          <div class="form-group">
            <label>강좌명</label>
            <input type="text" id="name" name="name" placeholder="강좌명을 입력해주세요.">
          </div>
          <div class="form-group">
            <label>설명</label>
            <input type="text" id="description" name="description"
                   placeholder="강좌 설명을 입력해주세요.">
          </div>
          <div class="form-group">
            <label>수강기간 &nbsp;&nbsp;<span style="color:orange; font-weight: bold;">(단위: "일")</span></label>
            <input type="text" id="period" name="period"
                   placeholder="수강기간을 숫자로 입력해주세요.">
          </div>
          <div class="form-group">
            <label>가격 &nbsp;&nbsp;<span style="color:orange; font-weight: bold;">(단위: "$")<span></span></label>
            <input type="text" id="price" name="price" placeholder="가격을  숫자로 입력해주세요.">
          </div>
          <div class="form-group">
            <label>대표 이미지 &nbsp;&nbsp;<span style="color:orange; font-weight: bold;">"이미지만  가능"</span></label>
            <input type="file" name="file">
          </div>
          <button type="button" class="btn btn-filled btn-round" onclick="check()">개설하기
          </button>
          <p class="notice">이미 로그인한 아이디가 있습니까? <a href="login.html">로그인 하러가기</a></p>
        </form>
      </div>
    </div>
  </div>
</section>
<!-- Login / Registration end -->

<!-- Footer strat -->
<c:import url="${pageContext.request.contextPath}/resources/common/jsp/footer.jsp"/>

<!-- Footer end -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
  $(document).ready(function () {
    input.name.focus();
  });

  function check() {
    if (document.input.name.value == "") {
      alert("강좌명을 입력해주세요");
      input.name.focus();

      return false;
    }
    if (document.input.description.value == "") {
      alert("강좌 설명을 입력해주세요");
      input.description.focus();

      return false;
    }
    if (document.input.period.value == "") {
      alert("수강가능 기간을 입력해주세요");
      input.period.focus();

      return false;
    }
    if (document.input.price.value == "") {
      alert("가격을 숫자로 입력해 주세요");
      input.price.focus();

      return false;
    }
    if (document.input.file.value == "") {
      alert("대표이미지를 입력해주세요");
      input.file.focus();

      return false;
    }
    if (isNaN(document.input.period.value)) {
      alert("수강기간을 숫자만 입력해주세요.");
      input.period.focus();

      return false;
    }
    if (isNaN(document.input.price.value)) {
      alert("가격을 숫자만 입력해주세요.");
      input.price.focus();

      return false;
    }

    document.input.submit();
  }
</script>
<!-- JS -->
<script
        src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/scripts.js"></script>
</body>
</html>