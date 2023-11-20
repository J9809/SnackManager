package com.service.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.service.spring.domain.HistoryWithSnackName;
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
	
	@PostMapping("api/registerMember.do")
	public String registerMember(Member member, Model model) {
		System.out.println("회원가입");
		try {
			int result = studentService.registerMember(member);
			if (result == 1) {
				return "login";
			}else {
				return "Error";
			}
		}catch (Exception e) {
			e.printStackTrace();
	        model.addAttribute("message", "문제내용 - 회원가입 진행 중 에러 발생");
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
	
	@GetMapping("api/viewHistory.do")
	public String viewHistory(Model model, HttpSession session) {
//		System.out.println("히스토리 보는 api 호출됨");
		try {
	        Member loggedInUser = (Member) session.getAttribute("loginUser");
	        if (loggedInUser != null) {
				List<HistoryWithSnackName> list = studentService.getHistory(loggedInUser);
				model.addAttribute("histories", list);
//				for(HistoryWithSnackName h:list) {
//					System.out.println(h);
//				}
	            return "myPage";
	        } else {
	            return "login"; 
	        }
		} catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("message", "문제내용 - 사용자 섭취내역 받던 중 에러 발생");
	        return "Error";
		}
	}
	
	
}
