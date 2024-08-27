<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<jsp:include page="header.jsp"/>

<!DOCTYPE html>
<!-- Content wrapper -->
<div class="content-wrapper">
  <!-- Content -->
  <div class="container-xxl flex-grow-1 container-p-y">
    <div class="row">
      <!-- 매출 -->
      <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4" style="height: 500px">
        <div class="card" style="height: 500px">
          <div class="row row-bordered g-0">
            <div class="col-md-8">
              <h5 class="card-header m-0 me-2 pb-3">매출</h5>
              <!--CJS Start-->
              <div style="width: 700px">
                <canvas id="myChart1"></canvas>
              </div>
              <script>
                const ctx1 = document.querySelector('#myChart1');

                new Chart(ctx1, {
                  type: 'bar',
                  data: {
                    labels: [
                      'January',
                      'February',
                      'March',
                      'April',
                      'May',
                      'June',
                      'July',
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
                      },
                      {
                        data: [61, 70, 50, 91, 76, 65, 80],
                        backgroundColor: [
                          'rgba(255, 159, 64, 0.2)',
                        ],
                        borderColor: [
                          'rgb(255, 159, 64)',
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

      <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
        <div class="row">

          <!-- 일일 가입자 수-->
          <div class="col-6 mb-4">
            <div class="card">
              <div class="card-body">
                <div class="card-title d-flex align-items-start justify-content-between">
                  <div class="avatar flex-shrink-0">
                    <img src="../assets/img/icons/unicons/paypal.png" alt="Credit Card" class="rounded" />
                  </div>
                  <div class="dropdown">
                    <button
                            class="btn p-0"
                            type="button"
                            id="cardOpt4"
                            data-bs-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                    >
                      <i class="bx bx-dots-vertical-rounded"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt4">
                      <a class="dropdown-item" href="javascript:void(0);">View More</a>
                      <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                    </div>
                  </div>
                </div>
                <span class="d-block mb-1">일일 가입자 수</span>
                <h3 class="card-title text-nowrap mb-2">${todayCnt}</h3>
                <small class="text-danger fw-semibold"><i class="bx bx-down-arrow-alt"></i> -14.82%</small>
              </div>
            </div>
          </div>
          <!-- /일일 가입자 수-->

          <!-- 총 회원 수-->
          <div class="col-6 mb-4">
            <div class="card">
              <div class="card-body">
                <div class="card-title d-flex align-items-start justify-content-between">
                  <div class="avatar flex-shrink-0">
                    <img src="../assets/img/icons/unicons/cc-primary.png" alt="Credit Card" class="rounded" />
                  </div>
                  <div class="dropdown">
                    <button
                            class="btn p-0"
                            type="button"
                            id="cardOpt1"
                            data-bs-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                    >
                      <i class="bx bx-dots-vertical-rounded"></i>
                    </button>
                    <div class="dropdown-menu" aria-labelledby="cardOpt1">
                      <a class="dropdown-item" href="javascript:void(0);">View More</a>
                      <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                    </div>
                  </div>
                </div>
                <span class="fw-semibold d-block mb-1">총 회원 수</span>
                <h3 class="card-title mb-2">${totalCnt}</h3>
                <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +28.14%</small>
              </div>
            </div>
          </div>
          <!--/총 회원 수-->

          <!-- 이번 주 가입자 수-->
          <div class="col-12 mb-4">
            <div class="card" style="height: 290px;">
              <div class="card-body">
                <div class="card-header">
                  <h5 class="m-0 me-2">이번 주 가입자 수</h5>
                </div>
                <div class="card-body px-0">
                  <div class="tab-content p-0">
                    <div class="tab-pane fade show active" id="navs-tabs-line-card-income" role="tabpanel">

                      <!--CJS Start-->
                      <div style="width: 370px">
                        <canvas id="myChart2"></canvas>
                      </div>
                      <script>
                        const jData = JSON.parse('${json}');
                        const labelList = new Array();
                        const valueList = new Array();

                        for(let i=0; i<jData.length; i++){
                          let d = jData[i];
                          labelList.push(d.day);
                          valueList.push(d.cnt);
                        }

                        const ctx2 = document.querySelector('#myChart2');

                        new Chart(ctx2, {
                          type: 'line',
                          data: {
                            labels: labelList,
                            datasets: [
                              {
                                data: valueList,
                                backgroundColor: [
                                  'rgba(75, 192, 192, 0.3)',
                                ],
                                fill: true
                              }
                            ],
                            options: {
                              scales: {
                                yAxes: {
                                  beginAtZero: true,
                                  ticks:{
                                    stepSize: 1
                                  }
                                }
                              },
                              plugins: {
                                title: {
                                  display: true,
                                  text: '이번 주 가입자',
                                  font: {
                                    size: 20
                                  }
                                }
                              }
                            }
                          }
                        });
                      </script>
                      <!--CJS END-->
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- /이번주 가입자 수-->
        </div>
      </div>
    </div>
    <div class="row">

      <!-- 과목별 강좌 구매율 -->
      <div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
        <div class="card h-100">
          <div class="card-header d-flex align-items-center justify-content-between pb-0">
            <div class="card-title mb-0">
              <h5 class="m-0 me-2">과목별 강좌 구매율</h5>
            </div>
          </div>
          <div class="card-body">
            <!--CJS Start-->
            <div style="width: 370px" style="height: 370px">
              <canvas id="myChart3"></canvas>
            </div>
            <script>
              const jData2 = JSON.parse('${json2}');
              const labelList2 = new Array();
              const valueList2 = new Array();

              for(let i=0; i<jData2.length; i++){
                let d = jData2[i];
                labelList2.push(d.name);
                valueList2.push(d.cnt);
              }

              const ctx = document.querySelector('#myChart3');

              new Chart(ctx, {
                type: 'doughnut',
                data: {
                  labels: labelList2,
                  datasets: [
                    {
                      data: valueList2,
                      borderWidth: 1,
                      backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(255, 205, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                      ],
                      borderColor: [
                        'rgb(255, 99, 132)',
                        'rgb(255, 159, 64)',
                        'rgb(255, 205, 86)',
                        'rgb(75, 192, 192)',
                        'rgb(54, 162, 235)',
                        'rgb(153, 102, 255)',
                        'rgb(201, 203, 207)'
                      ],
                      hoverOffset: 4
                    }
                  ]
                },
                options: {
                  indexAxis: 'y',
                }
              });
            </script>
            <!--CJS END-->
          </div>
        </div>
      </div>
      <!--/ 과목별 강좌 구매율 -->

      <!-- 강좌 구매 순위 -->
      <div class="col-md-6 col-lg-4 order-1 mb-4">
        <div class="card h-100">
          <div class="card-header d-flex align-items-center justify-content-between">
            <h5 class="card-title m-0 me-2">강좌 구매 순위</h5>
          </div>
          <div class="card-body">
            <ul class="p-0 m-0">
              <c:forEach items="${rankingList}" var="ranking">
                <li class="d-flex mb-4 pb-1">
                  <div class="avatar flex-shrink-0 me-3">
                    <img src="../assets/img/icons/unicons/paypal.png" alt="User" class="rounded" />
                  </div>
                  <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                    <div class="me-2">
                      <small class="text-muted d-block mb-1">${ranking.teacherName}</small>
                      <h6 class="mb-0">${ranking.courseName}</h6>
                    </div>
                    <div class="user-progress d-flex align-items-center gap-1">
                      <h6 class="mb-0">+${ranking.cnt}</h6>
                      <span class="text-muted">수강생</span>
                    </div>
                  </div>
                </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </div>
      <!--/ 과목별 강좌 순위 -->

      <!-- 과목별 강좌 수 -->
      <div class="col-md-6 col-lg-4 order-2 mb-4">
        <div class="card h-100">

          <div class="card-header">
            <h5 class="m-0 me-2">과목별 강좌 수</h5>
          </div>
          <div class="card-body px-0">
            <div class="tab-content p-0">
              <div class="tab-pane fade show active" id="과목별 강좌 수" role="tabpanel">

                <!--CJS Start-->
                <div style="width: 400px">
                  <canvas id="myChart4"></canvas>
                </div>
                <script>
                  const ctx3 = document.querySelector('#myChart4');

                  new Chart(ctx3, {
                    type: 'polarArea',
                    data: {
                      labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
                      datasets: [
                        {
                          label: '2024 Sales',
                          backgroundColor: [
                            'rgba(255,215,222,0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(153, 102, 255, 0.2)'
                          ],
                          borderColor: [
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                            'rgb(153, 102, 255)',
                            'rgb(201, 203, 207)'
                          ],
                          data: [300, 700, 450, 750, 450]
                        }
                      ]
                    }
                  });
                </script>
                <!--CJS END-->
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/ 과목별 강좌 수 -->

    </div>
  </div>
  <!-- / Content -->
</div>
<!-- Footer -->
<jsp:include page="footer.jsp"/>