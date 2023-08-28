package com.sc.spaceCollection.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sc.spaceCollection.guest.model.GuestService;
import com.sc.spaceCollection.host.model.HostService;
import com.sc.spaceCollection.host.model.SpaceCategoryAllVO;
import com.sc.spaceCollection.reservation.model.ReservationService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/host")
public class HostController {
	private static final Logger logger = LoggerFactory.getLogger(HostController.class);
	private final GuestService guestService;
	private final HostService hostService;
	private final ReservationService reservationService;
	
	@RequestMapping("/index")
	public String hostMain() {
		logger.info("호스트 메인 보여주기");
		
		return "host/index";
	}
	
	@RequestMapping("/registration/registration1")
	public String registration1_get(Model model) {
		//1
		logger.info("공간등록 페이지1 보여주기");
		
		//2
		List<SpaceCategoryAllVO> type = hostService.selectSpaceCategory();
		logger.info("type = {}", type);

		//3
		model.addAttribute("type", type);
		
		//4
		return "host/registration/registration1";
	}
	
	
	@RequestMapping("/registration/registration2")
	public String registration2(Model model) {
		//1
		logger.info("공간등록 페이지2 보여주기");
		
		// 2
		List<SpaceCategoryAllVO> type = hostService.selectSpaceCategory();
		logger.info("type = {}", type);

		// 3
		model.addAttribute("type", type);

		//4
		return "host/registration/registration2";
	}
	
	@RequestMapping("/report/account")
	public String account() {
		//1
		logger.info("report/정산완료 페이지");
		
		//2
		
		
		//3
		
		
		//4
		return "host/report/account";
	}
	
	@RequestMapping("/report/draft")
	public String draft() {
		//1
		logger.info("report/정산 예정 페이지");
		
		//2
		
		
		//3
		
		
		//4
		return "host/report/draft";
	}
	
	@RequestMapping("/reservation")
	public String hostReservation(@RequestParam(defaultValue = "1") int page,HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		int userNum = guestService.selectUserInfo(userId).getUserNum();
		logger.info("호스트 예약 조회, 파라미터 userNum = {}, page = {}", userNum, page);
		
		int size = 5;
		List<Map<String, Object>> list = hostService.selectHostReservation(page,size,userNum);
		logger.info("호스트 예약 조회 결과 list = {}", list);
		
		model.addAttribute("list", list);
		
		return "host/hostReservation/hostReservation";
	}
	
	@RequestMapping("/reservationDetail")
	public String hostReservationDetail(@RequestParam int reservationNum, Model model) {
		logger.info("예약내역 확인, 파라미터 reservationNum = {}", reservationNum);
		Map<String, Object> map = reservationService.reservationReview(reservationNum);
		
		model.addAttribute("map", map);
		
		return "host/hostReservation/hostReservationDetail";
	}
	
	@GetMapping("/reservationCalendar")
	public String reservationCalendar() {
		
		return "host/hostReservation/hostReservationCalendar";
	}
	
}
