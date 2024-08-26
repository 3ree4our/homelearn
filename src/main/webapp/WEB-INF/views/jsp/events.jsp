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

<c:import url="${pageContext.request.contextPath}/resources/common/jsp/header.jsp"/>

<!-- Page feature start -->
<section class="page-feature">
    <div class="container text-center">
        <h2>Events</h2>
        <div class="breadcrumb">
            <a href="home.html">Home</a>
            <span>/ Events</span>
        </div>
    </div>
</section>
<!-- Page feature end -->

<!-- Events section start -->
<section class="events">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-md-9 m-auto text-center">
                <div class="sec-heading">
                    <span class="tagline">Latest Events</span>
                    <h3 class="sec-title">Community affairs and integrated events</h3>
                </div>
            </div>
        </div>

        <div class="event-group">
            <h3 class="title">Ongoing</h3>
            <div class="event-item">
                <div class="e-date rounded" style="background-color: #06979d;">20 <span>Sep</span>
                </div>
                <div class="e-content">
                    <span class="e-time"><i class="ti-timer"></i> 2pm to 5pm</span>
                    <h3><a href="event-details.html">Consectetur adipisicing elit.</a></h3>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vitae sunt pariatur
                        ut est natus magni.</p>
                </div>
            </div>
            <div class="event-item">
                <div class="e-date rounded" style="background-color: #fdc800;">20 <span>Sep</span>
                </div>
                <div class="e-content">
                    <span class="e-time"><i class="ti-timer"></i> 2pm to 5pm</span>
                    <h3><a href="event-details.html">Consectetur adipisicing elit.</a></h3>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vitae sunt pariatur
                        ut est natus magni.</p>
                </div>
            </div>
        </div>
        <div class="event-group">
            <h3 class="title">Upcoming</h3>
            <div class="event-item">
                <div class="e-date rounded">20 <span>Sep</span></div>
                <div class="e-content">
                    <span class="e-time"><i class="ti-timer"></i> 2pm to 5pm</span>
                    <h3><a href="event-details.html">Consectetur adipisicing elit.</a></h3>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vitae sunt pariatur
                        ut est natus magni.</p>
                </div>
            </div>
            <div class="event-item">
                <div class="e-date rounded" style="background-color: #f37a33;">20 <span>Sep</span>
                </div>
                <div class="e-content">
                    <span class="e-time"><i class="ti-timer"></i> 2pm to 5pm</span>
                    <h3><a href="event-details.html">Consectetur adipisicing elit.</a></h3>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vitae sunt pariatur
                        ut est natus magni.</p>
                </div>
            </div>
            <div class="event-item">
                <div class="e-date rounded" style="background-color: #06979d;">20 <span>Sep</span>
                </div>
                <div class="e-content">
                    <span class="e-time"><i class="ti-timer"></i> 2pm to 5pm</span>
                    <h3><a href="event-details.html">Consectetur adipisicing elit.</a></h3>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vitae sunt pariatur
                        ut est natus magni.</p>
                </div>
            </div>
            <div class="event-item">
                <div class="e-date rounded" style="background-color: #fdc800;">20 <span>Sep</span>
                </div>
                <div class="e-content">
                    <span class="e-time"><i class="ti-timer"></i> 2pm to 5pm</span>
                    <h3><a href="event-details.html">Consectetur adipisicing elit.</a></h3>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vitae sunt pariatur
                        ut est natus magni.</p>
                </div>
            </div>
        </div>
        <div class="event-group">
            <h3 class="title">Expired</h3>
            <div class="event-item">
                <div class="e-date rounded" style="background-color: #06979d;">20 <span>Sep</span>
                </div>
                <div class="e-content">
                    <span class="e-time"><i class="ti-timer"></i> 2pm to 5pm</span>
                    <h3><a href="event-details.html">Consectetur adipisicing elit.</a></h3>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vitae sunt pariatur
                        ut est natus magni.</p>
                </div>
            </div>
            <div class="event-item">
                <div class="e-date rounded" style="background-color: #fdc800;">20 <span>Sep</span>
                </div>
                <div class="e-content">
                    <span class="e-time"><i class="ti-timer"></i> 2pm to 5pm</span>
                    <h3><a href="event-details.html">Consectetur adipisicing elit.</a></h3>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vitae sunt pariatur
                        ut est natus magni.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Events section end -->

<!-- Footer strat -->
<c:import url="${pageContext.request.contextPath}/resources/common/jsp/footer.jsp"/>

<!-- Footer end -->

<!-- JS -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>