package org.threefour.homelearn.cart.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.threefour.homelearn.cart.domain.GetCartResponse;
import org.threefour.homelearn.cart.service.CartService;

import static org.threefour.homelearn.cart.RequestConstant.CART_PARAMETER_NAME;

@Controller
@RequiredArgsConstructor
public class CartController {
    private final CartService cartService;

    @GetMapping("/cart.do")
    public ModelAndView getCart(Long studentId) {
        GetCartResponse getCartResponse = cartService.get(studentId);
        return new ModelAndView(CART_PARAMETER_NAME, CART_PARAMETER_NAME, getCartResponse);
    }

    @PostMapping("/create-cart.do")
    public String createCart(Long studentId) {
        cartService.createCart(studentId);
        return "redirect:/cart.do?studentId=" + studentId;
    }

    @PostMapping("/add-cart-course.do")
    public String addCourse(Long studentId, Long courseId) {
        cartService.addCourse(studentId, courseId);
        return "redirect:/cart.do?studentId=" + studentId;
    }

    @PostMapping("/delete-cart-course.do")
    public String deleteCourse(Long studentId, Long cartCourseId) {
        cartService.deleteCourse(studentId, cartCourseId);
        return "redirect:/cart.do?studentId=" + studentId;
    }
}
