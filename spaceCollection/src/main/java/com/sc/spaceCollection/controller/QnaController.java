package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class QnaController {
	private static final Logger logger = 
			LoggerFactory.getLogger(QnaController.class);
	
	@PostMapping("/writeQnA")
	@ResponseBody
	public void writeQna(@RequestParam String qnaContent,
							@RequestParam String userId,
							@RequestParam int spaceNum ) {
		logger.info("qnaContent = {}, userId = {}, spaceNum = {}",qnaContent,userId,spaceNum);
	}
}
