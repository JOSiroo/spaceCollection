package com.sc.spaceCollection.mail.model;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.util.ResourceUtils;

import jakarta.mail.internet.MimeMessage;

public class MailHandler {
	
	private JavaMailSender sender;
    private MimeMessage message;
    private MimeMessageHelper messageHelper;

    // 생성자
    public MailHandler(JavaMailSender jSender) throws
            MessagingException, jakarta.mail.MessagingException {
        this.sender = jSender;
        message = jSender.createMimeMessage();
        messageHelper = new MimeMessageHelper(message, true, "UTF-8");
    }

    // 송신자 이메일 추가
    public void setFrom(String mail, String name) throws jakarta.mail.MessagingException, UnsupportedEncodingException {
        messageHelper.setFrom(mail, name);
    }

    // 수신자 이메일 추가
    public void setTo(String email) throws jakarta.mail.MessagingException  {
        messageHelper.setTo(email);
    }

    // 제목 추가
    public void setSubject(String subject) throws jakarta.mail.MessagingException {
        messageHelper.setSubject(subject);
    }

    // 메일 내용 추가
    public void setText(String text) throws jakarta.mail.MessagingException  {
        messageHelper.setText(text);
    }

    // 첨부 파일 추가
    public void setAttach(String displayFileName, String pathToAttachment) throws jakarta.mail.MessagingException, FileNotFoundException  {
        File file = new File(ResourceUtils.getFile(pathToAttachment).getAbsolutePath());
        FileSystemResource fsr = new FileSystemResource(file);

        messageHelper.addAttachment(displayFileName, fsr);
    }

    // 이메일 발송
    public void send() {
        try {
            sender.send(message);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
}
