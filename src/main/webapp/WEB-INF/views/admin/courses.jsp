<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp"/>

<!DOCTYPE html>
<!-- Content wrapper -->
<div class="content-wrapper">
  <!-- Content -->
  <div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"> Courses /</span> Couses Tables</h4>
    <!-- Striped Rows -->
    <div class="card">
      <h5 class="card-header">강의 목록</h5>
      <div class="table-responsive text-nowrap">
        <table class="table table-striped" id="courseTable">
          <thead>
          <tr>
            <th>Id</th>
            <th>CourseName</th>
            <th>TeacherName</th>
            <th>Price</th>
            <th>Period</th>
            <th>Created_at</th>
          </tr>
          </thead>

          <c:forEach items="${courseList}" var="course">
            <c:set var="courseId" value="${course.id}"/>
            <tbody class="table-border-bottom-0">
            <td><strong>#${course.id}</strong></td>
            <td><a class="member-search" href="javascript:(0)" data-course-id="${course.id}">${course.courseName}</a></td>
            <td>${course.teacherName}</td>
            <td>${course.price}</td>
            <td>${course.period}</td>

            <fmt:formatDate value="${course.createdAt}" var="date" pattern="yyyy-MM-dd"/>
            <td>${date}</td>
            <td>

              <div class="col">
                <button
                        type="button"
                        class="btn btn-primary delete-course"
                        data-bs-toggle="tooltip"
                        data-bs-offset="0,4"
                        data-bs-placement="bottom"
                        data-bs-html="true"
                        title="<i class='bx bx-heart bx-xs' ></i> <span>수강 전인 회원 모두<br>환불 처리 후 삭제 가능</span>"
                        data-course-id="${course.id}">
                  삭제
                </button>
              </div>
            </td>
            </tbody>
          </c:forEach>
        </table>
      </div>
    </div>
    <!--/ Striped Rows -->

    <hr class="my-5" />

    <!-- Striped Rows -->
    <div class="card" id="memberListContainer" style="display: none">
      <h5 class="card-header">수강 회원</h5>
      <div class="table-responsive text-nowrap">
        <table class="table table-striped" id="memberTable">
          <thead>
          <tr>
            <th>Id</th>
            <th>Email</th>
            <th>Nickname</th>
            <th>Role</th>
            <th>SignDate</th>
            <th>Started</th>
            <td>Refunde</td>
          </tr>
          </thead>
          <tbody class="table-border-bottom-0" id="memberTableBody">

          </tbody>
        </table>
      </div>
    </div>
    <!-- /Striped Rows -->

    <script type="text/javascript" language="javascript"
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script type="text/javascript">
      $(function() {
        $("#courseTable").on("click", ".member-search", function (e) {
          e.preventDefault();
          const courseId = $(this).data("course-id");

          $.ajax({
            url: '/mgmt/course/memberList',
            type: 'GET',
            data: {'courseId': courseId},
            dataType: 'JSON',
            success: function (data) {
              var html = '';
              if (data.length == 0) {
                html = `<tr>
                          <td align="center" colspan="7">수강 중인 회원이 없습니다</td>
                        </tr>`
              } else {
                $.each(data, function (index, member) {
                  html += '<tr>' +
                      '<td><strong>#' + member.id + '</strong></td>' +
                      '<td>' + member.email + '</td>' +
                      '<td>' + member.nickname + '</td>' +
                      '<td>' + member.role + '</td>' +
                      '<td>' + formatDate(member.createdAt) + '</td>' +
                      '<td>' + member.started + '</td>' +
                      '<td>' + getRefundButton(member) + '</td>' +
                      '</tr>';
                });
              }
              $("#memberTableBody").html(html);
              $("#memberListContainer").show();
            },
            error: function () {
              console.error('Error fetching course details:', error);
            }
          });

          $(".delete-course").on("click", function () {
            const courseId = $(this).data("course-id");
            checkCourseMembers(courseId);
          });

          $("#memberTableBody").on("click", ".refund-btn", function () {
            const memberId = $(this).data("member-id");
            const courseId = $(this).data("course-id");
            refundMember(memberId, courseId);
          });

          function checkCourseMembers(courseId) {
            $.ajax({
              url: '/mgmt/course/memberList',
              type: 'GET',
              data: {'courseId': courseId},
              dataType: 'JSON',
              success: function (data) {
                let canDelete = true;
                for (let member of data) {
                  if (member.started === '수강전' && member.refunded === 0) {
                    canDelete = false;
                    break;
                  }
                }
                if (canDelete) {
                  deleteCourse(courseId);
                } else {
                  alert("수강 전인 회원이 있습니다");
                }
              },
              error: function (error) {
                console.error('Error checking course members:', error);
              }
            });
          }

          function deleteCourse(courseId) {
            if (confirm("이 강의를 삭제하시겠습니까?")) {
              $.ajax({
                url: '/mgmt/course/delete',
                type: 'POST',
                data: {'courseId': courseId},
                success: function (response) {
                  if (response.success) {
                    alert("강의가 성공적으로 삭제되었습니다.");
                    location.reload();
                  } else {
                    alert("강의 삭제 실패");
                  }
                },
                error: function (error) {
                  console.error('Error deleting course:', error);
                }
              });
            }
          }

          function refundMember(memberId, courseId) {
            if (confirm("이 회원의 수강을 환불하시겠습니까?")) {
              $.ajax({
                url: '/mgmt/course/refund',
                type: 'POST',
                data: {'memberId': memberId, 'courseId': courseId},
                success: function (response) {
                  if (response.success) {
                    alert("환불이 성공적으로 처리되었습니다.");
                  } else {
                    alert("환불 처리 실패");
                  }
                },
                error: function (error) {
                  console.error('Error processing refund:', error);
                }
              });
            }
          }

          function getRefundButton(member) {
            if (member.refunded == 1) {
              return '환불 완료';
            } else if (member.started == '수강시작') {
              return '환불 불가';
            } else if (member.started == '수강전') {
              return '<button class="btn btn-info refund-btn" data-member-id="' + member.id + '" data-course-id="' + member.courseId + '">환불</button>';
            }
            return '';
          }

          function formatDate(dateString) {
            var date = new Date(dateString);
            return date.getFullYear() + '-' +
                ('0' + (date.getMonth() + 1)).slice(-2) + '-' +
                ('0' + date.getDate()).slice(-2);
          }
        });
      });
    </script>

    <!-- / Content -->
  </div>
<jsp:include page="footer.jsp"/>