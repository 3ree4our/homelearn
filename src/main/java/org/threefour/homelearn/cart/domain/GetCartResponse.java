package org.threefour.homelearn.cart.domain;

import org.threefour.homelearn.course.service.CourseService;

import java.util.ArrayList;
import java.util.List;

public class GetCartResponse {
    private Long studentId;
    private List<GetCartCourseResponse> getCartCourseResponses;

    private GetCartResponse(Long studentId, List<GetCartCourseResponse> getCartCourseResponses) {
        this.studentId = studentId;
        this.getCartCourseResponses = getCartCourseResponses;
    }

    public static GetCartResponse from(Long studentId, Cart cart, CourseService courseService) {
        if (cart == null) {
            return new GetCartResponse(studentId, new ArrayList<>());
        }

        List<GetCartCourseResponse> getCartResponse = new ArrayList<>();
        for (CartCourse cartCourse : cart.getCartCourses()) {
            String subjectName = courseService.getSubjectName(cartCourse.getCourse().getSubject_id());
            getCartResponse.add(GetCartCourseResponse.from(cartCourse, subjectName));
        }

        return new GetCartResponse(studentId, getCartResponse);
    }

    public Long getStudentId() {
        return studentId;
    }

    public GetCartCourseResponse get(int index) {
        return getCartCourseResponses.get(index);
    }

    public int size() {
        return getCartCourseResponses.size();
    }
}
