package com.service.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.service.spring.domain.Member;
import com.service.spring.service.AdminService;
import com.service.spring.service.StudentService;

@Controller
public class MemberController {
	
	@Autowired
	StudentService studentService;
	@Autowired
	AdminService adminService;
	
	@PostMapping("/login.do")
	public String doLogin(Member member, HttpSession session, Model model) {
		try {
//			System.out.println(member);
			Member selected = studentService.login(member);
			System.out.println("테이블 갔다옴?");
			System.out.println(selected);
			if (selected!= null) {
				session.setAttribute("loginUser", selected);
				return "index";
			} else {
				return "login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "Error";
		}
	}
	
	
}
