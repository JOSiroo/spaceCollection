package com.sc.spaceCollection.controller;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public Map<String, Object> Ajax_getTotalReservation(@RequestParam String intervalStandard) {
		logger.info("Ajax - 예약 수 확인, 파라미터 intervalStandard = {}", intervalStandard);
		
		String standard = "";
		String str = "";
		
		if(intervalStandard == null || intervalStandard.isEmpty()) {
			standard = "Today";
			str = "전일";
		}else if(intervalStandard.equals("month")){
			standard = "This Week";
			str = "전월";
		}else if(intervalStandard.equals("year")) {
			standard = "This Year";
			str = "전년";
		}
		
		int precentCnt = reservationService.getReservationCntByInterverStandard(intervalStandard);
		logger.info("예약 수 조회 결과, precentCnt = {}", precentCnt);
		
		int pastCnt = reservationService.getReservationCntByInterverStandard2(intervalStandard);
		logger.info("예약 수 조회 결과, pastCnt = {}", pastCnt);
		
		double percent = 0;
		try {
			percent = Math.round(((precentCnt-pastCnt)/pastCnt)*10)/10;
		} catch (ArithmeticException e) {
			percent = 0;
		}
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("standard", standard);
		map.put("str", str);
		map.put("precentCnt", precentCnt);
		map.put("pastCnt", pastCnt);
		map.put("percent", percent);
		
		return map;
	}
	
	@RequestMapping("/adminMain/Ajax_getTotalReservationPrice")
	@ResponseBody
	public Map<String, Object> Ajax_getTotalReservationPrice(@RequestParam String intervalStandard) {
		logger.info("Ajax - 예약 금액 확인, 파라미터 intervalStandard = {}", intervalStandard);
		
		String standard = "";
		String str = "";
		
		if(intervalStandard == null || intervalStandard.isEmpty()) {
			standard = "Today";
			str = "전일";
		}else if(intervalStandard.equals("month")){
			standard = "This Week";
			str = "전월";
		}else if(intervalStandard.equals("year")) {
			standard = "This Year";
			str = "전년";
		}
		
		int precentTotalPrice = reservationService.getReservationMoneyByInterverStandard(intervalStandard);
		logger.info("예약 금액 조회 결과, precentTotalPrice = {}", precentTotalPrice);
	
		
		int pastTotalPrice = reservationService.getReservationMoneyByInterverStandard2(intervalStandard);
		logger.info("예약 금액 조회 결과, pastTotalPrice = {}", pastTotalPrice);
		
		double percent = 0;
		try {
			percent = Math.round(((precentTotalPrice-pastTotalPrice)/pastTotalPrice)*10)/10;
		} catch (ArithmeticException e) {
			percent = 0;
		}
		
		DecimalFormat df = new DecimalFormat("#,###");
		String precentTotalPriceTrans = df.format(precentTotalPrice);
		String pastTotalPriceTrans = df.format(pastTotalPrice);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("standard", standard);
		map.put("str", str);
		map.put("precentTotalPrice", precentTotalPriceTrans);
		map.put("pastTotalPrice", pastTotalPriceTrans);
		map.put("percent", percent);
		
		return map;
	}
	
	@RequestMapping("/adminMain/Ajax_getReservationTypeByInterverStandard")
	@ResponseBody
	public Map<String, Object> Ajax_getReservationTypeByInterverStandard(@RequestParam String intervalStandard) {
		logger.info("Ajax - 공간 타입별 예약 수 확인, 파라미터 intervalStandard = {}", intervalStandard);
		
		Map<String, Object> map = reservationService.getReservationTypeByInterverStandard(intervalStandard);
		logger.info("예약 금액 조회 결과, map = {}", map);
		
		return map;
	}
	
	@RequestMapping("/adminMain")
	public String getRecentReservationList(Model model) {
		
		List<Map<String, Object>> list = reservationService.getRecentReservationList();
		
		model.addAttribute("list", list);
		
		return "admin/adminMain";
	}
}
