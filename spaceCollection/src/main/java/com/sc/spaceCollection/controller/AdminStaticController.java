package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminStaticController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminStaticController.class);
	
//	@RequestMapping("/adminMain")
//	public String adminMain(Model model) {
//		
//	}
}
