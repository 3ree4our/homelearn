package org.threefour.homelearn.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.threefour.homelearn.member.dto.MemberResponseDTO;
import org.threefour.homelearn.member.jwt.JWTUtil;
import org.threefour.homelearn.member.mapper.MemberMapper;
import org.threefour.homelearn.review.domain.Review;
import org.threefour.homelearn.review.service.ReviewService;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
public class ReviewController {

  @Autowired
  private MemberMapper memberMapper;

  @Autowired
  private ReviewService reviewService;


  @Autowired
  private JWTUtil jwtUtil;

  @PostMapping("/writeReview")
  public @ResponseBody List<Review> writeReview(String content, String url) {
    ModelAndView view = new ModelAndView();
    MemberResponseDTO memberDTO = memberMapper.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

    int index = url.lastIndexOf("=");
    String strCourse_id = url.substring(index + 1, url.length());

    long member_id = memberDTO.getId();
    long course_id = 0L;
    if (strCourse_id != null) {
      course_id = Long.parseLong(strCourse_id);
    }


    Review review = new Review();
    review.setStudent_id(member_id);
    review.setCourse_id(course_id);
    review.setContent(content);
    review.setScore(10);
    review.setCreated_at(LocalDateTime.now());
    review.setModified_at(LocalDateTime.now());
    reviewService.writeReview(review);
    List<MemberResponseDTO> getMemberResponseDTOList = memberMapper.selectReview(course_id);

    List<Review> reviews = getList2(course_id);
    for (int i = 0; i < reviews.size() - 1; i++) {

      reviews.get(i).setNickName(getMemberResponseDTOList.get(i).getNickname());
      String createdAt = getMemberResponseDTOList.get(i).getCreatedAt();
      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
      LocalDateTime dateTime = LocalDateTime.parse(createdAt, formatter);
      reviews.get(i).setCreated_at(dateTime);


    }

    System.out.println("createat :   " + reviews.get(0).getCreated_at());
    System.out.println("reviews :   " + reviews.get(0).getCreated_at());
    System.out.println("reviews :   " + reviews.get(0).getModified_at());
    return reviews;
  }

  @ResponseBody
  @PostMapping("/listReview")
  public List<Review> getList(String course_id , String url) {
    System.out.println();

    System.out.println("getList(String url)1 ko" + course_id);
    System.out.println("getList(String url)1 ko" + url);
    System.out.println();

    int index = url.lastIndexOf("=");
    String strCourse_id = url.substring(index + 1, url.length());
    long course_id1 = 0L;
    if (strCourse_id != null) {
      course_id1 = Long.parseLong(strCourse_id);
    }

    List<Review> reviews = reviewService.getList(course_id1);

    return reviews;
  }

  @ResponseBody
  @PostMapping("/reviewList")
  public List<Review> getList(String url){
    System.out.println();

    System.out.println("reviewList(String url) 실행됨"+url);
    System.out.println();

    int index = url.lastIndexOf("=");
    String strCourse_id = url.substring(index+1,url.length());
    long course_id =0L;
    if(strCourse_id!=null){
      course_id = Long.parseLong(strCourse_id);
    }

    List<Review> reviews = reviewService.getList(course_id);
    for(Review review : reviews){
      System.out.println("memnick       " + review.getNickName());
    }
    System.out.println("memnick       " + reviews.get(0).getNickName());

    return reviews;
  }

  public List<Review> getList2(long course_id){
    System.out.println();

    System.out.println("getList(String url)2 실행됨"+course_id);
    System.out.println();

    ModelAndView view = new ModelAndView();


    List<Review> reviews = reviewService.getList(course_id);

    return reviews;
  }
}
