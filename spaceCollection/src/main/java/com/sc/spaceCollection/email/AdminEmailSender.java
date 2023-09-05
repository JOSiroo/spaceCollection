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
	
	public void sendSpaceConfirmEmail() throws MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		
		message.setFrom(new InternetAddress("pcdno3@naver.com"));
		message.setRecipient(RecipientType.TO, new InternetAddress("hjk4782@naver.com"));
		message.setSubject("<SpaceCollection> 공간 승인 신청 결과 안내");
		
		String text = "";
		text += "<h2><공간 승인 신청 결과 안내></h2>";
		text += "<p>안녕하세요. 공간에 사람을 채우다. <br>";
		text += "<span style=\'font-weight: bold;\'>SpaceCollection</span> 입니다.</p>";
		text += "<br>";
		text += "<br>";
		text += "먼저 저희 <span style=\'font-weight: bold;\'>SpaceCollection</span>에 공간 신청해주셔서 감사 말씀드립니다.</p>";
		text += "<P>신청해 주신 공간에 대한 승인 결과를 아래와 같이 안내드립니다.</P>";
		text += "<div style=\'background-color: rgb(207, 226, 254); padding: 5px; width: 60%;\'>";
		text += "<h4>승인 결과 내용</h4>";
		text += "<p>";
		text += "<span>공간 번호 : 21</span>";
		text += "<br>";
		text += "<span>공간 타입 : 사과나무</span>";
		text += "<br>";
		text += "<span>공간명 : [뮤즈와인드사운드] 셀프레코딩 룸</span>";
		text += "<br>";
		text += "<span>신청일 : 2023.12.24</span>";
		text += "<br>";
//		if() {
			text += "<h4 style=\'color: blue; font-weight: bold;\'>승인결과 : 승인</h4>";
//		}else {
			text += "<h4 style=\'color: red; font-weight: bold;\'>승인결과 : 거절";
			text += "<span><사유 : </span><span>정보 누락></span>";
//		}
		text += "</h4>";
		text += "<span>결정일 : 2023.12.24</span><br>";
		text += "</p>";
		text += "</div>";
//		if() {
			text += "<p>공간 예약을 받기 전, 반드시 홈페이지에 방문하여 서비스이용수칙을 확인해 주시기 바랍니다.</p>";
			text += "<>공간 예약을 받기 전, 반드시 홈페이지에 방문하여 서비스이용수칙을 확인해 주시기 바랍니다.</p>";
//		}else {
			text += "<p>위 결정과 관련하여 문의가 있으신 경우, 메일 또는 1:1문의로 문의해주시기 바랍니다.";
//		}
		text += "<br>";
		text += "<br>";
		text += "감사합니다.";
		text += "</p>";
		
		message.setText(text, "utf-8", "html");
		
		mailSender.send(message);
	}	
}
