package com.sc.spaceCollection.controller;

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
	
	@RequestMapping("/findPwd")
	public String findPwd() {
		//1.
		logger.info("비밀번호 찾기 페이지, 파라미터");
		//2.
		
		//3.
		
		//4.
		return "find/findPwd";
	}
	
	@RequestMapping("/findId")
	public String findId() {
		//1.
		logger.info("비밀번호 찾기 페이지, 파라미터");
		//2.
		
		//3.
		
		//4.
		return "find/findId";
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
	
	
	
	
}
