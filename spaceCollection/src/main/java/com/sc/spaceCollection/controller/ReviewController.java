package com.sc.spaceCollection.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sc.spaceCollection.reservation.model.ReservationService;
import com.sc.spaceCollection.space.model.SpaceService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	private final ReservationService reservationService;
	private final SpaceService spaceService;
	@GetMapping("writeReview")
	public String writeReview_get(@RequestParam int spaceNum,@RequestParam int reservationNum, Model model) {
		logger.info("리뷰작성페이지, 파라미터 spaceNum = {}",spaceNum);
		Map<String,Object> reservationMap = reservationService.reservationReview(reservationNum);
		logger.info("리뷰, 에약정보 조회, reservationMap = {}", reservationMap);
		
		model.addAttribute("reservMap", reservationMap);
		return "review/writeReview";
	}

}
