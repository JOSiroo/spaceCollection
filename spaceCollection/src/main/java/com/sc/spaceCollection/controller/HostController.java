package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/host")
public class HostController {
	private static final Logger logger = LoggerFactory.getLogger(HostController.class);
	
	@RequestMapping("/index")
	public String hostMain() {
		logger.info("호스트 메인 보여주기");
		return "host/index";
	}
	
	@GetMapping("/registration1")
	public String registration1() {
		logger.info("공간 등록 첫페이지 보여주기");
		return "host/registration1";
	}
	
	
}
