package org.threefour.homelearn.enrollment.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.threefour.homelearn.enrollment.service.EnrollmentService;
import org.threefour.homelearn.payment.service.PaymentService;

@Controller
@RequiredArgsConstructor
public class EnrollmentController {
    private final EnrollmentService enrollmentService;
    private final PaymentService paymentService;

    @PostMapping("/cancel-order.do")
    public String removeEnrolledCourse(@RequestParam Long ordererId, @RequestParam Long courseId, @RequestParam String impUid, @RequestParam int price) throws Exception {
        paymentService.cancelPayment(ordererId, courseId, impUid, price);
        enrollmentService.cancelEnrolledCourse(courseId, impUid);

        return "redirect:/order.do?impUid=" + impUid;
    }
}
