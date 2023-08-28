package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sc.spaceCollection.common.Encryption;
import com.sc.spaceCollection.guest.model.GuestService;
import com.sc.spaceCollection.guest.model.GuestVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/guest/myPage")
@RequiredArgsConstructor
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(GuestController.class);
	
	private final GuestService guestService;
	
	private final Encryption encryption;
	
	@GetMapping("/myProfile")
	public String myPage_get(HttpSession session,Model model) {
		String userId = (String)session.getAttribute("userId");
		logger.info("마이페이지 처리, 파라미터 userId={}",userId);
		
		GuestVO guestVo = guestService.selectUserInfo(userId);
		logger.info("마이페이지 유저 정보 불러오기 결과, guestVo={}",guestVo);
		
		model.addAttribute("guestVo",guestVo);
		return "guest/myPage/myProfile";
	}
	
	@PostMapping("/myProfile")
	public String myPage_post() {
		return "";
	}
	
	@GetMapping("/checkPwd")
	public String checkPwd_get(HttpSession session) {
		String url="guest/myPage/checkPwd";
		
		String userId=(String)session.getAttribute("userId");
	    int cnt = guestService.checkedUserIdBySnsCode(userId);
	    
	    logger.info("SNS사용자 조회결과, cnt={}",cnt);
	    if(cnt>0) {//SNS유저 일 경우 확인없이 마이프로필
	         url="redirect:/guest/myPage/myProfile";
	    }

		
		logger.info("비밀번호 확인 페이지, [회원정보수정 단계]");
		return url;
	}
	
	@PostMapping("/checkPwd")
	public String checkPwd_post(@RequestParam String userPwd,HttpSession session ,Model model) {
		
		String userId=(String)session.getAttribute("userId");
		logger.info("비밀번호 확인 처리, 파라미터 userId={},userPwd={}",userId,userPwd);
		
		// 2 DB작업
		String userSalt=guestService.selectUserSalt(userId);
		logger.info("사용자 salt 불러오기 결과, userSalt={}",userSalt);
				
		String hex=encryption.getEncryption(userSalt, userPwd);
		logger.info("hex값 변환 결과, hex={}",hex);
				
		int result = guestService.loginCheck(userId, hex);
		logger.info("비밀번호 체크 결과, result={}",result);
		
		String msg="", url="";
		if(result==GuestService.LOGIN_OK) {
			url="/guest/myPage/myProfile";
		}else if(result==GuestService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}

}
