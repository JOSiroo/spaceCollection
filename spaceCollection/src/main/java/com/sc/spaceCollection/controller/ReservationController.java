package com.sc.spaceCollection.controller;

import java.sql.Timestamp;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.reservation.model.ReservationDAO;
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
	@GetMapping("/ajaxReservation")
	public void ajaxInsertReservation(@RequestParam Map<String, Object> paymentData) {
		logger.info("예약 화면, 파라미터 paymentData = {}", paymentData);
		ReservationVO vo = new ReservationVO();

		int userNum = Integer.parseInt((String) paymentData.get("buyer_name")); 
		int sdNum =Integer.parseInt((String) paymentData.get("custom_data[SD_NUM]"));
		String startDay = (String) paymentData.get("custom_data[START_DAY]");
		String startHour = (String) paymentData.get("custom_data[START_HOUR]");
		String endDay = (String) paymentData.get("custom_data[END_DAY]");
		String endHour = (String) paymentData.get("custom_data[END_HOUR]");
		int reservePrice = Integer.parseInt((String) paymentData.get("paid_amount"));
		String paymentType = (String) paymentData.get("pg_provider");
		logger.info("userNum = {}, sdNum = {}, startDay = {}, endHour = {}", userNum, sdNum, startDay, endHour);
		logger.info("startHour = {}, endDay = {}, reservePrice = {}, paymentType = {}", startHour, endDay, reservePrice, paymentType);
		
		
		int paymentNum = 0;
		if(paymentType.equals("kakaopay")) {
			paymentNum = 1;
		}else if(paymentType.equals("kcp")) {
			paymentNum = 2;
		}
		
		
		vo.setUserNum(userNum);
		vo.setSdNum(sdNum);
		vo.setReserveStartDay(startDay);
		vo.setReserveStartHour(startHour);
		vo.setReserveFinishDay(endDay);
		vo.setReserveFinishHour(endHour);
		vo.setReservePrice(reservePrice);
		vo.setPaymentNum(paymentNum);
		logger.info("vo세팅 결과, vo = {}", vo);
		
		int cnt = reservationService.insertReservation(vo);
		logger.info("예약 처리 결과, cnt = {}", cnt);
	}
	
}









