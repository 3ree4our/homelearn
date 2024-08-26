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

    <!-- Search -->
    <div class="navbar-nav align-items-center">
      <div class="nav-item d-flex align-items-center">
        <i class="bx bx-search fs-4 lh-0"></i>
        <input
                type="text"
                class="form-control border-0 shadow-none"
                placeholder="Search${pageContext.request.contextPath}/resources/admin."
                aria-label="Search${pageContext.request.contextPath}/resources/admin."
        />
      </div>
    </div>
    <br>
    <!-- /Search -->

    <!-- Striped Rows -->
    <div class="card">
      <h5 class="card-header">강의 목록</h5>
      <div class="table-responsive text-nowrap">
        <table class="table table-striped">
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
            <td><a class="member-search" href="/courses/memberList?courseId=${course.id}">${course.courseName}</a></td>
            <td>${course.teacherName}</td>
            <td>${course.price}</td>
            <td>${course.period}</td>
            <fmt:formatDate value="${course.createdAt}" var="date" pattern="yyyy-MM-dd"/>
            <td>${date}</td>
            <td>

              <div class="col">
                <button
                        type="button"
                        class="btn btn-primary"
                        data-bs-toggle="tooltip"
                        data-bs-offset="0,4"
                        data-bs-placement="bottom"
                        data-bs-html="true"
                        title="<i class='bx bx-heart bx-xs' ></i> <span>수강 전인 회원 <br>환불 처리 후 삭제 가능</span>"
                >
                  삭제
                </button>
              </div>

            </td>
            </tr>
            </tbody>
          </c:forEach>
        </table>
      </div>
    </div>
    <!--/ Striped Rows -->

    <br><br>

    <!-- Striped Rows -->
    <div class="card">
      <h5 class="card-header">수강 회원</h5>
      <div class="table-responsive text-nowrap">
        <table class="table table-striped">
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
          <tbody class="table-border-bottom-0">
            <tr>
              //여기 데이터 뿌려어
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <!-- /Striped Rows -->


    <hr class="my-5" />
<script type="text/javascript" language="javascript"
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script type="text/javascript">
      $(function(){
        $(".member-search").on("click", function (event){
          event.preventDefault();

          //변수생성
          //바로 받는게 아니라 데이터 뿌릴 곳 받은 다음에

          $.ajax({
            url: "/courses/memberList",
            type: "GET",
            data: {courseId: ${courseId}},
            dataType: "JSON",
            success: function(data){
              $('.table-border-bottom-0').html(
                  `
                  <c:if test="${empty memberList}">
                    <tr>
                      <td align="center" colspan="7">수강 중인 회원이 없음</td>
                    </tr>
                  </c:if>

                  <c:forEach items="${memberList}" var="member">
                    <tr>
                      <td><strong>#${member.id}</strong></td>
                      <td>${member.email}</td>
                      <td>${member.nickname}</td>
                      <td>${member.role}</td>
                      <fmt:formatDate value="${member.createdAt}" var="date" pattern="yyyy-MM-dd"/>
                      <td>${date}</td>
                      <td>${member.started}</td>
                      <td>
                        <c:choose>
                          <c:when test="${member.refunded == 1}">환불 완료</c:when>
                          <c:otherwise>
                            <c:choose>
                              <c:when test="${member.started == '수강시작'}">환불 불가</c:when>
                              <c:when test="${member.started == '수강전'}">
                                <button class="btn btn-info">환불</button>
                              </c:when>
                            </c:choose>
                          </c:otherwise>
                        </c:choose>
                      </td>
                    </tr>
                  </c:forEach> `
              );
            },
            error: function(){
              console.error('Error fetching course details:', error);
            }
          })
        })
      })
    </script>

    <!-- Striped Rows -->
<%--    <div class="card">
      <h5 class="card-header">수강 회원</h5>
      <div class="table-responsive text-nowrap">
        <table class="table table-striped">
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

          <c:if test="${empty memberList}">
            <tbody class="table-border-bottom-0">
              <td align="center" colspan="7">수강 중인 회원이 없음</td>
            </tbody>
          </c:if>

          <c:forEach items="${memberList}" var="member">
            <tbody class="table-border-bottom-0">
              <td><strong>#${member.id}</strong></td>
              <td>${member.email}</td>
              <td>${member.nickname}</td>
              <td>${member.role}</td>
                <fmt:formatDate value="${member.createdAt}" var="date" pattern="yyyy-MM-dd"/>
              <td>${date}</td>
              <td>${member.started}</td>
              <td>
                <c:choose>
                  <c:when test="${member.refunded == 1}">환불 완료</c:when>
                  <c:otherwise>
                    <c:choose>
                      <c:when test="${member.started == '수강시작'}">환불 불가</c:when>
                      <c:when test="${member.started == '수강전'}"> <button class="btn btn-info">환불</button></c:when>
                    </c:choose>
                  </c:otherwise>
                </c:choose>
              </td>
          </div>
        </tbody>
      </c:forEach>
      </table>
    </div>
  </div>--%>
  <!--/ Striped Rows -->

  <hr class="my-5" />
  <!-- / Content -->
</div>
<jsp:include page="footer.jsp"/>