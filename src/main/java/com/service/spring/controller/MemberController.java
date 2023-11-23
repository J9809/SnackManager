package com.service.spring.controller;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@PostMapping("login.do")
	public String doLogin(Member member, HttpSession session, Model model) {
		try {
//			System.out.println(member);
			Member selected = studentService.login(member);
			if (selected != null) {
				session.setAttribute("loginUser", selected);
				return "redirect:/index.jsp";
			} else {
				return "redirect:/login.jsp";
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
				return "redirect:/login.jsp";
			} else {
				return "Error";
			}
		} catch (Exception e) {
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
				return "redirect:/myPage.jsp";
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
	@ResponseBody
	public List<HistoryWithSnackName> viewHistory(Model model, HttpSession session) {
		try {
			Member loggedInUser = (Member) session.getAttribute("loginUser");
			if (loggedInUser != null) {
				List<HistoryWithSnackName> list = studentService.getHistory(loggedInUser);
				return list;
			} else {
				// Handle the case where the user is not logged in
				return Collections.emptyList(); // Return an empty list or handle the case according to your logic
			}
		} catch (Exception e) {
			e.printStackTrace();
			// Handle the exception
			return Collections.emptyList(); // Return an empty list or handle the error case
		}
	}


	@PostMapping("/api/deleteMember.do")
	public String deleteMember(Model model, HttpSession session) {
		
		try {
			Member loggedInUser = (Member) session.getAttribute("loginUser");
			int result = studentService.deleteMember(loggedInUser.getMemberId());
			return "redirect:/login.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "문제내용 - 사용자 회원탈퇴중 받던 중 에러 발생");
			return "Error";
		}

	}

	@GetMapping("checkDuplicateId.do")
	@ResponseBody
	public String chkId(String memberId, Model model) {
		try {
			Member member = studentService.checkDuplicateId(memberId);
			if (member != null) {
				return "duplicated";
			} else {
				return "not duplicated";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "문제내용 - id 중복확인중 받던 중 에러 발생");
			return "Error";
		}

	}

	@GetMapping("logout.do")
	public String logout(HttpSession session) {
		if (session != null) {
			session.invalidate(); // Invalidate the session
		}
		return "redirect:/login.jsp"; // Redirect to the login page
	}

	@GetMapping("deleteVote.do")
	public String deleteVote() {

		try {
			int result = adminService.deleteVote();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/index.jsp";

	}

}

