package com.sc.spaceCollection.controller;

import java.util.List;
import java.util.Locale.Category;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sc.spaceCollection.host.model.HostService;
import com.sc.spaceCollection.host.model.SpaceCategoryVO;
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
	
	@GetMapping("/registration1")
	public String registration1(Model model) {
		//1
		logger.info("공간 등록 첫페이지 보여주기");
		
		//2
		List<SpaceCategoryVO> space = hostService.selectSpaceCategory();
		int cate = 0;
		for (int i = 0; i < space.size(); i++) {
			SpaceCategoryVO vo = space.get(i);
			cate = vo.getCategoryNo();
			List<SpaceTypeVO> list = hostService.selectSpaceByCategoryNo(cate);
		}
		
		logger.info("공간타입 카테고리번호로 조회, list.size = {}", list.size());

		//3
		model.addAttribute("list", list);
		
		//4
		return "host/registration1";
	}
	
	
	
	
}
