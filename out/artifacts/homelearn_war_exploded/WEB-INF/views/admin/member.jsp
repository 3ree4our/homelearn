<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp"/>

<!DOCTYPE html>
<!-- Content wrapper -->
<div class="content-wrapper">
  <!-- Content -->
  <div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"> Member /</span> Member Tables</h4>

    <div class="btn-group">
      <button
              type="button"
              class="btn btn-secondary dropdown-toggle"
              data-bs-toggle="dropdown"
              aria-expanded="false"
      >
        전체
      </button>
      <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="javascript:void(0);">학생</a></li>
        <li><a class="dropdown-item" href="javascript:void(0);">교사</a></li>
        <li><a class="dropdown-item" href="javascript:void(0);">관리자</a></li>
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
                    <a class="dropdown-item" href="javascript:void(0);" data-bs-toggle="modal"
                       data-bs-target="#backDropModal"
                    ><i class="bx bx-edit-alt me-1"></i> Edit </a
                    >
                    <a class="dropdown-item" href="javascript:void(0);" onclick="delOk()"
                    ><i class="bx bx-trash me-1"></i> Delete </a
                    >
                  </div>
                </div>
                <script>
                  function delOk(){
                    if(!confirm('삭제하시겠습니까?')) return false;
                  }

                  /*$('#backDropModal').on('hidden.bs.modal', function (e){
                    console.log('모달닫기이');
                    document.forms['modal-content'].reset();
                  });*/
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
                                    placeholder="${member.email}"
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
                                    placeholder="${member.nickname}"
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
                                    placeholder="${member.role}"
                                    readonly=""
                            />
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                          Close
                        </button>
                        <button type="button" class="btn btn-primary">Save</button>
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

    <br>
    <div>
      <nav aria-label="Page navigation">
        <ul class="pagination">
          <li class="page-item prev">
            <a class="page-link" href="javascript:void(0);"
            ><i class="tf-icon bx bx-chevrons-left"></i
            ></a>
          </li>
          <li class="page-item">
            <a class="page-link" href="javascript:void(0);">1</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="javascript:void(0);">2</a>
          </li>
          <li class="page-item active">
            <a class="page-link" href="javascript:void(0);">3</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="javascript:void(0);">4</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="javascript:void(0);">5</a>
          </li>
          <li class="page-item next">
            <a class="page-link" href="javascript:void(0);"
            ><i class="tf-icon bx bx-chevrons-right"></i
            ></a>
          </li>
        </ul>
      </nav>
    </div>
    <hr class="my-5" />
  </div>
  <!-- / Content -->
</div>
<jsp:include page="footer.jsp"/>