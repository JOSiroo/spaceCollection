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
	
	/*
    @GetMapping("/search")
    public String search(@RequestParam("query") String query, Model model) {
        // 검색 로직 처리
        // 검색 결과를 얻어오는 코드 예시
        List<SearchResult> searchResults = performSearch(query);
        
        model.addAttribute("results", searchResults);
        return "search_results"; // 검색 결과를 보여줄 뷰의 이름
    }

   
    private List<SearchResult> performSearch(String query) {
        // 예시에서 데이터로 대체
        List<SearchResult> dummyResults = new ArrayList<>();
        dummyResults.add(new SearchResult("Result 1", "Description for Result 1"));
        dummyResults.add(new SearchResult("Result 2", "Description for Result 2"));
        dummyResults.add(new SearchResult("Result 3", "Description for Result 3"));
        return dummyResults;
    }
    
	*/
	
}
