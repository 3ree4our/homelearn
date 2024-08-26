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
<body class="courses-page">

<!-- Preloader -->
<div id="preloader">
    <div id="status"></div>
</div>

<c:import url="${pageContext.request.contextPath}/resources/common/jsp/header.jsp"/>

<!-- Page feature start -->
<section class="page-feature">
    <div class="container text-center">
        <h2>Courses</h2>
        <div class="breadcrumb">
            <a href="home.html">Home</a>
            <span>/ Courses</span>
        </div>
    </div>
</section>
<!-- Page feature end -->

<!-- Main form start -->
<section class="main-form pb-0">
    <div class="container">
        <div class="m-search-form">
            <form action="#">
                <input type="text" placeholder="Enter a Subject">
                <button type="submit">Find now</button>
            </form>
        </div>
    </div>
</section>
<!-- Main form end -->

<!-- Courses section start -->
<section class="courses">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="single-course">
                    <figure class="course-thumb">
                        <img src="images/course/1.jpg" alt="">
                        <strong class="ribbon">$29.00</strong>
                    </figure>
                    <div class="course-content">
                        <h3><a href="course-details.html">HTML5 for beginners</a></h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam dicta at
                            aliquam...
                        </p>
                        <div class="enroll">
                            <div class="ratings">
                                <span class="total-students"><i
                                        class="ti-user"></i> 220 Students</span>
                                <a href="#"><i class="ti-star"></i>
                                </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a>
                                <span class="enrolled">(330)</span>
                            </div>
                            <div class="course-meta text-right">
                                <!-- <strong class="course-price">$29.00</strong> -->
                                <a href="#" class="btn btn-filled">Enroll now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single-course">
                    <figure class="course-thumb">
                        <img src="images/course/2.jpg" alt="">
                        <strong class="ribbon">$23.00</strong>
                    </figure>
                    <div class="course-content">
                        <h3><a href="course-details.html">Advance CSS3 animations</a></h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam dicta at
                            aliquam...
                        </p>
                        <div class="enroll">
                            <div class="ratings">
                                <span class="total-students"><i
                                        class="ti-user"></i> 220 Students</span>
                                <a href="#"><i class="ti-star"></i>
                                </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a>
                                <span class="enrolled">(330)</span>
                            </div>
                            <div class="course-meta text-right">
                                <!-- <strong class="course-price">$29.00</strong> -->
                                <a href="#" class="btn btn-filled">Enroll now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single-course">
                    <figure class="course-thumb">
                        <img src="images/course/3.jpg" alt="">
                        <strong class="ribbon">$39.00</strong>
                    </figure>
                    <div class="course-content">
                        <h3><a href="course-details.html">Core Javascript basics</a></h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam dicta at
                            aliquam...
                        </p>
                        <div class="enroll">
                            <div class="ratings">
                                <span class="total-students"><i
                                        class="ti-user"></i> 220 Students</span>
                                <a href="#"><i class="ti-star"></i>
                                </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a>
                                <span class="enrolled">(330)</span>
                            </div>
                            <div class="course-meta text-right">
                                <!-- <strong class="course-price">$29.00</strong> -->
                                <a href="#" class="btn btn-filled">Enroll now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single-course">
                    <figure class="course-thumb">
                        <img src="images/course/4.jpg" alt="">
                        <strong class="ribbon">$44.00</strong>
                    </figure>
                    <div class="course-content">
                        <h3><a href="course-details.html">Aplied Physics application</a></h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam dicta at
                            aliquam...
                        </p>
                        <div class="enroll">
                            <div class="ratings">
                                <span class="total-students"><i
                                        class="ti-user"></i> 220 Students</span>
                                <a href="#"><i class="ti-star"></i>
                                </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a>
                                <span class="enrolled">(330)</span>
                            </div>
                            <div class="course-meta text-right">
                                <!-- <strong class="course-price">$29.00</strong> -->
                                <a href="#" class="btn btn-filled">Enroll now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single-course">
                    <figure class="course-thumb">
                        <img src="images/course/5.jpg" alt="">
                        <strong class="ribbon">$17.00</strong>
                    </figure>
                    <div class="course-content">
                        <h3><a href="course-details.html">Introduction to quantum mechanics</a></h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam dicta at
                            aliquam...
                        </p>
                        <div class="enroll">
                            <div class="ratings">
                                <span class="total-students"><i
                                        class="ti-user"></i> 220 Students</span>
                                <a href="#"><i class="ti-star"></i>
                                </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a>
                                <span class="enrolled">(330)</span>
                            </div>
                            <div class="course-meta text-right">
                                <!-- <strong class="course-price">$29.00</strong> -->
                                <a href="#" class="btn btn-filled">Enroll now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single-course">
                    <figure class="course-thumb">
                        <img src="images/course/6.jpg" alt="">
                        <strong class="ribbon">$20.00</strong>
                    </figure>
                    <div class="course-content">
                        <h3><a href="course-details.html">Chemistry periodic table</a></h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam dicta at
                            aliquam...
                        </p>
                        <div class="enroll">
                            <div class="ratings">
                                <span class="total-students"><i
                                        class="ti-user"></i> 220 Students</span>
                                <a href="#"><i class="ti-star"></i>
                                </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a>
                                <span class="enrolled">(330)</span>
                            </div>
                            <div class="course-meta text-right">
                                <!-- <strong class="course-price">$29.00</strong> -->
                                <a href="#" class="btn btn-filled">Enroll now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single-course">
                    <figure class="course-thumb">
                        <img src="images/course/7.jpg" alt="">
                        <strong class="ribbon">$32.00</strong>
                    </figure>
                    <div class="course-content">
                        <h3><a href="course-details.html">Communication engineering</a></h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam dicta at
                            aliquam...
                        </p>
                        <div class="enroll">
                            <div class="ratings">
                                <span class="total-students"><i
                                        class="ti-user"></i> 220 Students</span>
                                <a href="#"><i class="ti-star"></i>
                                </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a>
                                <span class="enrolled">(330)</span>
                            </div>
                            <div class="course-meta text-right">
                                <!-- <strong class="course-price">$29.00</strong> -->
                                <a href="#" class="btn btn-filled">Enroll now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single-course">
                    <figure class="course-thumb">
                        <img src="images/course/8.jpg" alt="">
                        <strong class="ribbon">$39.00</strong>
                    </figure>
                    <div class="course-content">
                        <h3><a href="course-details.html">Telecommunication systems</a></h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam dicta at
                            aliquam...
                        </p>
                        <div class="enroll">
                            <div class="ratings">
                                <span class="total-students"><i
                                        class="ti-user"></i> 220 Students</span>
                                <a href="#"><i class="ti-star"></i>
                                </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a>
                                <span class="enrolled">(330)</span>
                            </div>
                            <div class="course-meta text-right">
                                <!-- <strong class="course-price">$29.00</strong> -->
                                <a href="#" class="btn btn-filled">Enroll now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single-course">
                    <figure class="course-thumb">
                        <img src="images/course/9.jpg" alt="">
                        <strong class="ribbon">$41.00</strong>
                    </figure>
                    <div class="course-content">
                        <h3><a href="course-details.html">Marketing management strategies</a></h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam dicta at
                            aliquam...
                        </p>
                        <div class="enroll">
                            <div class="ratings">
                                <span class="total-students"><i
                                        class="ti-user"></i> 220 Students</span>
                                <a href="#"><i class="ti-star"></i>
                                </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                            </a>
                                <span class="enrolled">(330)</span>
                            </div>
                            <div class="course-meta text-right">
                                <!-- <strong class="course-price">$29.00</strong> -->
                                <a href="#" class="btn btn-filled">Enroll now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="pagination">
            <!-- <a href="$">prev</a> -->
            <span class="current-page">1</span>
            <a href="$">2</a>
            <a href="$">3</a>
            <a href="$">4</a>
            <a href="$">Next</a>
        </div>
    </div>
</section>
<!-- Courses section end -->

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