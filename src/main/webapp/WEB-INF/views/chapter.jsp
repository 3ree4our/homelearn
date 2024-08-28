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
        <img src="resources/images/${course.ffname}" style="width:60%;height:55%;" alt="">
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="content-box">
                    <h2>강의 등록</h2>
                    <h4 style="color:orange">${course.name }</h4>
                </div>
                <form class="sl-form" name="input" method="post" action="chapterWrite.do">
                    <input type="hidden" name="course_id" value="${course.id }">
                    <div class="form-group">
                        <label>강의명</label>
                        <input type="text" id="name" name="name" placeholder=",를 구분자로 입력해주세요.">
                    </div>
                    <div class="form-group">
                        <label>챕터명</label>
                        <input type="text" id="chapter" name="chapter_name"
                               placeholder=",를 구분자로 입력해주세요.">
                    </div>
                    <div class="form-group">
                        <label>URL</label>
                        <input type="text" id="url" name="url" placeholder=",를 구분자로 사용해주세요.">
                    </div>
                    <div class="form-group">
                        <label>영상시간 &nbsp;&nbsp;<span style="color:red; font-weight: bold;">(단위: "분")</span></label>
                        <input type="text" id="runningTime" name="running_time"
                               placeholder=" ,를 구분자로  입력해주세요.">
                    </div>

                    <button type="button" class="btn btn-filled btn-round" onclick="check()">등록하기
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
<script>
  function check() {
    let name = document.input.name.value;
    let chapter_name = document.input.chapter_name.value;
    let url = document.input.url.value;
    let running_time = document.input.running_time.value;

    let names = name.split(',');
    let chapter_names = chapter_name.split(',');
    let urls = url.split(',');
    let running_times = running_time.split(',');

    console.log(
        names.length + ',' + chapter_names.length + ',' + urls.length + ',' + running_times.length);

    var regExp = /[0-9]/;

    for (let i = 0; i < names.length; i++) {
      if (names.length != chapter_names.length || names.length != urls.length || names.length
          != running_times.length) {
        alert('모든 항목의 갯수를 같게 해주세요.');
        return false;
      }
    }

    if (document.input.name.value == "") {
      alert("강의명을 입력해주세요.");
      return false;
    }
    if (document.input.chapter_name.value == "") {
      alert("챕터명을 입력해주세요.");
      return false;
    }
    if (document.input.url.value == "") {
      alert("URL을 입력해주세요.");
      return false;
    }
    if (document.input.running_time.value == "") {
      alert("수강가능 기간을 입력해주세요.");
      return false;
    }
    regExp.test(document.input.running_time.value)
    if (!regExp.test(document.input.running_time.value)) {
      alert("영상시간을 숫자만 입력해주세요.");
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