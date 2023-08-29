package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.space.model.SpaceService;
import com.sc.spaceCollection.spaceType.model.SpaceTypeService;
import com.sc.spaceCollection.spaceTypeCategory.model.SpaceTypeCategoryService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/space")
@RequiredArgsConstructor
public class AdminSpaceController {
	private static final Logger logger = LoggerFactory.getLogger(AdminSpaceController.class);
	
	private final SpaceTypeCategoryService spaceTypeCategoryService;
	private final SpaceTypeService spaceTypeService;
	private final SpaceService spaceService;
	
	@RequestMapping("/spaceTypeCategoryList")
	public void spaceTypeCategoryList(@ModelAttribute SearchVO vo, Model model) {
		logger.info("공간타입 카테고리 조회");
	}
	
	@RequestMapping("/spaceTypeList")
	public void spaceTypeList(Model model) {
		logger.info("공간타입 조회");
	}
	
	@RequestMapping("/spaceList")
	public void spaceList(Model model) {
		logger.info("공간 조회");
	}
}
