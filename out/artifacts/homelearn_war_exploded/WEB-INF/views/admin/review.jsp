<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp"/>

<!DOCTYPE html>
      <!-- Content wrapper -->
      <div class="content-wrapper">
        <!-- Content -->
        <div class="container-xxl flex-grow-1 container-p-y">
          <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"> Review /</span> Reivew Tables</h4>

          <!-- Striped Rows -->
          <div class="card">
            <h5 class="card-header">Striped rows</h5>
            <div class="table-responsive text-nowrap">
              <table class="table table-striped">
                <thead>
                <tr>
                  <th>Id</th>
                  <th>강좌명</th>
                  <th>내용</th>
                  <th>평가</th>
                  <th>작성자</th>
                  <th>작성일</th>
                </tr>
                </thead>

                <c:forEach items="${list}" var="review">
                <tbody class="table-border-bottom-0">
                  <td><strong>#${review.id}</strong></td>
                  <td>${review.courseName}</td>
                  <td>${review.content}</td>
                  <td>${review.score}</td>
                  <td>${review.nickName}</td>

                  <fmt:formatDate value="${course.createdAt}" var="date" pattern="yyyy-MM-dd" />
                  <jsp:useBean id="dateValue" class="java.util.Date"/>
                  <jsp:setProperty name="dateValue" property="time" value="${course.createdAt}"/>
                  <fmt:formatDate value="${dateValue}" var="date" pattern="yyyy-MM-dd"/>
                  <td>${date}</td>
                  <td>
                    <button type="button" class="btn btn-warning">삭제</button>
                  </td>
                </tr>
                </tbody>
                </c:forEach>
              </table>
            </div>
          </div>
          <!--/ Striped Rows -->
        <!-- / Content -->
        </div>
<jsp:include page="footer.jsp"/>