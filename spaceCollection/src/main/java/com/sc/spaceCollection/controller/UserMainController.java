package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class UserMainController {
	private static final Logger logger = LoggerFactory.getLogger(UserMainController.class);
	
	//사용자메인화면
	@RequestMapping(value = "/")
	public String home() {
		return "index";
	}
	
	/*//검색
	@RequestMapping(value="/search", method= RequestMethod.GET)
	public String search(@ModelAttribute("search") Search search,
			Model model) {
		//1
		logger.info("공간 검색 결과 페이지");
		
		//2
		 List<SpaceViewVO> list=SpaceViewService.searchSpaceview(); 
		logger.info("공간 검색 조회 결과, list.size={}", list.size());
		
		//3
		model.addAttribute("list", list);
		
		//4
		return "userMain/search";
	}*/
	
	
}
