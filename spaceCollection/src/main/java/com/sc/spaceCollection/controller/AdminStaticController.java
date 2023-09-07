package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.reservation.model.ReservationService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminStaticController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminStaticController.class);
	
	private final ReservationService reservationService;
	
	@RequestMapping("/adminMain/Ajax_getTotalReservation")
	@ResponseBody
	public int adminMain(@RequestParam(defaultValue = "day")String intervalStandard) {
		logger.info("Ajax - 예약 수 확인, 파라미터 intervalStandard = {}", intervalStandard);
		
		int cnt = reservationService.getReservationCntByInterverStandard(intervalStandard);
		logger.info("예약 수 조회 결과, cnt = {}", cnt);
		
		return cnt;
	}
}
