package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;

import com.sc.spaceCollection.guest.model.GuestVO;
import com.sc.spaceCollection.host.model.HostDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/host")
public class HostController {
	private static final Logger logger = LoggerFactory.getLogger(HostController.class);
	
	private final HostDAO hostDao;
	
	@RequestMapping("/index")
	public String hostMain() {
		//1
		logger.info("호스트 메인 보여주기");
		
		//2
		//3
		//4
		return "host/index";
	}
	
	@GetMapping("/registration1")
	public String registration1() {
		logger.info("공간 등록 첫페이지 보여주기");
		return "host/registration1";
	}
	
	
}
