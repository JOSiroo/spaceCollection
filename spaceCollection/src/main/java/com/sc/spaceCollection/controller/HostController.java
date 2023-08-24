package com.sc.spaceCollection.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sc.spaceCollection.host.model.HostService;
import com.sc.spaceCollection.host.model.SpaceCategoryAllVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/host")
public class HostController {
	private static final Logger logger = LoggerFactory.getLogger(HostController.class);
	
	private final HostService hostService;
	
	@RequestMapping("/index")
	public String hostMain() {
		logger.info("호스트 메인 보여주기");
		
		return "host/index";
	}
	
	@GetMapping("/registration/registration1")
	public String registration1_get(Model model) {
		//1
		logger.info("공간등록 페이지1 보여주기");
		
		//2
		List<SpaceCategoryAllVO> type = hostService.selectSpaceCategory();
		logger.info("type = {}", type);

		//3
		model.addAttribute("type", type);
		
		//4
		return "host/registration/registration1";
	}
	
	/*
	 * @PostMapping("/registration1") public String registration1_post(Model model)
	 * { //1 logger.info("공간 등록 첫페이지 보여주기");
	 * 
	 * //2 List<SpaceCategoryAllVO> type = hostService.selectSpaceCategory();
	 * logger.info("type = {}", type);
	 * 
	 * //3 model.addAttribute("type", type);
	 * 
	 * //4 return "host/registration1"; }
	 */
	
	@RequestMapping("/registration/registration2")
	public String registration2() {
		//1
		logger.info("공간등록 페이지2 보여주기");
		
		//2
		
		
		//3
		
		
		//4
		return "host/registration/registration2";
	}
	
	@RequestMapping("/report/account")
	public String account() {
		//1
		logger.info("report/정산완료 페이지");
		
		//2
		
		
		//3
		
		
		//4
		return "host/report/account";
	}
	
	@RequestMapping("/report/draft")
	public String draft() {
		//1
		logger.info("report/정산 예정 페이지");
		
		//2
		
		
		//3
		
		
		//4
		return "host/report/draft";
	}
	
	
}
