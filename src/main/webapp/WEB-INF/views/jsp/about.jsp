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
        <h2>About</h2>
        <div class="breadcrumb">
            <a href="home.html">Home</a>
            <span>/ About</span>
        </div>
    </div>
</section>
<!-- Page feature end -->

<!-- About section start -->
<section class="about">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-md-9 m-auto text-center">
                <div class="sec-heading">
                    <span class="tagline">About us</span>
                    <h3 class="sec-title">Educating and empowering the community</h3>
                </div>
            </div>
        </div>
        <div class="row align-items-center">
            <div class="col-md-6">
                <div class="entry-content">
                    <h3>Perspiciatis unde omnis iste natus error inventore.</h3>
                    <p>Perspiciatis unde omnis iste natus error sit voluptatem accusantium
                        doloremque laudantium, totam rem
                        aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto
                        beatae vitae dicta sunt
                        explicabo.</p>
                    <h6>Dolor sit amet consectetur adipisicing elit. Unde, quasi.</h6>
                    <p>Nemo dolores, iusto pariatur corporis quis ullam harum voluptate porro
                        officiis aliquam quas explicabo?</p>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias similique,
                        consequuntur incidunt at
                        repellendus ratione totam excepturi iste. Similique ipsum numquam
                        recusandae, eligendi maiores temporibus
                        officia harum labore deleniti quasi.</p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="video-box">
                    <img src="${pageContext.request.contextPath}/resources/images/video-bg.jpg"
                         alt="">
                    <a href="#" class="video-btn"><img
                            src="${pageContext.request.contextPath}/resources/images/youtube.png"
                            alt=""></a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- About section end -->

<!-- Certification section start -->
<section class="certification">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-md-9 m-auto text-center">
                <div class="sec-heading">
                    <h3 class="sec-title">Our Sponsors</h3>
                </div>
            </div>
        </div>
        <div class="partners-caro owl-carousel">
            <a href="#"><img
                    src="${pageContext.request.contextPath}/resources/images/partners/1.png" alt=""></a>
            <a href="#"><img
                    src="${pageContext.request.contextPath}/resources/images/partners/2.png" alt=""></a>
            <a href="#"><img
                    src="${pageContext.request.contextPath}/resources/images/partners/3.png" alt=""></a>
            <a href="#"><img
                    src="${pageContext.request.contextPath}/resources/images/partners/4.png" alt=""></a>
        </div>
    </div>
</section>
<!-- Certification section end -->

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