package com.sc.spaceCollection.mail.model;

import java.util.Map;

public interface MailService {
	Map<String, Object> send(String email, String title, String body);
}
