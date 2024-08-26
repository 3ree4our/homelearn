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
<%@ include file="header.jsp" %>
<!-- Header strat -->

<!-- Login / Registration start -->
<section class="banner login-registration">
    <div class="vector-img">
        <img src="resources/images/${course.ffname}" alt="">
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
            <p class="copyright">Copyright Â© 2019 <a href="#">themeies.com</a>. All rights
                reserved.</p>
        </div>
    </div>

</footer>
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