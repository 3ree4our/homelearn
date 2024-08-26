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
          href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

    <script type="module" defer
            src="${pageContext.request.contextPath}/resources/js/member/login.js"></script>

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
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="content-box">
                    <h2>Login Account</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit sedo<br> eiusmod
                        tempor incididunt dolore.</p>
                </div>
                <form action="login-proc" class="sl-form" method="POST">
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" name="username" placeholder="example@gmail.com"
                               required>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" placeholder="Password" required>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input">
                        <label class="form-check-label">Remember Password</label>
                    </div>
                    <button id="loginBtn" class="btn btn-filled btn-round"><span class="bh"></span>
                        <span>Login</span></button>
                    <p class="notice">Don’t have an account? <a href="signup">Signup Now</a></p>
                </form>
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