<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.threefour.homelearn.cart.domain.GetCartResponse" %>
<%@ page import="org.threefour.homelearn.course.domain.Course" %>
<%@ page import="static org.threefour.homelearn.cart.RequestConstant.*" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/css/themify-icons.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/css/fontawesome.min.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">


<c:import url="${pageContext.request.contextPath}/resources/common/jsp/header.jsp"/>

<%
  GetCartResponse getCartResponse = (GetCartResponse) request.getAttribute(CART_PARAMETER_NAME);
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/payment.js"></script>
<script>
    let totalPrice = 0;

    function updateTotalPrice() {
        $("#totalPrice").text(totalPrice.toLocaleString() + " 원");
    }

    function calculateTotalPrice() {
        totalPrice = 0;
        $("input[name='selectedCourses']:checked").each(function() {
            const price = parseFloat($(this).closest('li').find('.post-meta.date').text().replace(/[^0-9.-]+/g,""));
            if (!isNaN(price)) {
                totalPrice += price;
            }
        });
        updateTotalPrice();
    }

    $(document).ready(function() {
        $("#selectAll").on('change', function() {
            const isChecked = $(this).is(':checked');
            $("input[name='selectedCourses']").prop('checked', isChecked);
            calculateTotalPrice();
        });

        $("input[name='selectedCourses']").on('change', function() {
            if ($("#selectAll").is(':checked')) {
                $("#selectAll").prop('checked', false);
            }
            calculateTotalPrice();
        });

        $("#orderButton").on('click', async function() {
            const selectedCourses = [];
            const studentId = "<%= getCartResponse.getStudentId() %>";

            $("input[name='selectedCourses']:checked").each(function () {
                const cartCourseId = $(this).val();
                const courseId = $(this).closest('li').find('a').data('course-id');
                const courseName = $(this).closest('li').find('.course-name').text();

                selectedCourses.push({
                    cartCourseId: cartCourseId,
                    courseId: courseId,
                    courseName: courseName
                });
            });

            if (selectedCourses.length > 0) {
                const orderData = {
                    studentId: studentId,
                    orderedCourseRequests: selectedCourses,
                    orderPrice: totalPrice,
                };

                result = await requestPay(orderData);

                const paidOrderData = {
                    impUid: result.imp_uid,
                    merchantUid: result.merchant_uid,
                    ordererId: studentId,
                    paidAmount: result.paid_amount,
                    courseOrderRequests: selectedCourses
                }

                var paidOrderRequest = JSON.stringify(paidOrderData);

                requestOrder(paidOrderRequest);
            } else {
                alert("주문할 상품을 선택하세요.");
            }
        })
    });

    async function requestOrder(paidOrderRequest) {
        await $.ajax({
            type: "POST",
            url: "/submit-order.do",
            contentType: "application/json",
            data: paidOrderRequest,
            success: function () {
                location.href = "order.do?impUid=" + JSON.parse(paidOrderRequest).impUid
            },
            error: function () {
                alert('주문 요청에 실패했습니다. 다시 시도해 주세요.');
            }
        });
    });

    if (selectedCourses.length > 0) {
        const orderData = {
            studentId            : studentId,
            orderedCourseRequests: selectedCourses,
            orderPrice           : totalPrice,
        };

        result = await requestPay(orderData);

        const paidOrderData = {
            impUid             : result.imp_uid,
            merchantUid        : 'abcdafdsflkjasdf',
            ordererId          : studentId,
            paidAmount         : result.paid_amount,
            courseOrderRequests: selectedCourses
        }

        var paidOrderRequest = JSON.stringify(paidOrderData);

        requestOrder(paidOrderRequest);
    } else {
        alert("주문할 상품을 선택하세요.");
    }
    })
    });

    async function requestOrder(paidOrderRequest) {
        await $.ajax({
            type       : "POST",
            url        : "/submit-order.do",
            contentType: "application/json",
            data       : paidOrderRequest,
            success    : function () {
                location.href = "order.do?impUid=" + JSON.parse(paidOrderRequest).impUid
            },
            error      : function () {
                alert('요청에 실패했습니다. 다시 시도해 주세요.');
            }
        });
    }
</script>
<!-- Page feature start -->
<section class="page-feature">
  <div class="container text-center">
    <h2>Cart</h2>
    <div class="breadcrumb">
      <a href="home.html">Home</a>
      <span>/ Cart</span>
    </div>
  </div>
</section>
<!-- Page feature end -->

<!-- Recent Posts Section -->
<section class="recent-posts" style="margin-top: 50px;">
    <div class="container">
        <div class="widget recent-courses text-center">
            <h2 class="widget-title" style="margin-bottom: 40px;">장바구니 목록</h2>

            <ul style="margin-top: 20px; list-style-type: none; padding: 0; display: flex; flex-direction: column; align-items: flex-start;">
                <li style="display: flex; align-items: center; justify-content: flex-start; width: 12%; margin-bottom: 20px; padding: 10px; border: 1px solid #ddd; border-radius: 8px;">
                    <input type="checkbox" id="selectAll" style="margin-right: 10px; display: inline-block;">
                    <label for="selectAll" style="display: inline-block; margin: 0;">전체 선택</label>
                </li>

                <%
                    if (getCartResponse.size() == 0) {
                %>
                <li style="display: flex; justify-content: center; align-items: center; text-align: center; width: 100%; margin-top: 30px; height: 100px;">
                    <h5 style="margin-top: 0; font-size: 1.5em; width: 100%;">장바구니에 담긴 상품이 없습니다!</h5>
                </li>
                <%
                } else {
                    for (int i = 0; i < getCartResponse.size(); i++) {
                        Course course = getCartResponse.get(i).getCourse();
                %>
                <li style="display: flex; align-items: center; justify-content: space-between; width: 80%; margin-bottom: 30px; padding: 10px; border: 1px solid #ddd; border-radius: 8px;">
                    <input type="checkbox" name="selectedCourses" value="<%= getCartResponse.get(i).getId() %>" style="margin-right: 20px;">

                    <a href="courseDetail.do?course_id=<%= course.getId() %>" data-course-id="<%= course.getId() %>" style="flex-grow: 1; display: block; text-decoration: none; color: inherit; text-align: left;">
                        <img src="resources/images/${course.ffname}" alt="<%= course.getName() %>" style="width: 100px; height: auto; border-radius: 8px; float: left; margin-right: 20px;">
                        <div style="overflow: hidden;">
                            <h5 class="course-name" style="margin-top: 10px;"><%= course.getName() %></h5>
                            <div class="meta-tags" style="font-size: 0.9em; color: gray;">
                                <span class="post-meta category"><%= getCartResponse.get(i).getSubjectName() %></span> |
                                <span class="post-meta date"><%= course.getPrice() %> 원</span> |
                                <span class="post-meta period"><%= course.getPeriod() %> 일</span>
                            </div>
                        </div>
                    </a>

                    <form action="delete-cart-course.do" method="POST" style="margin-left: 20px;">
                        <input type="hidden" name="studentId" value="<%= getCartResponse.getStudentId() %>">
                        <input type="hidden" name="cartCourseId" value="<%= getCartResponse.get(i).getId() %>">
                        <button type="submit" class="btn btn-danger">삭제</button>
                    </form>
                </li>
                <%
                        }
                    }
                %>
            </ul>
        </div>
    </div>
  </div>
</section>

<!-- Total Price and Order Button Section Start -->
<section class="total-price" style="margin-top: 50px;">
  <div class="container text-center">
    <h3>선택된 상품 가격: <span id="totalPrice">0 원</span></h3>
    <button id="orderButton" class="btn btn-primary" style="margin-top: 20px;">결제하기</button>
  </div>
</section>
<!-- Total Price and Order Button Section End -->

<c:import url="${pageContext.request.contextPath}/resources/common/jsp/footer.jsp"/>
</body>
</html>
