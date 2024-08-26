<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.threefour.homelearn.course.domain.Course" %>
<%@ page import="org.threefour.homelearn.chapter.domain.Chapter" %>
<%@ page import="java.util.*" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Favicon icons -->
    <link href="images/favicon.png" rel="shortcut icon">

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

<!-- Page feature start -->
<section class="page-feature">
    <div class="container text-center">
        <h2>Course details</h2>
        <div class="breadcrumb">
            <a href="home.html">Home</a>
            <span>/ Course details</span>
        </div>
    </div>
</section>
<!-- Page feature end -->

<%
    Course course = (Course) request.getAttribute("course");
    //List<Chapter> chapter = (List<Chapter>)request.getAttribute("chapter");
    //System.out.println("sadsa+ ${chapter.name}" + chapter.toString());
%>
<!-- Course Details section start -->

<section class="course-details">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="course-preview">
                    <img src="images/course-preview.jpg" alt="">
                    <a href="#" class="preview-btn"><i class="ti-control-play"></i></a>
                </div>
                <div class="course-content">
                    <h3><%=course.getName()%>
                    </h3>
                    <p><%=course.getDescription()%>
                    </p>
                    <div class="details">
                        <span>By <a href="#">Von wick</a></span>
                        <span>Last update 10 Sep. 2019</span>
                        <div class="ratings">
                            <span>39 Reviews</span>
                            <a href="#"><i class="ti-star"></i>
                            </a><a href="#"><i class="ti-star"></i>
                        </a><a href="#"><i class="ti-star"></i>
                        </a><a href="#"><i class="ti-star"></i>
                        </a><a href="#"><i class="ti-star"></i>
                        </a>
                        </div>
                    </div>
                </div>

                <div class="course-curriculum">
                    <ul class="nav nav-tabs">
                        <li><a class="active" data-toggle="tab" href="#overview">설명</a></li>
                        <li><a data-toggle="tab" href="#curriculum">챕터</a></li>
                    </ul>

                    <div class="tab-content">
                        <div id="overview" class="tab-pane fade in show active">
                            <h4 class="tab-title">This course includes</h4>
                            <ul class="tab-list-2col mb-4">
                                <li><i class="ti-video-camera"></i>48.5 hours on-demand video</li>
                                <li><i class="ti-pencil"></i>57 articles</li>
                                <li><i class="ti-download"></i>12 downloadable resources</li>
                                <li><i class="ti-timer"></i>Full lifetime access</li>
                                <li><i class="ti-tablet"></i>Access on mobile and TV</li>
                                <li><i class="ti-medall"></i>Certificate of Completion</li>
                            </ul>

                            <h4 class="tab-title">Description</h4>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt
                                esse architecto delectus at facere maxime totam dolorem eum eligendi
                                ullam laudantium officia temporibus repellat nostrum neque, debitis
                                atque sint impedit nemo ipsum! Adipisci dolores ducimus numquam ad
                                cumque possimus? Ex.</p>

                            <h4 class="tab-title">Requirements for this course</h4>
                            <ul>
                                <li><i class="ti-hand-point-right"></i>Phasellus sit amet velit
                                    auctor turpis rhoncus.
                                </li>
                                <li><i class="ti-hand-point-right"></i>Phasellus sed dolor sodales,
                                    eleifend ipsum eu.
                                </li>
                                <li><i class="ti-hand-point-right"></i>Nullam id dolor in ex
                                    eleifend tempus.
                                </li>
                                <li><i class="ti-hand-point-right"></i>Etiam id lorem vel neque
                                    faucibus fermentum.
                                </li>
                                <li><i class="ti-hand-point-right"></i>Nunc tincidunt augue in enim
                                    sollicitudin feugiat.
                                </li>

                            </ul>
                        </div>
                        <%
                            List<Chapter> chapter = (List<Chapter>) request.getAttribute("chapter");
                            //System.out.println("sadsa+ ${chapter.name}" + chapter.toString());
                        %>

                        <div id="curriculum" class="tab-pane fade">
                            <div class="accordion" id="accordion">
                                <div class="accordion-item active">
                                    <%
                                        int i = 0;
                                        for (i = 0; i < chapter.size(); i++) {
                                    %>

                                    <h5 class="" data-toggle="collapse" data-target="#acpan1"
                                        aria-expanded="true">
                                        <%= chapter.get(i).getName()%>
                                        <span>08 lectures</span>
                                    </h5>

                                    <div id="acpan1" class="collapse show" data-parent="#accordion">
                                        <div class="acr-body">
                                            <ul>
                                                <li><a href="<%= chapter.get(i).getUrl()%>"><i
                                                        class="ti-control-play"></i><%=chapter.get(
                                                        i).getChapter_name()%>
                                                </a></li>
                                            </ul>
                                        </div>
                                    </div>


                                    <%}%>


                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="comments">
                    <h4 class="comment-title">comments</h4>
                    <ul>
                        <li>
                            <div class="single-comment">
                                <div class="user-thumb">
                                    <img class="avatar-small circle" src="images/avatar-small.png"
                                         alt="">
                                </div>
                                <div class="comments-body">
                                    <h4>Kosmi Kotalia</h4>
                                    <p>There are many variations of passages of Lorem Ipsum
                                        available, but the majority have suffered alteration in some
                                        form, by injected humour, or randomised words which.</p>
                                    <a href="#"><i class="ti-back-right"></i>Reply</a>
                                </div>
                            </div>
                            <ul class="cmnt-level-2">
                                <li>
                                    <div class="single-comment">
                                        <div class="user-thumb">
                                            <img class="avatar-small circle"
                                                 src="images/avatar-small.png" alt="">
                                        </div>
                                        <div class="comments-body">
                                            <h4>Adam wood</h4>
                                            <p>Lorem ipsum, dolor sit amet consectetur adipisicing
                                                elit. Maxime ratione libero temporibus quo id iste,
                                                esse at accusamus atque qui.</p>
                                            <a href="#"><i class="ti-back-right"></i>Reply</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <div class="single-comment">
                                <div class="user-thumb">
                                    <img class="avatar-small circle" src="images/avatar-small.png"
                                         alt="">
                                </div>
                                <div class="comments-body">
                                    <h4>Lina handshake</h4>
                                    <p>Asperiores minus, laborum incidunt explicabo dolore officiis
                                        praesentium veniam expedita libero harum pariatur reiciendis
                                        porro debitis aliquam quas labore ducimus nisi.
                                        Blanditiis?</p>
                                    <a href="#"><i class="ti-back-right"></i>Reply</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="comment-form">
                    <h4 class="comment-title">Leave a comment</h4>
                    <form action="#">
                        <textarea placeholder="Write Comments"></textarea>
                        <button class="btn btn-filled btn-round ml-auto"><span class="bh"></span>
                            <span>Submit</span></button>
                    </form>
                </div>

            </div>
            <div class="col-lg-4">
                <aside class="sidebar">
                    <div class="widget buy-course">
                        <p class="price"><strong>$11.39</strong><span>$111.00</span></p>
                        <span class="discount-price"><i
                                class="ti-timer"></i>90% off for 23 hours</span>
                        <a href="#" class="btn btn-outline mb-3">장바구니에 담기</a>
                        <a href="#" class="btn btn-filled">수강 신청</a>
                    </div>
                    <div class="widget instractors">
                        <figure>
                            <img src="images/avatar-small.png" alt="" class="avatar-md circle">
                        </figure>
                        <h4>Lisa Sordan</h4>
                        <span>Web designer</span>
                        <!-- <span class="total-courses"><i class="ti-user"></i> 09 Courses</span> -->
                        <div class="socials">
                            <a href="#" class="facebook"><i class="ti-facebook"></i></a>
                            <a href="#" class="twitter"><i class="ti-twitter-alt"></i></a>
                            <a href="#" class="linkedin"><i class="ti-linkedin"></i></a>
                            <a href="#" class="youtube"><i class="ti-youtube"></i></a>
                        </div>
                    </div>
                    <div class="widget categories">
                        <h3 class="widget-title">Categories</h3>
                        <ul>
                            <li><a href="#">App Design <span>(5)</span></a></li>
                            <li><a href="#">Web Design <span>(9)</span></a></li>
                            <li><a href="#">UI-UX Design <span>(23)</span></a></li>
                            <li><a href="#">Print Design <span>(7)</span></a></li>
                            <li><a href="#">Game Design <span>(3)</span></a></li>
                            <li><a href="#">Graphic Design <span>(2)</span></a></li>
                            <li><a href="#">Logo Design <span>(5)</span></a></li>
                        </ul>
                    </div>
                    <div class="widget recent-courses">
                        <h3 class="widget-title">recent Courses</h3>
                        <ul>
                            <li>
                                <a href="#">
                                    <img src="images/lectures/3.jpg" alt="">
                                    <h5>David Kymen</h5>
                                    <span class="skills">English, Communication, Social</span>
                                    <span class="lectures">5 lectures</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="images/lectures/4.jpg" alt="">
                                    <h5>Jessi Green</h5>
                                    <span class="skills">Communication, Social, Marketing</span>
                                    <span class="lectures">5 lectures</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="images/lectures/1.jpg" alt="">
                                    <h5>Adam wood</h5>
                                    <span class="skills">Spanish, sociology</span>
                                    <span class="lectures">5 lectures</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </aside>
            </div>
        </div>
    </div>
</section>
<!-- Courses Details section end -->

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

<!-- JS -->
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/scripts.js"></script>
</body>
</html>