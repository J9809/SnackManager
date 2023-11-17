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
			if (selected!= null) {
				session.setAttribute("loginUser", selected);
				return "index";
			} else {
				return "login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "문제내용 - 회원 로그인 진행 중 에러 발생");
			return "Error";
		}
	}
	
	@PostMapping("api/updateMember.do")
	public String updateMember(Member member, HttpSession session, Model model) {
		 System.out.println("비밀번호 변경");
		    try {
		        Member loggedInUser = (Member) session.getAttribute("loginUser");
		        if (loggedInUser != null) {
		            String memberId = loggedInUser.getMemberId();
		            member.setMemberId(memberId);
		            int result = studentService.updateMember(member);
		            return "myPage";
		        } else {
		            return "login"; 
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        model.addAttribute("message", "문제내용 - 비밀번호 변경 진행 중 에러 발생");
		        return "Error";
		    }
	}
	
	
}
