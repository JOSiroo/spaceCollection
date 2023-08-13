package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserMainController {
	private static final Logger logger = LoggerFactory.getLogger(UserMainController.class);
	
	//사용자메인화면
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	
	//약관
	@RequestMapping("userMain/userService")
	public String userChek() {
		return "userMain/userService";
	}
	
	/*
    <?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
	
	<mapper namespace="com.sc.spaceCollection.space.model.SpaceDAO">
		<select id="selectSpace" parameterType="string" 
			resultType="SpaceVO">
			select * from spaceName
			where spaceName like '%' || #{spaceName} || '%'
		</select>
	</mapper>
	    
	public interface SpaceService {
	List<SpaceVO> selectSpace(String SpaceName);
	}    
	
	@GetMapping("/search")
    public String search(@RequestParam("query") String query, Model model) {
        // 검색 로직 처리
        // 검색 결과를 얻어오는 코드 예시
        List<SearchResult> searchResults = performSearch(query);
        
        model.addAttribute("results", searchResults);
        return "space"; // 검색 결과를 보여줄 뷰의 이름
    }
    
	@RequestMapping("/search")
	public String search(@RequestParam(required = false) 
			String SpaceName, ModelMap model) {
		//1
		logger.info("공간 검색, 파라미터 keyword={}", keyword);
		
		//2
		List<SpaceVO> list=null;
		if(SpaceVO!=null && !SpaceVO.isEmpty()) {
			list=SpaceService.selectSpace(SpaceName);
			logger.info("검색 결과, list.size={}", list.size());
		}
		
		//3
		model.addAttribute("list", list);
		
		//4
		return "search/search";
	}
	
	@RequestMapping("/search")
	public String search() {
		logger.info("공간 검색 찾기 화면 보여주기");
		
		return "search/search";
	}
	*/
	
	@RequestMapping("/search")
	public String search() {
		logger.info("타입별 공간 리스트 조회, 파라미터 spaceType = {}"/*, spaceType*/);
		
		return "userMain/search";
	}
	
	@GetMapping("/search/map")
	public String map() {
		logger.info("타입별 공간 지도 조회");
		
		return "userMain/map";
	}
}
