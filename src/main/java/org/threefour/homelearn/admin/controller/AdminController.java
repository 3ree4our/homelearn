package org.threefour.homelearn.admin.controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.threefour.homelearn.admin.domain.NumberOfCoursesBySubject;
import org.threefour.homelearn.admin.domain.RankingSubjectAdmin;
import org.threefour.homelearn.admin.domain.RateSubjectAdmin;
import org.threefour.homelearn.admin.domain.CntWeekAdmin;
import org.threefour.homelearn.admin.service.AdminService;

import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping("admin")
public class AdminController {
  private AdminService adminService;

  @Autowired
  public void setAdminService(AdminService adminService) {
    this.adminService = adminService;
  }

  @GetMapping("dash-board")
  public String rateSubjectList(Model model) {
    int todayCnt = adminService.todaySubscriber();
    int totalCnt = adminService.totalSubscriber();
    List<CntWeekAdmin> weekCnt = adminService.subscripbersPerWeek();
    List<RateSubjectAdmin> rateSubjectList = adminService.rateSubjectList();
    List<RankingSubjectAdmin> rankingList = adminService.rankingSubjectList();
    List<NumberOfCoursesBySubject> numberOfCoursesBySubject = adminService.numberOfCoursesBySubject();

    Gson gson = new Gson();
    Gson gson2 = new Gson();
    Gson gson3 = new Gson();
    JsonArray jsonArray = new JsonArray();
    JsonArray jsonArray2 = new JsonArray();
    JsonArray jsonArray3 = new JsonArray();

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

    Iterator<RateSubjectAdmin> it2 = rateSubjectList.iterator();
    while (it2.hasNext()) {
      RateSubjectAdmin rateSubject = it2.next();
      JsonObject object = new JsonObject();
      String name = rateSubject.getSubjectName();
      int cnt = rateSubject.getCnt();

      object.addProperty("name", name);
      object.addProperty("cnt", cnt);
      jsonArray2.add(object);
    }

    Iterator<NumberOfCoursesBySubject> it3 = numberOfCoursesBySubject.iterator();
    while (it3.hasNext()) {
      NumberOfCoursesBySubject nocbs = it3.next();
      JsonObject object = new JsonObject();
      String name = nocbs.getName();
      int cnt = nocbs.getCnt();

      object.addProperty("name", name);
      object.addProperty("cnt", cnt);
      jsonArray3.add(object);
    }

    String json = gson.toJson(jsonArray);
    String json2 = gson2.toJson(jsonArray2);
    String json3 = gson2.toJson(jsonArray3);
    model.addAttribute("todayCnt", todayCnt);
    model.addAttribute("totalCnt", totalCnt);
    model.addAttribute("json", json);
    model.addAttribute("json2", json2);
    model.addAttribute("json3", json3);
    model.addAttribute("rankingList", rankingList);

    return "admin/dash-board";
  }
}