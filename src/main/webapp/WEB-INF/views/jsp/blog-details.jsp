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
        <h2>Blog Details</h2>
        <div class="breadcrumb">
            <a href="home.html">Home</a>
            <span>/ Blog Details</span>
        </div>
    </div>
</section>
<!-- Page feature end -->

<!-- Blog Posts section start -->
<section class="blog-posts">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="single-blog-post">
                    <figure class="feature-img">
                        <img src="images/course-preview.jpg" alt="">
                    </figure>
                    <div class="entry-content">
                        <div class="meta-tags">
                            <a href="#" class="post-meta"><i class="ti-time"></i>10 Sep. 2019</a><a
                                href="#" class="post-meta"><i
                                class="ti-user"></i>Wailter White</a><a href="#"
                                                                        class="post-meta"><i
                                class="ti-package"></i>Women
                            Fashion</a><a href="#" class="post-meta"><i class="ti-comments"></i>2
                            Comments</a>
                        </div>
                        <h3>Sed ut perspiciatis unde omnis iste natus error.</h3>
                        <p>Perspiciatis unde omnis iste natus error sit voluptatem accusantium
                            doloremque laudantium, totam rem
                            aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto
                            beatae vitae dicta sunt
                            explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut
                            odit aut fugit, sed quia
                            consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.
                            Neque porro quisquam est, qui
                            dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia
                            non numquam eius modi tempora
                            incidunt</p>
                        <h6>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Unde,
                            quasi.</h6>
                        <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quod at sit
                            recusandae incidunt, pariatur quo
                            provident ullam, iste, dolorum maiores laborum sunt soluta. Fugiat
                            assumenda, nemo dolores, iusto pariatur
                            corporis quis ullam harum voluptate porro officiis aliquam quas
                            explicabo, excepturi reprehenderit illum
                            dicta sapiente vel voluptas quos nobis. Nam, tempore?</p>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias similique,
                            consequuntur incidunt at
                            repellendus ratione totam excepturi iste. Similique ipsum numquam
                            recusandae, eligendi maiores temporibus
                            officia harum labore deleniti quasi.</p>
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
                                        available, but the majority have suffered
                                        alteration in some form, by injected humour, or randomised
                                        words which.</p>
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
                                            <h4>Kosmi Kotalia</h4>
                                            <p>There are many variations of passages of Lorem Ipsum
                                                available, but the majority have suffered
                                                alteration in some form, by injected humour, or
                                                randomised words which.</p>
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
                                    <h4>Kosmi Kotalia</h4>
                                    <p>There are many variations of passages of Lorem Ipsum
                                        available, but the majority have suffered
                                        alteration in some form, by injected humour, or randomised
                                        words which.</p>
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
                    <div class="widget recent-posts">
                        <h3 class="widget-title">recent posts</h3>
                        <ul>
                            <li>
                                <a href="#">
                                    <img src="images/post/3.jpg" alt="">
                                    <h5>Lorem ipsum dolor sit amet.</h5>
                                    <div class="meta-tags">
                          <span class="post-meta category">creative
                          </span> | <span class="post-meta date">07 July, 2019</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="images/post/2.jpg" alt="">
                                    <h5>Amet consectetur adipisicing elit.</h5>
                                    <div class="meta-tags">
                          <span class="post-meta category">creative
                          </span> | <span class="post-meta date">07 July, 2019</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="images/post/1.jpg" alt="">
                                    <h5>Eos voluptatem harum aut?</h5>
                                    <div class="meta-tags">
                          <span class="post-meta category">creative
                          </span> | <span class="post-meta date">07 July, 2019</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </aside>
            </div>
        </div>
    </div>
</section>
<!-- Blog Posts section end -->

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