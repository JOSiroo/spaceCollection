package com.sc.spaceCollection.controller;

import java.util.List;
import java.util.Map;

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

import com.sc.spaceCollection.board.model.BoardService;
import com.sc.spaceCollection.calendar.model.CalendarService;
import com.sc.spaceCollection.calendar.model.CalendarVO;
import com.sc.spaceCollection.guest.model.GuestService;
import com.sc.spaceCollection.host.model.HostService;
import com.sc.spaceCollection.host.model.SpaceCategoryAllVO;
import com.sc.spaceCollection.host.model.SpaceTypeVO;
import com.sc.spaceCollection.reservation.model.ReservationService;
import com.sc.spaceCollection.space.model.SpaceVO;
import com.sc.spaceCollection.userInfo.model.UserInfoVO;

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
	private final CalendarService calendarService;
	private final BoardService boardService;
	
	@RequestMapping("/index")
	public String hostMain() {
		logger.info("호스트 메인 보여주기");
		
		return "host/index";
	}
	
	@RequestMapping("/registration/registration1")
	public String registration1(Model model) {
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
	
	@GetMapping("/registration/registration2")
	public String registration3(Model model) {
		//1
		logger.info("공간등록 페이지 보여주기");
		
		//2
		List<SpaceCategoryAllVO> type = hostService.selectSpaceCategory();
		logger.info("type = {}", type);
		
		//3
		model.addAttribute("type", type);
		
		//4
		return "host/registration/registration2";
	}
	
	@PostMapping("/registration/registration2")
	public String registration2(@ModelAttribute SpaceVO spaceVo, @ModelAttribute SpaceTypeVO spaceTypeVO,
			HttpSession session, Model model) {
		logger.info("공간등록 처리, spaceVo = {}, spaceTypeVo = {}", spaceVo, spaceTypeVO);
		
		//공간 번호 조회
		SpaceTypeVO spaceTypeVO2 = hostService.selectSpaceTypeBySpaceTypeName(spaceTypeVO.getSpaceTypeName());
		spaceVo.setSpaceTypeNo(spaceTypeVO2.getSpaceTypeNo());
		logger.info("공간 타입 번호 조회, SpaceTypeNo = {}", spaceTypeVO2.getSpaceTypeNo());
		
		//사용자 번호 조회
		String userId = (String) session.getAttribute("userId");
		UserInfoVO user = hostService.selectUserById(userId);
		spaceVo.setUserNum(user.getUserNum());
		logger.info("유저 번호 조회, UserNum = {}", user.getUserNum());
		
		//주소
		String zipcode = "우편번호", address = "주소", adDetail = "상세주소";
		Double latitude = 1.1, longitude = 2.2;
		spaceVo.setSpaceZipcode(zipcode);
		spaceVo.setSpaceAddress(address);
		spaceVo.setSpaceAddressDetail(adDetail);
		spaceVo.setLatitude(latitude);
		spaceVo.setLongitude(longitude);
		
		//공간 등록
		int cnt = hostService.insertSpace(spaceVo);
		logger.info("cnt = {}", cnt);
		
		return "redirect:/host/index";
	}
	
	@GetMapping("/registration/spDetail")
	public String spDetail(Model model) {
		//1
		logger.info("세부 공간등록 보여주기");
		
		// 2
		// 3
		
		//4
		return "host/registration/spDetail";
	}
	
	@PostMapping("/registration/spDetail")
	public String registration4() {
		//1
		logger.info("세부 공간등록 처리");
		
		//2
		
		
		//3
		
		
		//4
		return "host/registration/registration4";
	}
	
	//page=1&order=reservationNum&status=before&keyword=fd
	@RequestMapping("/reservation")
	public String hostReservation(HttpSession session, Model model,
									@RequestParam(defaultValue = "1") int page,
									@RequestParam(required = false) String status,
									@RequestParam(required = false) String order,
									@RequestParam(required = false) String keyword) {
		String userId = (String)session.getAttribute("userId");
		if(userId == null || userId.isEmpty()) {
			model.addAttribute("msg", "먼저 로그인을 해주세요");
			model.addAttribute("url", "/login/login");
			
			return "common/message";
		}
		
		
		int userNum = guestService.selectUserInfo(userId).getUserNum();
		logger.info("호스트 예약 조회, 파라미터 userNum = {}, page = {}", userNum, page);
		logger.info("호스트 예약 조회, 파라미터 status = {}, order = {}, keyword", status, order, keyword);
		
		int size = 5;
		List<Map<String, Object>> list = hostService.selectHostReservation(page,size,userNum,status,order,keyword);
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
	@GetMapping("/calendarDetail")
	@ResponseBody
	public Map<String, Object> calendarDetail(@RequestParam int reservationNum) {
		logger.info("ajax예약내역 확인, 파라미터 reservationNum = {}", reservationNum);
		Map<String, Object> map = reservationService.reservationReview(reservationNum);
		map.put("RESERVER_PAY_DAY", map.get("RESERVER_PAY_DAY") + "");
		logger.info("payday = {}", map.get("RESERVER_PAY_DAY"));
		logger.info("ajax예약내역 확인, 결과 map = {}", map);
		
		return map;
	}
	
	@GetMapping("/reservationCalendar")
	public String reservationCalendar(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		if(userId == null || userId.isEmpty()) {
			model.addAttribute("msg", "먼저 로그인을 해주세요");
			model.addAttribute("url", "/");
			
			return "common/message";
		}
		
		
		int userNum = guestService.selectUserInfo(userId).getUserNum();
		logger.info("호스트 캘린더, 파라미터 userNum = {}", userNum);
		
		
		
		List<CalendarVO> calList = calendarService.selectMemoByUserNum(userNum);
		List<Map<String, Object>> list = hostService.HostReservationCalendar(userNum);
		
		model.addAttribute("list", list);
		model.addAttribute("calList", calList);
		
		return "host/hostReservation/hostReservationCalendar";
	}
	
	@GetMapping("/calendarDate")
	@ResponseBody
	public List<Integer> getDataByDate(@RequestParam String date,HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		int userNum = guestService.selectUserInfo(userId).getUserNum();
		logger.info("날짜별 매출액 조회, 파라미터 date = {}, userId = {}",date, userId);
		
		List<Integer> result = hostService.getDataByDate(date,userNum);
		logger.info("매출액 조회 결과, result.size = {}", result);
		
		return result;
	}
	
	@RequestMapping("/calculate")
	public String calculate(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		if(userId == null || userId.isEmpty()) {
			model.addAttribute("msg", "정산 페이지는 로그인이 필요합니다");
			model.addAttribute("url", "/host/index");
			
			return "common/message";
		}
		return "host/calculate/calculate";
	}
	
	@RequestMapping("/notice")
    public String notice(Model model,
						@RequestParam(defaultValue = "1") int page,
						@RequestParam(required = false) String boardTitle,
						@RequestParam(required = false) String boardContent,
						@RequestParam(defaultValue = "1") int boardNum,
						@RequestParam(required = false) String searchKeyword) {
		
		
		//logger.info("공지사항 검색 조회, 파라미터 boardTitle = {}, boardContent = {}, page={}", boardTitle, boardContent);
		logger.info("검색, 파라미터 keyword = {}", searchKeyword);
		
		
		int size = 5;
		List<Map<String, Object>> list = boardService.selectNotice(page,size,boardTitle,boardContent,searchKeyword);
		logger.info("공지사항 조회 결과 list.size = {}", list);
		
		model.addAttribute("list", list);
        return "host/board/notice";
    }
	
}
