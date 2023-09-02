package com.sc.spaceCollection.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.collection.model.CollectionService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class collectionController {
	private final CollectionService collectionService;
	private static final Logger logger = LoggerFactory.getLogger(collectionController.class);
	
	@GetMapping("collection")
	public String collection(@RequestParam int scNum, Model model) {
		logger.info("기획전 조회, 파라미터 scNum = {}",scNum);
		
		String collectionName = collectionService.selectCollectionName(scNum);
		
		model.addAttribute("collectionName", collectionName);
		
		return "collection/collection";
	}
	
	
	@GetMapping("/getCollection")
	@ResponseBody
	public List<Map<String, Object>> collectionList(@RequestParam int page, @RequestParam int size, @RequestParam int scNum) {
		logger.info("기획전 데이터 가져오기, 파라미터 scNum = {}",scNum);
		List<Map<String, Object>> list = collectionService.showCollectionList(scNum);
		for(Map<String, Object> map : list) {
			  map.put("SPACE_REG_DATE", map.get("SPACE_REG_DATE")+"");
		}//timestamp 오류나서 String으로 변환
		return list;
	}
}
