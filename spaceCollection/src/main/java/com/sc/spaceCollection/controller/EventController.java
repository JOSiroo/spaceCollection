package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sc.spaceCollection.comments.model.CommentsService;
import com.sc.spaceCollection.comments.model.CommentsVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/eventtest")
public class  EventController{
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	private final CommentsService service;
	
	@PostMapping("/eventtest")
	public String InsertComment(@RequestBody CommentsVO vo,HttpSession session) {
		System.out.println("댓글 등록 통신 성공");
		if(session.getAttribute("login") == null) {
			return "userMain/eventtest";
		} else {
			System.out.println("로그인함. 스크랩 진행");
			
			/* service.CommentRegist(vo); */
			System.out.println("댓글 등록 서비스 성공");
			return "userMain/eventtest";
		}
	}

}
