package com.sc.spaceCollection.email;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/email")
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	private final EmailSender emailSender;
	
	@RequestMapping("/emailCheck")
	public String emailCheck() {
		logger.info("이메일 인증 화면 처리");
		
		return "email/emailCheck";
	}
	
	@RequestMapping("/sendEmail")
	public String email(@RequestParam(required = false) String userEmail, String type, Model model) {
		
		int authCode=(int)(Math.random() * 899999) + 100000;//100000~999999 난수 생성
		logger.info("난수 생성처리, authCode={}",authCode);
		String receiver = userEmail; //받는사람 이메일 주소
		String subject = "스페이크 컬렉션 인증메일 입니다.";
		String content = "인증번호는 : "+authCode+" 입니다";
		String sender = "pcdno3@naver.com"; //보내는 사람의 이메일 주소
							//앞서 설정한 본인의 Naver Email
		try {
			emailSender.sendEmail(subject, content, receiver, sender);
			logger.info("메일 발송 성공!");
			
		} catch (MessagingException e) {
			e.printStackTrace();
			logger.info("메일 발송 실패 : " + e.getMessage());
		}
		
		model.addAttribute("authCode",authCode);
		model.addAttribute("type",type);
		return "email/emailCheck";
		
	}
}
