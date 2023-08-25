package com.sc.spaceCollection.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.common.Encryption;
import com.sc.spaceCollection.guest.model.GuestService;
import com.sc.spaceCollection.guest.model.GuestVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/guest")
public class GuestController {
	private static final Logger logger = LoggerFactory.getLogger(GuestController.class);
	
	private final GuestService guestService;
	
	private final Encryption encryption;
	
	@GetMapping("/register")
	public void register_get() {
		logger.info("회원가입 페이지");
	}
	
	@PostMapping("/register")
	public String register_post(@ModelAttribute GuestVO guestVo,Model model) {
		logger.info("회원가입 처리, 파라미터 GuestVO={}",guestVo);
		
		String salt=encryption.getSalt();
		guestVo.setSalt(salt);
		logger.info("salt 불러오기 salt={}",salt);
		
		String hex=encryption.getEncryption(salt,guestVo.getUserPwd());
		guestVo.setUserPwd(hex);
		logger.info("userPwd=>hex변환 hex={}",hex);
		
		int cnt = guestService.insertGuest(guestVo);
		
		String msg="회원가입의 실패하셨습니다.", url="guest/register";
		if(cnt>0) {
			msg=guestVo.getUserId()+"님 가입을 추카드려요.";
			url="login/login";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@ResponseBody
	@RequestMapping("/ajaxCheckId")
	public boolean ajaxCheckId(@RequestParam(required = false) String userId) {
		//1
		logger.info("ajax 이용 - 아이디 중복확인, 파라미터 userid={}", userId);
		
		//2
		int result=guestService.guestCheckId(userId);
		logger.info("아이디 중복확인 결과, result={}", result);
		
		boolean bool=false;
		if(result==GuestService.EXIST_ID) {
			bool=true;  //이미 존재
		}else if(result==GuestService.NONE_EXIST_ID) {
			bool=false; //존재하지 않음
		}
		
		return bool;
		
		//http://localhost:9091/herb/member/ajaxCheckId?userid=hong7
	}
	
	
	@ResponseBody
	@GetMapping("/getUserInfo")
	public GuestVO getUserInfo(@RequestParam String userId) {
		//1
		logger.info("ajax 이용 - 회원정보 조회, 파라미터 userid={}", userId);
		
		//2
		GuestVO vo = new GuestVO();
		vo =guestService.selectUserInfo(userId);
		logger.info("회원정보 조회 결과, vo={}", vo);
		
		return vo;
	}
	

	
	@RequestMapping("/findPwd")
	public String findPwd() {
		logger.info("비밀번호 찾기 페이지, 파라미터");
		return "find/findPwd";
	}
	
	@RequestMapping("/findId")
	public String findId() {
		logger.info("비밀번호 찾기 페이지, 파라미터");
		return "find/findId";
	}
	
	@RequestMapping("/completeFindId")
	public String completeFindId(@RequestParam String userEmail,Model model) {
		logger.info("아이디 찾기 성공, 파라미터 userEmail={}",userEmail);
		
		if(userEmail==null || userEmail.isEmpty()) {
			String msg="잘못된 url입니다.", url="/";
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			return "common/message";
		}
		
		List<GuestVO> guestVo = guestService.selectUserIdByEmail(userEmail);
		logger.info("아이디 찾기 성공, 유저 정보 guestVo={}",guestVo);
		
		model.addAttribute("guestVo",guestVo);
		
		return "find/completeFindId";
	}
	
	@GetMapping("/editInfo")
	public void editInfo_get(HttpSession session, Model model) {
		String userId=(String)session.getAttribute("userId");
		logger.info("회원정보 수정 처리 페이지, 파라미터 userId={}",userId);
		
		GuestVO guestVo=guestService.selectUserInfo(userId);
		logger.info("회원정보 불러오기 결과, guestVo={}",guestVo);
		
		model.addAttribute("guestVo",guestVo);
		
	}

	
	
}
