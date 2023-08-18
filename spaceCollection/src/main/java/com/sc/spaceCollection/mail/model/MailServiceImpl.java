package com.sc.spaceCollection.mail.model;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


@Service
class MailServiceImpl implements MailService {
	private static final Logger logger = LoggerFactory.getLogger(MailServiceImpl.class);
	
	@Autowired
	private JavaMailSender sender;

	@Override
	public Map<String, Object> send(String email, String title, String body) {
		MailHandler mail;
		
		try {
			mail = new MailHandler(sender);
			mail.setFrom("spaceCollection@gmail.com","스페이스컬렉션");
			mail.setTo(email);
			mail.setSubject(title);
			mail.setText(body);
			mail.send();
			logger.info("전송완료");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String resultCode="S-1";
		String msg= "메일이 발송되었습니다.";
		return Map.of("resultCode",resultCode,"msg",msg);
	}

}
