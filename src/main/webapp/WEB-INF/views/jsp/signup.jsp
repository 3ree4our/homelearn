<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
          href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/member/signup.css">
    <script defer type="module"
            src="${pageContext.request.contextPath}/resources/js/member/signup.js"></script>

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
        <img src="${pageContext.request.contextPath}/resources/images/vector.png" alt="">
        <label for="profileImageInput">
            <div class="sec-title">
                <img src="${pageContext.request.contextPath}/resources/images/course/1.jpg" alt="">
            </div>
        </label>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="content-box">
                    <h2>Create Account</h2>
                    <p>여기 뭐라고 써야하냐?</p>
                </div>
                <form:form class="sl-form" method="post" enctype="multipart/form-data"
                           modelAttribute="memberRequestDTO">
                    <input type="file" name="profileImage" id="profileImageInput"
                           style="display: none">
                    <div class="form-group">
                        <label for="email">이메일</label>
                        <input type="email" name="email" placeholder="example@gmail.com" id="email"
                               required>
                        <div class="email-success-message hide">사용할 수 있는 아이디입니다.</div>
                        <div class="email-failure-message hide">사용 중인 아이디입니다.</div>
                        <spring:hasBindErrors name="memberRequestDTO">
                            <c:if test="${errors.hasFieldErrors('email')}">
                                <strong>${errors.getFieldError('email').defaultMessage}</strong>
                            </c:if>
                        </spring:hasBindErrors>
                    </div>
                    <div class="form-group">
                        <label for="nickname">닉네임</label>
                        <input type="text" name="nickname" placeholder="Jhone Doe" id="nickname"
                               required>
                        <spring:hasBindErrors name="memberRequestDTO">
                            <c:if test="${errors.hasFieldErrors('nickname')}">
                                <strong>${errors.getFieldError('nickname').defaultMessage}</strong>
                            </c:if>
                        </spring:hasBindErrors>
                    </div>
                    <div class="form-group">
                        <label for="password">비밀번호</label>
                        <input type="password" name="password" placeholder="Password" id="password"
                               required>
                        <div class="password-failure-message hide">8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를
                            입력해주세요.
                        </div>
                            ${valid_password}
                        <spring:hasBindErrors name="memberRequestDTO">
                            <c:if test="${errors.hasFieldErrors('password')}">
                                <strong>${errors.getFieldError('password').defaultMessage}</strong>
                            </c:if>
                        </spring:hasBindErrors>
                    </div>
                    <div class="form-group">
                        <label for="password2">비밀번호 확인</label>
                        <input type="password" placeholder="Password" id="password2" required>
                        <div class="password-mismatch-message hide">비밀번호가 일치하지 않습니다.</div>
                    </div>
                    <div>
                        <label>강의를 올리고 싶으시면 선택하세요</label>
                        <div>
                            <input type="radio" name="role" value="TEACHER"> Teacher
                        </div>
                    </div>
                    <button class="btn btn-filled btn-round">Signup</button>
                    <p class="notice">Already have an account? <a href='/members/login'>Login
                        Account</a></p>
                </form:form>
            </div>
        </div>
    </div>
</section>
<!-- Login / Registration end -->

<!-- Footer strat -->
<c:import url="${pageContext.request.contextPath}/resources/common/jsp/footer.jsp"/>

<!-- Footer end -->

<!-- JS -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
</body>
</html>