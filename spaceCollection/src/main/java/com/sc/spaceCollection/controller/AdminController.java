package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sc.spaceCollection.admin.model.AdminService;
import com.sc.spaceCollection.admin.model.AdminVO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	private final AdminService adminService;
	
	@GetMapping("/adminLogin")
	public String adminLogin() {
		logger.info("관리자 로그인화면 출력");
		
		return "admin/adminLogin";
	}
	
	@PostMapping("/adminLogin")
	public String adminLogin(@RequestParam String adminId, @RequestParam String adminPwd, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required = false)String chkSave, Model model) {
		logger.info("로그인 처리, 파라미터 adminId={}, adminPwd={}, chkSave={}", adminId, adminPwd, chkSave);
		
		String msg = "로그인 중 오류가 발생하였습니다. <br>관리자에게 문의해주시기 바랍니다.", url = "/admin/adminLogin";
		int loginResult = adminService.loginCheck(adminId, adminPwd);
		logger.info("로그인 처리결과, loginResult={}", loginResult);
		
		if(loginResult == AdminService.LOGIN_OK) {
			HttpSession session = request.getSession();
			session.setAttribute("adminId", adminId);
			
			Cookie ck = new Cookie("ck_adminId", adminId);
			ck.setPath("/");
			if(chkSave != null) {
				ck.setMaxAge(1000*60*60*24);
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			
			return "redirect:/admin/adminMain";
		}else if(loginResult == AdminService.USERID_NONE) {
			msg = "아이디가 존재하지 않습니다.";
		}else if(loginResult == AdminService.PWD_DISAGREE) {
			msg = "아이디 또는 비밀번호가 일치하지 않습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@RequestMapping("/adminLogout")
	public String adminLogout(HttpSession session ,Model model) {
		session.removeAttribute("adminId");
		
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "/admin/adminLogin");
		
		return "admin/common/message";
	}
	
	
	@RequestMapping("/adminMain")
	public String adminMain() {
		logger.info("관리자 메인화면");
		
		return "admin/adminMain";
	}
}
