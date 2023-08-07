package com.sc.spaceCollection.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.reservation.model.ReservationService;
import com.sc.spaceCollection.reservation.model.ReservationVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/reservation")
@RequiredArgsConstructor
public class ReservationController {
	private final static Logger logger = LoggerFactory.getLogger(ReservationController.class);
	private final ReservationService reservationService;
	
	@ResponseBody
	@RequestMapping("/ajaxReservation")
	public ReservationVO ajaxInsertReservation(@ModelAttribute ReservationVO vo) {
		logger.info("예약 화면, 파라미터 vo = {} ", vo);
		
		int cnt = reservationService.insertReservation(vo);
		
		return vo;
	}
	
}









