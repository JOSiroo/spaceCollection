package com.sc.spaceCollection.controller;

import java.util.List;

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
import com.sc.spaceCollection.boardType.model.BoardTypeService;
import com.sc.spaceCollection.boardType.model.BoardTypeVO;

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
	private final BoardTypeService boardTypeService;
	
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
	
	@RequestMapping("/board/boardSetting")
	public void boardSetting(Model model) {
		logger.info("게시판 종합 관리");
		
		List<BoardTypeVO> list = boardTypeService.selectBoardType();
		logger.info("게시물 타입 조회결과, list.size = {}", list.size());
		
		model.addAttribute("list", list);
	}
	
	@GetMapping("/board/boardCreate")
	public void boardCreate() {
		logger.info("게시판 생성 화면");
	}
	
	@PostMapping("/board/boardCreate")
	public String boardCreate(@ModelAttribute BoardTypeVO vo, Model model) {
		logger.info("게시판 생성, 파라미터 vo = {}", vo);
		
		if(vo.getBoardTypeCommentOk()==null) {
			vo.setBoardTypeCommentOk("N");
		}else {
			vo.setBoardTypeCommentOk("Y");
		}
		
		if(vo.getBoardTypeFileOk()==null) {
			vo.setBoardTypeFileOk("N");
		}else {
			vo.setBoardTypeFileOk("Y");
		}
		
		if(vo.getBoardTypeUse()==null) {
			vo.setBoardTypeUse("N");
		}else {
			vo.setBoardTypeUse("Y");
		}
		String msg = "게시판 생성에 실패하였습니다.", url = "/admin/board/boardCreate";
		int result = boardTypeService.createBoard(vo);
		if(result>0) {
			msg = "게시판이 생성되었습니다.";
			url = "/admin/board/boardSetting";
		}else if(result<0){
			msg = "이미 사용중인 게시판 이름입니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@GetMapping("/board/boardEdit")
	public void boardEdit(@RequestParam String boardTypeId, Model model) {
		logger.info("게시판 정보 출력, 파라미터 boardTypeId = {}", boardTypeId);
		
		BoardTypeVO vo = boardTypeService.selectByBoardTypeId(boardTypeId);
		
		model.addAttribute("vo", vo);
		
	}
	
	@RequestMapping("/board/boardEditn")
	public String boardEditn(Model model) {
		model.addAttribute("msg", "변경된 항목이 없습니다.");
		model.addAttribute("url", "/admin/board/boardSetting");
		
		return "admin/common/message";
	}
	
	@PostMapping("/board/boardEdit")
	public String boardEdit(@ModelAttribute BoardTypeVO vo, Model model) {
		logger.info("게시판 수정, 파라미터 vo = {}", vo);
		
		if(vo.getBoardTypeCommentOk()==null) {
			vo.setBoardTypeCommentOk("N");
		}else {
			vo.setBoardTypeCommentOk("Y");
		}
		
		if(vo.getBoardTypeFileOk()==null) {
			vo.setBoardTypeFileOk("N");
		}else {
			vo.setBoardTypeFileOk("Y");
		}
		
		if(vo.getBoardTypeUse()==null) {
			vo.setBoardTypeUse("N");
		}else {
			vo.setBoardTypeUse("Y");
		}
		String msg = "게시판 수정에 실패하였습니다.", url = "/admin/board/boardEdit";
		int result = boardTypeService.updateBoardType(vo);
		if(result>0) {
			msg = "게시판이 수정되었습니다.";
			url = "/admin/board/boardSetting";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
}
