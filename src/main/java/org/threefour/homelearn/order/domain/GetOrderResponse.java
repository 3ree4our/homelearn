package org.threefour.homelearn.order.domain;

import lombok.Builder;
import lombok.Getter;
import org.threefour.homelearn.course.domain.Course;
import org.threefour.homelearn.enrollment.domain.EnrolledCourse;
import org.threefour.homelearn.payment.domain.Payment;

import java.sql.Timestamp;
import java.util.List;

@Getter
public class GetOrderResponse {
    private String impUid;
    private Long ordererId;
    private String merchantUid;
    private int paidAmount;
    private int refundedAmount;
    private List<Course> courses;
    private List<EnrolledCourse> enrolledCourses;
    private Timestamp createdAt;
    private Timestamp modifiedAt;

    @Builder
    private GetOrderResponse(
            String impUid, Long ordererId, String merchantUid, int paidAmount, int refundedAmount,
            List<Course> courses, List<EnrolledCourse> enrolledCourses, Timestamp createdAt, Timestamp modifiedAt
    ) {
        this.impUid = impUid;
        this.ordererId = ordererId;
        this.merchantUid = merchantUid;
        this.paidAmount = paidAmount;
        this.refundedAmount = refundedAmount;
        this.courses = courses;
        this.enrolledCourses = enrolledCourses;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
    }

    public static GetOrderResponse from(
            Order order, List<Payment> payments, List<Course> courses, List<EnrolledCourse> enrolledCourses
    ) {
        int paidAmount = 0;
        int refundedAmount = 0;
        for (Payment payment : payments) {
            if (payment.getPaid_amount() > 0) {
                paidAmount = payment.getPaid_amount();
                continue;
            }
            if (payment.getRefunded_amount() > 0) {
                refundedAmount = payment.getRefunded_amount();
            }
        }

        return GetOrderResponse.builder()
                .impUid(order.getImpUid())
                .ordererId(order.getOrdererId())
                .merchantUid(order.getMerchantUid())
                .paidAmount(paidAmount)
                .refundedAmount(refundedAmount)
                .courses(courses)
                .enrolledCourses(enrolledCourses)
                .createdAt(order.getCreatedAt())
                .modifiedAt(order.getModifiedAt())
                .build();
    }

    public int size() {
        return courses.size();
    }
}
