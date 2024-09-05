<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="header.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!DOCTYPE html>
<!-- Content wrapper -->
<div class="content-wrapper">
  <!-- Content -->
  <div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"> Member /</span> Member Tables</h4>

    <!-- 이번 주 가입자 수 -->
    <div class="col-12 mb-4" style="display: flex; justify-content: center">
      <div class="card" style="height: 300px; width: 470px; justify-content: center; align-items: center;">
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

    <div class="btn-group">
      <button
              type="button"
              class="btn btn-secondary dropdown-toggle"
              data-bs-toggle="dropdown"
              aria-expanded="false"
      >
        ${selectedRole}
      </button>
      <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="javascript:void(0);" onclick="filterMembers('전체')">전체</a></li>
        <li><a class="dropdown-item" href="javascript:void(0);" onclick="filterMembers('ROLE_MEMBER')">학생</a></li>
        <li><a class="dropdown-item" href="javascript:void(0);" onclick="filterMembers('ROLE_TEACHER')">교사</a></li>
        <li><a class="dropdown-item" href="javascript:void(0);" onclick="filterMembers('ROLE_ADMIN')">관리자</a></li>
      </ul>
    </div>
    <br><br>

    <!-- Striped Rows -->
    <div class="card">
      <h5 class="card-header">회원</h5>
      <div class="table-responsive text-nowrap">
        <table class="table table-striped">
          <thead>
          <tr>
            <th>Id</th>
            <th>Email</th>
            <th>Nickname</th>
            <th>Role</th>
            <th>SignDate</th>
            <th>Withdrawal</th>
          </tr>
          </thead>

          <c:forEach items="${memberList}" var="member">
            <tbody class="table-border-bottom-0">
            <td><strong>#${member.id}</strong></td>
            <td>${member.email}</td>
            <td>${member.nickname}</td>
            <td>${member.role}</td>
            <fmt:formatDate value="${member.createdAt}" var="date" pattern="yyyy-MM-dd"/>
            <td>${date}</td>
            <td>${member.deleteYn}</td>
            <td>

              <!-- Modal Backdrop -->
              <div class="col-lg-4 col-md-3">
                <!-- Button trigger modal -->
                <div class="dropdown">
                  <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                    <i class="bx bx-dots-vertical-rounded"></i>
                  </button>
                  <div class="dropdown-menu">
                    <c:choose>
                      <c:when test="${member.deleteYn == '회원'}">
                        <a class="dropdown-item" href="javascript:void(0);" data-bs-toggle="modal"
                           data-bs-target="#backDropModal"
                           data-id="${member.id}"
                           data-email="${member.email}"
                           data-nickname="${member.nickname}"
                           data-role="${member.role}">
                          <i class="bx bx-edit-alt me-1"></i> 수정 </a>
                        <a class="dropdown-item" href="javascript:void(0);" onclick="delOk(${member.id})">
                          <i class="bx bx-trash me-1"></i> 탈퇴
                        </a>
                      </c:when>
                      <c:otherwise>
                        <a class="dropdown-item" href="javascript:void(0);" onclick="delNoOk(${member.id})">
                          <i class="bx bx-redo me-1"></i> 복구
                        </a>
                      </c:otherwise>
                    </c:choose>
                  </div>
                </div>

                <script>
                  function saveMemberChanges() {
                    const id = $('#backDropModal').data('memberId');
                    const nickname = $('#nicknameBackdrop').val();

                    $.ajax({
                      url: '/mgmt/member/update',
                      type: 'POST',
                      data: {id: id, nickname: nickname},
                      success: function(response) {
                        if(response.success) {
                          alert('회원 정보가 수정되었습니다.');
                          location.reload();
                        }
                      },
                      error: function() {
                        alert('err');
                      }
                    });
                  }

                  function delOk(memberId){
                    if(confirm('이 회원을 탈퇴 시키겠습니까?')) {
                      $.ajax({
                        url: '/mgmt/member/update',
                        type: 'POST',
                        data: {id: memberId, deleteYn: '탈퇴'},
                        success: function(response){
                          if(response.success) {
                            alert('회원이 성공적으로 탈퇴처리 되었습니다.');
                            location.reload();
                          }
                        },
                        error: function(){
                          alert('err');
                        }
                      });
                    }
                  }

                  function delNoOk(memberId) {
                    if(confirm('이 회원을 복구 하시겠습니까?')) {
                      $.ajax({
                        url: '/mgmt/member/update',
                        type: 'POST',
                        data: {id: memberId, deleteYn: '회원'},
                        success: function(response){
                          if(response.success) {
                            alert('회원을 성공적으로 복구하였습니다.');
                            location.reload();
                          }
                        },
                        error: function(){
                          alert('err');
                        }
                      });
                    }
                  }

                  $(document).ready(function() {
                    $('#backDropModal').on('show.bs.modal', function (e) {
                      const button = $(e.relatedTarget);
                      const id = button.data('id');
                      const email = button.data('email');
                      const nickname = button.data('nickname');
                      const role = button.data('role');

                      const modal = $(this);
                      modal.data('memberId', id);
                      modal.find('.modal-title').text('Edit Member #' + id);
                      modal.find('#emailBackdrop').val(email);
                      modal.find('#nicknameBackdrop').val(nickname);
                      modal.find('#roleBackdrop').val(role);
                    });

                    $('#backDropModal').on('hidden.bs.modal', function (e) {
                      $(this).find('form')[0].reset();
                    });
                  });
                </script>

                <!-- Modal -->
                <div class="modal fade" id="backDropModal" data-bs-backdrop="static" tabindex="-1">
                  <div class="modal-dialog">
                    <form class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="backDropModalTitle">Modal title</h5>
                        <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                        ></button>
                      </div>
                      <div class="modal-body">
                        <div class="row">
                          <div class="col mb-3">
                            <label for="emailBackdrop" class="form-label">Email</label>
                            <input
                                    type="text"
                                    id="emailBackdrop"
                                    class="form-control"
                                    value=""
                                    readonly
                            />
                          </div>
                        </div>
                        <div class="row g-2">
                          <div class="col mb-0">
                            <label for="nicknameBackdrop" class="form-label">Nickname</label>
                            <input
                                    type="text"
                                    id="nicknameBackdrop"
                                    class="form-control"
                                    value=""
                            />
                          </div>
                        </div>
                        <br>
                        <div class="row g-2">
                          <div class="col mb-0">
                            <label for="roleBackdrop" class="form-label">Role</label>
                            <input
                                    type="text"
                                    id="roleBackdrop"
                                    class="form-control"
                                    value=""
                                    readonly
                            />
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                          닫기
                        </button>
                        <button type="button" class="btn btn-primary" onclick="saveMemberChanges()">저장</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </td>
            </tbody>
          </c:forEach>
        </table>
      </div>
    </div>
    <!--/ Striped Rows -->

    <hr class="my-5" />
  </div>
  <!-- / Content -->
  <script>
    function filterMembers(role) {
      window.location.href = '/mgmt/member/list?role=' + encodeURIComponent(role);
    }
  </script>
</div>
<jsp:include page="footer.jsp"/>