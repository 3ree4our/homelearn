package org.threefour.homelearn.order.domain;

import lombok.Getter;

import java.util.List;

@Getter
public class PaidOrderRequest {
    private String impUid;
    private String merchantUid;
    private Long ordererId;
    private int paidAmount;
    private List<CourseOrderRequest> courseOrderRequests;
}
