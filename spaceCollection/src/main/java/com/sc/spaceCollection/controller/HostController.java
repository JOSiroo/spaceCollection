package com.sc.spaceCollection.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sc.spaceCollection.host.model.HostService;
import com.sc.spaceCollection.host.model.SpaceTypeVO;

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
	
	@GetMapping("/registration")
	public String registration(Model model) {
		//1
		logger.info("공간 등록 첫페이지 보여주기");
		
		//2
		List<List<Map<String, Object>>> type = new ArrayList<>();
		List<SpaceTypeVO> map = new ArrayList<>();
		List<SpaceTypeVO> category = hostService.selectSpaceCategory();
		logger.info("카테고리 ={}",category);
		
		for (int i = 0; i < category.size(); i++) {
			map.add(category.get(i));
			logger.info("맵 ={}",map);
			
			String categoryName = map.get(i).getCategoryName();
			logger.info("카테고리번호 = {}", categoryName);
			
			List<Map<String, Object>> space = hostService.selectSpaceType(categoryName);
			logger.info("스페이스 = {}", space);
			type.add(space); 
			logger.info("공간타입 카테고리번호로 조회, type.size = {}", type.size());
			
		}
		logger.info("타입 = {}", type);

		//3
		model.addAttribute("type", type);
		model.addAttribute("map2", map);
		
		//4
		return "host/registration";
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
