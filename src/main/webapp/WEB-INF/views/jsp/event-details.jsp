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
    <h2>Events Details</h2>
    <div class="breadcrumb">
      <a href="home.html">Home</a>
      <span>/ Events Details</span>
    </div>
  </div>
</section>
<!-- Page feature end -->

<!-- Events section start -->
<section class="events-details">
  <div class="container">
    <div class="row">
      <div class="col-lg-8">
        <figure class="feature-img">
          <img src="images/course-preview.jpg" alt="">
        </figure>
        <div class="event-item">

          <div class="e-content">
            <div class="meta-tags">
              <span><i class="ti-timer"></i> 2pm to 5pm</span>
              <span class="pl-3"><i class="ti-calendar"></i>19 Sep 2019</span>
            </div>
            <h3>Consectetur adipisicing elit.</h3>
            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Mollitia
              eveniet nulla quo culpa nihil hic
              eius, distinctio, porro facere, dolor aliquid eos? Harum laborum itaque
              ab voluptatum totam officiis,
              porro aperiam, molestias repellat amet error id voluptates, expedita
              similique corrupti dignissimos earum
              voluptate quaerat officia. Tempore eaque magnam repudiandae dicta!</p>
            <p>Recusandae earum ea, architecto corporis voluptates magnam rerum alias
              repellat quia vel animi dolorum
              repudiandae? Voluptatem voluptas tempora, ipsa est magnam officia.</p>
          </div>
        </div>

        <div id="map">
          <img src="images/map.jpg" alt="">
        </div>
      </div>
      <div class="col-lg-4">
        <aside class="sidebar">
          <div class="widget buy-course">
            <h2>Book Now</h2>
            <p>Only 30 Seats available now</p>
            <a href="#" class="btn btn-filled">Book now</a>
          </div>
          <div class="widget categories">
            <h3 class="widget-title">Event Info</h3>
            <ul>
              <li><a href="#">Date: <span>20 Sep, 2019</span></a></li>
              <li><a href="#">Duration: <span>3 Hours</span></a></li>
              <li><a href="#">Total Slots: <span>100</span></a></li>
              <li><a href="#">Organizer: <span>Googly</span></a></li>
              <li><a href="#">Venue: <span>1/27, Alaxa</span></a></li>
            </ul>
          </div>
          <div class="widget contact-info">
            <h3 class="widget-title">Contact info</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure quod
              accusamus est obcaecati eum culpa in
              explicabo cupiditate animi corporis.</p>
            <div>
              <h6>Location Info</h6>
              <span>Address line 1, Avg Centre Point.
                  Level 5, New Yourk City - USA</span>
            </div>
            <div>
              <h6>Hotline numbers</h6>
              <a href="tel:+12345678912">+123 4567 8912</a>
              <a href="tel:+32176542198">+321 7654 2198</a>
            </div>
            <div>
              <h6>Email Us</h6>
              <a href="mailto:youremail@domain.com">youremail@domain.com</a>
              <a href="mailto:help@example.com">help@example.com</a>
            </div>
          </div>
        </aside>
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