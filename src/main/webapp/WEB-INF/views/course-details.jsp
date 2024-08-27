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
  <style>
    table {
      border-collapse: collapse;
      width: 500px;
      margin: 1rem auto;
      background-color: white;
    }

    /* 테이블 행 */
    th, td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid darkorange;
      text-align: center;
    }

    th {
      background-color: #1b1b1b;
      color: #ddd;
    }

    /* 테이블 올렸을 때 */
    tbody tr:hover {
      background-color: #d3d3d3;
      opacity: 0.9;
      cursor: pointer;
    }

    /* 테이블 비율 */
    th:nth-child(1),
    td:nth-child(1) {
      width: 15%;
    }

    th:nth-child(2),
    td:nth-child(2) {
      width: 55%;
    }

    th:nth-child(3),
    td:nth-child(3) {
      width: 30%;
    }

    tr:nth-child(even) {
      background-color: lightgrey;
    }
  </style>
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
%>
<!-- Course Details section start -->
<section class="course-details">
  <div class="container">
    <div class="row">
      <div class="col-lg-8">
        <div class="course-content">
          <h3><%=course.getName()%>
          </h3>
          <p><%=course.getDescription()%>
          </p>
        </div>
        <div class="course-curriculum">
          <ul class="nav nav-tabs">
            <li><a data-toggle="tab" href="#curriculum">챕터</a></li>
          </ul>
          <div class="tab-content">
            <%
              List<Chapter> chapter = (List<Chapter>) request.getAttribute("chapter");
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
        <div id="comments" class="comments">
        </div>
        <div class="comment-form">
          <h4 class="comment-title">댓글을 작성하면 목록을 볼 수 있습니다.</h4>
          <form action="writeReview" method="post">
            <textarea id="content" name="content" placeholder="리뷰를 작성하세요."></textarea>
            <button class="btn btn-filled btn-round ml-auto" type="button" onclick="writeReview()"><span
                    class="bh"></span>
              <span>전송</span></button>
          </form>
        </div>

      </div>
      <div class="col-lg-4">
        <aside class="sidebar">
          <div class="widget buy-course">
            <p class="price" style="margin-bottom: 20px"><strong>$<%=course.getPrice()%>
            </strong></p>
            <a href="/add-cart-course.do?studentId=1&courseId=<%=course.getId()%>" class="btn btn-outline mb-3">장바구니에 담기</a><a href="#" class="btn btn-filled">수강 신청</a>
          </div>
        </aside>
      </div>
    </div>
  </div>
</section>
<!-- Courses Details section end -->

<!-- Footer strat -->
<c:import url="${pageContext.request.contextPath}/resources/common/jsp/footer.jsp"/>

<!-- Footer end -->

<!-- JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>

 /* function writeReview() {
    var url = window.location.href;
    $.ajax({
      url     : "/writeReview",
      type    : "POST",
      dataType: 'json',
      data    : {content: $("#content").val(), url: url},
      success : function (data) {

        var result = data;
        let html = "<h4 class='comment-title'>리뷰</h4><table border='1' style='height: 100%; width: 100%;'>";
        for (let i = 0; i < result.length; i++) {
          console.log(data[i].content);
          html += "<ul>";
          html += "  <li>";
          html += "<div >";
          html += " <div >";
          html += "</div>";

          html += ` <tr><td><span style="font-weight: bold; color: #986801">작성자:</span></td><td><span>\${data[i].member_nickName}</span></br></td></tr>`;
          html += ` <td><span style="font-weight: bold; color: #986801">내용:</span></td><td><span>\${data[i].content}</span></td>`;
        }
        html += "  </div>";
        html += "  </div>";
        html += "  </ul>";
        html += "  </table>";
        $("#comments").html(html);
        console.log('성공 자바스크립트' + data)
        document.getElementById('content').value = '';
        // listReview(url);
      },
      error   : function (error) {
        console.log(error + '실패 자바스크립트')
      }
    });
  }*/
  function writeReview() {
    var url = window.location.href;
    $.ajax({
      url: "/writeReview",
      type: "POST",
      dataType: 'json',
      data: {content: $("#content").val(), url: url},
      success: function (data) {
        console.log('write okokokokok');
        listReview();
        /* const message = function () {
           var result = data;
           let html = "<h4 class='comment-title'>리뷰</h4><table border='1' style='height: 100%; width: 100%;'>";
           for (let i = 0; i < result.length; i++) {
             console.log(data[i].content);
             console.log(data[i].member_nickName);
             console.log(data[i].id);
             html += "<ul>";
             html += "  <li>";
             html += "<div >";
             html += " <div >";
             html += "</div>";

             html += ` <tr><td><span style="font-weight: bold; color: #986801">작성자:</span></td><td><span>\${data[i].member_nickName}</span></br></td></tr>`;
             html += ` <td><span style="font-weight: bold; color: #986801">내용:</span></td><td><span>\${data[i].content}</span></td>`;
           }
           html += "  </div>";
           html += "  </div>";
           html += "  </ul>";
           html += "  </table>";
           $("#comments").html(html);
           console.log('성공 자바스크립트' + data)
           document.getElementById('content').value = '';
           // listReview(url);
         }*/
       // setTimeout(message, 3000);
      }
    })
  }
  function next(data){
    const message = function (data) {
      var result = data;
      let html = "<h4 class='comment-title'>리뷰</h4><table style='height: 100%; width: 100%;' >";
      for (let i = 0; i < result.length; i++) {
        console.log(data[i].content);
      //  html += "<ul>";
       // html += "  <li>";
       // html += "<div >";
       // html += " <div >";
       // html += "</div>";

        html += ` <tr><td><span style="font-weight: bold; color: #986801">작성자:</span></td><td><span>\${data[i].member_nickName}</span></br></td></tr>`;
        html += ` <td><span style="font-weight: bold; color: #986801">내용:</span></td><td><span>\${data[i].content}</span></td>`;
      }
      //html += "  </div>";
      //html += "  </div>";
      //html += "  </ul>";
      html += "  </table>";
      $("#comments").html(html);
      console.log('성공 자바스크립트' + data)
      document.getElementById('content').value = '';
      // listReview(url);
    }
  }
  function listReview() {
    var url2 = window.location.href;

    $.ajax({
      url: "/reviewList",
      type: "POST",
      dataType: 'json',
      data    : {url: url2},
      success: function (data) {
        console.log('revilist ajax2222');
        var result = data;
        let html = "<h4 class='comment-title'>리뷰</h4><table border='1' style='height: 100%; width: 100%;'>";
        for (let i = 0; i < result.length; i++) {
          console.log(data[i].content);
          html += "<ul>";
          html += "  <li>";
          html += "<div >";
          html += " <div >";
          html += "</div>";

          html += ` <tr><td><span style="font-weight: bold; color: #986801">작성자:</span></td><td><span>\${data[i].nickName}</span></br></td></tr>`;
          html += ` <td><span style="font-weight: bold; color: #986801">내용:</span></td><td><span>\${data[i].content}</span></td>`;
        }
        html += "  </div>";
        html += "  </div>";
        html += "  </ul>";
        html += "  </table>";
        $("#comments").html(html);
        console.log('성공 자바스크립트' + data)
        document.getElementById('content').value = '';

      }
    });
  }

</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/jquery.countdown.min.js"></script>
<script src="resources/js/jquery.nice-select.min.js"></script>

<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/scripts.js"></script>
</body>
</html>