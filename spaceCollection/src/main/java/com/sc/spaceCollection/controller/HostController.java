package com.sc.spaceCollection.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sc.spaceCollection.host.model.HostService;

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
	
	@GetMapping("/registration1")
	public String registration1(Model model) {
		//1
		logger.info("공간 등록 첫페이지 보여주기");
		
		//2
		List<Map<String, Object>> space = hostService.selectSpaceType();
		logger.info("공간 리스트 조회, 결과 space.size = {}", space.size());
		
		
		for (int i = 0; i < space.size(); i++) {
			
		}
		
		logger.info("공간타입 카테고리번호로 조회, list.size = {}", space.size());

		//3
		model.addAttribute("list", space);
		
		//4
		return "host/registration1";
	}
	
	@RequestMapping("/report")
	public String report() {
		//1
		logger.info("report 페이지");
		
		//2
		
		
		//3
		
		
		//4
		return "host/report";
	}
	
	
}
