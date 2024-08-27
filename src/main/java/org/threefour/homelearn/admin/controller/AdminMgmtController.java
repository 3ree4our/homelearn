package org.threefour.homelearn.admin.controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.threefour.homelearn.admin.domain.CntWeekAdmin;
import org.threefour.homelearn.admin.domain.CourseMemberAdmin;
import org.threefour.homelearn.admin.domain.CoursesAdmin;
import org.threefour.homelearn.admin.domain.MemberAdmin;
import org.threefour.homelearn.admin.service.AdminService;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("mgmt")
public class AdminMgmtController {
  private AdminService adminService;

  @Autowired
  public AdminMgmtController(AdminService adminService) {
    this.adminService = adminService;
  }

  @GetMapping("member/list")
  public String memberList(Model model) {
    List<CntWeekAdmin> weekCnt = adminService.subscripbersPerWeek();
    List<MemberAdmin> memberList = adminService.memberList();

    Gson gson = new Gson();
    JsonArray jsonArray = new JsonArray();

    Iterator<CntWeekAdmin> it = weekCnt.iterator();
    while (it.hasNext()) {
      CntWeekAdmin cntWeek = it.next();
      JsonObject object = new JsonObject();
      int day = cntWeek.getDay();
      int cnt = cntWeek.getCnt();

      object.addProperty("day", day);
      object.addProperty("cnt", cnt);
      jsonArray.add(object);
    }

    String json = gson.toJson(jsonArray);
    model.addAttribute("json", json);
    model.addAttribute("memberList", memberList);
    return "admin/member";
  }

  @GetMapping("course/courseList")
  public String courseList(Model model) {
    List<CoursesAdmin> courseList = adminService.courseList();
    model.addAttribute("courseList", courseList);
    return "admin/courses";
  }

  @ResponseBody
  @GetMapping("course/memberList")
  public List<CourseMemberAdmin> courseMemberList(@RequestParam("courseId") long courseId) {
    List<CourseMemberAdmin> memberList = adminService.courseMemberList(courseId);
    return memberList;
  }

  @GetMapping("order/list")
  public String orderList(Model model) {
    /*List<Review> list = orderService.reviewList();
    model.addAttribute("list", list);*/
    return "admin/order";
  }

  @PostMapping("member/update")
  @ResponseBody
  public Map<String, Boolean> memberUpdate(@RequestParam(required = false) long id,
                                           @RequestParam(required = false) String nickname,
                                           @RequestParam(required = false) String deleteYn) {
    Map<String, Boolean> response = new HashMap<>();
    try {
      MemberAdmin member = new MemberAdmin();
      member.setId(id);
      if (nickname != null) {
        member.setNickname(nickname);
      }
      if (deleteYn != null) {
        member.setDeleteYn(deleteYn);
      }
      adminService.updateMember(member);
      response.put("success", true);
    } catch (Exception e) {
      response.put("success", false);
    }
    return response;
  }

  @PostMapping("course/delete")
  @ResponseBody
  public Map<String, Boolean> deleteCourse(@RequestParam("courseId") long courseId) {
    Map<String, Boolean> response = new HashMap<>();
    try {
      boolean result = adminService.deleteCourse(courseId);
      response.put("success", result);
    } catch (Exception e) {
      response.put("success", false);
    }
    return response;
  }

  @PostMapping("course/refund")
  @ResponseBody
  public Map<String, Boolean> refundMember(@RequestParam("memberId") long memberId,
                                           @RequestParam("courseId") long courseId) {
    Map<String, Boolean> response = new HashMap<>();
    try {
      boolean result = adminService.refundMember(memberId, courseId);
      response.put("success", result);
    } catch (Exception e) {
      response.put("success", false);
    }
    return response;
  }
}