package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/guest")
public class GuestController {
	private static final Logger logger = LoggerFactory.getLogger(GuestController.class);
	
	
	@GetMapping("/register")
	public void register_get() {
		logger.info("회원가입 페이지");
	}
	
	
}
