package com.sc.spaceCollection.controller;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.mail.model.MailService;

@Controller
public class MailController {
	private MailService mailService;
	
	@RequestMapping("/mail/doSend")
	@ResponseBody
	public String doSend(@RequestParam(required = false) String email, String title, String body) {
		String test="pcdno3@naver.com";
		String test2="test";
		String test3="test";
		Map<String, Object> sendRs = mailService.send(test, test2, test3);
		return (String) sendRs.get("msg");
	}
}
