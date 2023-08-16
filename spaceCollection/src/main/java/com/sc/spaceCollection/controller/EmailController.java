package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/email")
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	
	@GetMapping("/emailCheck")
	public String emailCheck_get(@RequestParam(required = false) String userEmail,Model model) {
		logger.info("이메일 인증 페이지, 파라미터 userEmail={}",userEmail);
		
		model.addAttribute("userEmail",userEmail);
		
		return "email/emailCheck";
	}
	
	@PostMapping("/emailCheck")
	public void emailCheck_post(@RequestParam(required = false) String userEmail) {
		logger.info("이메일 인증 처리, 파라미터 userEmail={}",userEmail);
		
		
		
	}
}
