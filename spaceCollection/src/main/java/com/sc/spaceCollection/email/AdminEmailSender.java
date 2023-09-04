package com.sc.spaceCollection.email;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMessage.RecipientType;
import lombok.RequiredArgsConstructor;


@Component
@RequiredArgsConstructor
public class AdminEmailSender {

	private final JavaMailSender mailSender;
	
	public void sendEmail(String subject, String content, String receiver
			, String sender) throws MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		
		message.setFrom(new InternetAddress(sender));
		message.setRecipient(RecipientType.TO, new InternetAddress(receiver));
		message.setSubject(subject);
		
		String text = "";
		
		message.setText(text, "utf-8", "html");
		
		mailSender.send(message);
	}	
}
