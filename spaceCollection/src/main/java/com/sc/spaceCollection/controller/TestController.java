package com.sc.spaceCollection.controller;

import org.springframework.aot.hint.annotation.Reflective;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping("/test")
	public String test() {
		return "test";
	}
}
