package com.sc.spaceCollection.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class collectionController {
	
	@RequestMapping("/collection")
	public String collectionList() {
		
		return "collection/collection";
	}
}
