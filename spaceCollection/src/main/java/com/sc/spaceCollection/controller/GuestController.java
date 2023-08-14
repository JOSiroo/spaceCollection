package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.guest.model.GuestService;
import com.sc.spaceCollection.guest.model.GuestVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/guest")
@RequiredArgsConstructor
public class GuestController {
	private static final Logger logger = LoggerFactory.getLogger(GuestController.class);
	
	private final GuestService guestService;
	
	@GetMapping("/register")
	public void register_get() {
		logger.info("회원가입 페이지");
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
	
	
	
}
