package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.guest.model.GuestService;
import com.sc.spaceCollection.qna.model.QnaService;
import com.sc.spaceCollection.qna.model.QnaVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class QnaController {
	private final QnaService qnaService;
	private final GuestService guestService;
	private static final Logger logger = 
			LoggerFactory.getLogger(QnaController.class);
	
	
	
	@PostMapping("/writeQnA")
	@ResponseBody
	public int writeQna(HttpSession session,@RequestParam String qnaContent,
							@RequestParam int spaceNum ) {
		
		int cnt = 0;
		String userId = (String)session.getAttribute("userId");
		if(userId == null || userId.isEmpty()) {
			return cnt;
		}else {
			logger.info("qnaContent = {}, userId = {}, spaceNum = {}",qnaContent,userId,spaceNum);
			int userNum = guestService.selectUserInfo(userId).getUserNum();
			
			QnaVO vo = new QnaVO();
			vo.setQnaContent(qnaContent);
			vo.setUserNum(userNum);
			vo.setSpaceNum(spaceNum);
			logger.info("vo세팅 결과 vo = {}", vo);
			
			cnt = qnaService.insertQna(vo);
			logger.info("리뷰 입력 결과 결과 cnt = {}", cnt);
			
			return cnt;
		}
			
	}
}
