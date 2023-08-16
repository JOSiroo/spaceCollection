package com.sc.spaceCollection.controller;


import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.reservation.model.ReservationDAO;
import com.sc.spaceCollection.reservation.model.ReservationService;
import com.sc.spaceCollection.reservation.model.ReservationVO;
import com.sc.spaceCollection.space.model.SpaceVO;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailService;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/reservation")
@RequiredArgsConstructor
public class ReservationController {
	private final static Logger logger = LoggerFactory.getLogger(ReservationController.class);
	private final ReservationService reservationService;
	private final SpaceDetailService sdService;
	
	@ResponseBody
	@GetMapping("/ajaxReservation")
	public int ajaxInsertReservation(@RequestParam Map<String, Object> paymentData, Model model) {
		logger.info("예약 화면, 파라미터 paymentData = {}", paymentData);
		ReservationVO vo = new ReservationVO();
		
		String userId = (String) paymentData.get("buyer_name"); 
		int sdNum =Integer.parseInt((String) paymentData.get("custom_data[SD_NUM]"));
		String startDay = (String) paymentData.get("custom_data[START_DAY]");
		String startHour = (String) paymentData.get("custom_data[START_HOUR]");
		String endDay = (String) paymentData.get("custom_data[END_DAY]");
		String endHour = (String) paymentData.get("custom_data[END_HOUR]");
		int reservePrice = Integer.parseInt((String) paymentData.get("paid_amount"));
		int reservePeople = Integer.parseInt((String) paymentData.get("custom_data[RESERVE_PEOPLE]"));
		String paymentType = (String) paymentData.get("pg_provider");
		logger.info("userId = {}, sdNum = {}, startDay = {}, endHour = {}", userId, sdNum, startDay, endHour);
		logger.info("startHour = {}, endDay = {}, reservePrice = {}, paymentType = {}", startHour, endDay, reservePrice, paymentType);
		
		
		int paymentNum = 0;
		if(paymentType.equals("kakaopay")) {
			paymentNum = 1;
		}else if(paymentType.equals("kcp")) {
			paymentNum = 2;
		}
		
		
		vo.setUserId(userId);
		vo.setSdNum(sdNum);
		vo.setReserveStartDay(startDay);
		vo.setReserveStartHour(startHour);
		vo.setReserveFinishDay(endDay);
		vo.setReserveFinishHour(endHour);
		vo.setReservePrice(reservePrice);
		vo.setPaymentNum(paymentNum);
		vo.setReservePeople(reservePeople);
		logger.info("vo세팅 결과, vo = {}", vo);
		
		int cnt = reservationService.insertReservation(vo);
		logger.info("예약 처리 결과, cnt = {}", cnt);
		logger.info("예약 처리 후 vo = {}", vo);
		
		return vo.getReservationNum();
	}
	
	@ResponseBody
	@GetMapping("/ajaxSelectRes")
	public Object selectReservationByDayAndNum(@RequestParam String sdNum,
											@RequestParam String selectedDates) {
		logger.info("ajax 예약조회 파라미터 sdNum = {}, selectedDates = {}", sdNum, selectedDates);
		Map<String, Integer> resultMap = new HashMap<>();

		
		if(reservationService.selectReservationByDayAndNum(Integer.parseInt(sdNum), selectedDates).equals("noData")) {
			logger.info("해당 날짜에 예약내역 없음");
			
			SpaceDetailVO vo = sdService.selectJustDetailByNo(Integer.parseInt(sdNum));
			
			resultMap.put("result", 2);
			resultMap.put("startHour", vo.getSdOpenTime());
			resultMap.put("endHour",vo.getSdCloseTime());
		}else {
			ReservationVO vo = (ReservationVO)reservationService.selectReservationByDayAndNum(Integer.parseInt(sdNum), selectedDates);
			logger.info("ajax 예약조회 결과 vo = {}",vo);

			resultMap.put("result", 1);
			resultMap.put("startHour", Integer.parseInt(vo.getReserveStartHour()));
			resultMap.put("endHour", Integer.parseInt(vo.getReserveFinishHour()));
		}
		return resultMap;
	}
	@GetMapping("/showReservation")
	public String showReservation(@RequestParam int reservationNum, Model model) {
		logger.info("예약 내역 페이지");
		Map<String, Object> map = reservationService.showReservation(reservationNum);
		logger.info("예약 내역 페이지, 조회결과 map.size = {}", map.size());
		
		model.addAttribute("map", map);
		return "reservation/showReservation";
	}
}









