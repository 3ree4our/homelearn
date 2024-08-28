<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="header.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!DOCTYPE html>
<!-- Content wrapper -->
<div class="content-wrapper">
<!-- / Content -->
  <div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"> Order /</span> Order Tables</h4>
      <!-- 매출 -->
      <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
        <div class="card" style="height: 500px;">
          <div class="row row-bordered g-0">
            <div class="col-md-8">
              <h5 class="card-header m-0 me-2 pb-3">매출</h5>
              <!--CJS Start-->
              <div style="width: 700px; margin: 0 auto;">
                <canvas id="myChart1"></canvas>
              </div>
              <script>
                const ctx1 = document.querySelector('#myChart1');

                new Chart(ctx1, {
                  type: 'bar',
                  data: {
                    labels: [
                      '1월',
                      '2월',
                      '3월',
                      '4월',
                      '5월',
                      '6월',
                      '7월',
                      '8월',
                      '9월',
                      '10월',
                      '11월',
                      '12월',
                    ],
                    datasets: [
                      {
                        data: [65, 59, 80, 81, 56, 55, 40],
                        backgroundColor: [
                          'rgba(255, 99, 132, 0.2)',
                        ],
                        borderColor: [
                          'rgb(255, 99, 132)',
                        ],
                        borderWidth: 1,
                        hoverOffset: 4
                      }
                    ],
                    options: {
                      scales: {
                        y: {
                          beginAtZero: true,
                          ticks: {
                            stepSize: 10000
                          }
                        }
                      },
                      plugins: {
                        title: {
                          display: true,
                          text: '매출'
                        }
                      }
                    }
                  }
                });
              </script>
              <!--CJS END-->

            </div>
            <div class="col-md-4">
              <div class="card-body">
                <div class="text-center">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- /매출-->
    <!-- Striped Rows -->
    <div class="card">
      <h5 class="card-header">주문 목록</h5>
      <div class="table-responsive text-nowrap">
        <table class="table table-striped" id="orderTable">
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
                        data-course-id="${course.id}">
                  환불
                </button>
              </div>
            </td>
            </tbody>
          </c:forEach>
        </table>
      </div>
    </div>
    <!--/ Striped Rows -->
</div>

<jsp:include page="footer.jsp"/>