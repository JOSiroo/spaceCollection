package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sc.spaceCollection.space.model.SpaceService;
import com.sc.spaceCollection.space.model.SpaceVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SpaceDetailController {
	private static final Logger logger = LoggerFactory.getLogger(SpaceDetailController.class);
	private final SpaceService spaceService;
	
	@GetMapping("/property-single")
	public String test2(@RequestParam int no, Model model) {
		logger.info("공간 상세 페이지, 파라미터 no = {}", no);
		
		SpaceVO vo = spaceService.selectByNo(no);
		logger.info("공간 상세 페이지, 결과  vo = {}", vo);
		
		model.addAttribute("vo", vo);
		
		return "spaceDetail/detail";
	}
}
