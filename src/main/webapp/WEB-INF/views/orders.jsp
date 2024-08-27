<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.threefour.homelearn.order.domain.GetOrdersResponse" %>
<%@ page import="org.threefour.homelearn.order.domain.GetOrderResponse" %>
<%@ page import="org.threefour.homelearn.cart.domain.PagingCount" %>
<%@ page import="static org.threefour.homelearn.cart.RequestConstant.*" %>
<%@ page import="static org.threefour.homelearn.order.RequestConstant.PAGING_COUNTS_PARAMETER_NAME" %>
<%@ page import="static org.threefour.homelearn.order.RequestConstant.SIZE_PARAMETER_NAME" %>
<%@ page import="static org.threefour.homelearn.order.RequestConstant.PAGE_NUMBER_PARAMETER_NAME" %>
<%@ include file="header.jsp" %>
<%
    GetOrdersResponse getOrdersResponse = (GetOrdersResponse) request.getAttribute(ORDERS_PARAMETER_NAME);
    PagingCount pagingCount = (PagingCount) request.getAttribute(PAGING_COUNTS_PARAMETER_NAME);
    int totalCount = pagingCount.getTotalCount();
    int pageCount = pagingCount.getPageCount();
    int size = (int) request.getAttribute(SIZE_PARAMETER_NAME);
    int pageNumber = (int) request.getAttribute(PAGE_NUMBER_PARAMETER_NAME);
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Page feature start -->
<section class="page-feature">
    <div class="container text-center">
        <h2>Orders</h2>
        <div class="breadcrumb">
            <a href="home.html">Home</a>
            <span>/ Orders</span>
        </div>
    </div>
</section>
<!-- Page feature end -->

<!-- Recent Posts Section -->
<section class="recent-posts" style="margin-top: 50px;">
    <div class="container">
        <div class="widget recent-courses" style="margin: 0 auto; max-width: 800px;">
            <h1 class="widget-title" style="margin-bottom: 20px; text-align: center;">주문 목록</h1>
            <ul style="margin-top: 20px; list-style-type: none; padding: 0;">
                <%
                    if (totalCount == 0 || getOrdersResponse.size() == 0) {
                %>
                <script>
                    $(document).ready(function () {
                        $("#pageSizeForm").hide();
                        $(".pagination.text-center").hide();
                    });
                </script>
                <li style="text-align: center; margin-top: 100px; flex: 1 1 100%;">
                    <h5 style="margin-top: 10px; font-size: 1.5em;">주문 내역이 없습니다.</h5>
                </li>
                <%
                } else {
                    for (int i = 0; i < getOrdersResponse.size(); i++) {
                        GetOrderResponse getOrderResponse = getOrdersResponse.get(i);
                %>
                <li style="margin-bottom: 30px; flex: 1 1 100%;">
                    <a href="order.do?impUid=<%= getOrderResponse.getImpUid() %>"
                       style="display: block; text-decoration: none; color: inherit; padding-left: 250px;">
                        <h5 style="margin-top: 10px;">주문번호: <%= getOrderResponse.getImpUid() %></h5>
                        <div class="meta-tags" style="font-size: 0.9em; color: gray; padding-left: 77px;">
                            <%
                                if (getOrderResponse.getRefundedAmount() > 0) {
                            %>
                            <span class="post-meta category">환불 완료</span> |
                            <%
                            } else {
                            %>
                            <span class="post-meta category">결제 완료</span> |
                            <%
                                }
                            %>
                            <span class="post-meta date"><%= getOrderResponse.getPaidAmount() %> 원</span>
                        </div>
                    </a>
                </li>
                <%
                        }
                    }
                %>
            </ul>
        </div>
    </div>
</section>
<!-- Recent Posts Section End -->

<!-- Blog Posts section start -->
<section class="blog-posts">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <%
                    if (getOrdersResponse.size() > 0) {
                %>
                <div class="pagination text-center" style="margin-bottom: 20px; display: inline-block;">
                    <%
                        for (int i = 1; i <= pageCount; i++) {
                    %>
                    <a href="orders.do?ordererId=<%= getOrdersResponse.get(0).getOrdererId() %>&size=<%= size %>&pageNumber=<%= i %>"
                       style="margin-right: 5px; padding: 5px 10px; text-decoration: none; color: inherit; border: 1px solid #ddd; border-radius: 5px;"><%= i %>
                    </a>
                    <%
                        }
                    %>
                    <a href="orders.do?ordererId=<%= getOrdersResponse.get(0).getOrdererId() %>&size=<%= size %>&pageNumber=<%= pageCount == pageNumber ? pageNumber : pageNumber + 1 %>"
                       style="padding: 5px 10px; text-decoration: none; color: inherit; border: 1px solid #ddd; border-radius: 5px;">Next</a>
                </div>
                <form id="pageSizeForm" method="GET" action="orders.do" class="text-center" style="margin-top: 20px;">
                    <input type="hidden" name="ordererId" value="<%= getOrdersResponse.get(0).getOrdererId() %>"/>
                    <div class="form-group" style="display: inline-block; margin-bottom: 20px;">
                        페이지 사이즈 :
                        <select id="pageSize" name="size" class="form-select"
                                style="width: auto; display: inline-block; margin-left: 10px;"
                                onchange="document.getElementById('pageSizeForm').submit()">
                            <option value="3" <%= size == 3 ? "selected" : "" %>>3</option>
                            <option value="5" <%= size == 5 ? "selected" : "" %>>5</option>
                            <option value="10" <%= size == 10 ? "selected" : "" %>>10</option>
                        </select>
                    </div>
                    <input type="hidden" name="pageNumber" value="1"/>
                </form>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</section>
<!-- Blog Posts section end -->

<%@ include file="footer.jsp" %>
</body>
</html>
