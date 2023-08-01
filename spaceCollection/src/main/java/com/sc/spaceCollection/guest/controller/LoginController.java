package com.sc.spaceCollection.guest.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
	private static final Logger logger=LoggerFactory.getLogger(LoginController.class);
	
	
	@GetMapping("/login")
	public String Login_get() {
		logger.info("로그인 화면 처리");
		
		return "login/login";
	}

}
