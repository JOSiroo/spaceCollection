package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sc.spaceCollection.userInfo.model.UserInfoVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/member")
@RequiredArgsConstructor
public class AdminMemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminMemberController.class);
	
	private final UserInfoVO userInfoVo;
	
	@RequestMapping("/memberList")
	public void memberList() {
		logger.info("회원목록 조회");
	}

}
