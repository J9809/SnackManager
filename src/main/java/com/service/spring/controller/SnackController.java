package com.service.spring.controller;

import com.service.spring.domain.Snack;
import com.service.spring.domain.SnackCount;
import com.service.spring.service.AdminService;
import com.service.spring.service.StudentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class SnackController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private AdminService adminService;
    @GetMapping("admin/selectAll.do")
    public String doSelectAllAdmin(Model model) {
        try {
            List<Snack> snacks = adminService.selectAll();
            System.out.println(snacks);
            model.addAttribute("snacks", snacks);
            model.addAttribute("title", "관리자 - 전체 재고 조회");
            return "adminInventory";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @GetMapping("student/selectAll.do")
    public String doSelectAllStudent(Model model) {
        System.out.println("✅ Select All Snack Controller");
        try {
            List<Snack> snacks = studentService.selectAll();
            System.out.println(snacks);
//            System.out.println("snacks size = " + snacks.size());
            model.addAttribute("snacks", snacks);
            model.addAttribute("title", "학생 - 전체 재고 조회");
            return "studentInventory";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @PostMapping( "student/fetchSnack.do")
    public String doFetchSnack(@RequestBody List<SnackCount> list) {
        System.out.println("✅ Fetch Snack Controller");
        System.out.println(list);
        try {
            return "index";
        } catch (Exception e) {
            System.out.println("❗️ERROR");
        }
        return "index";
    }
}
