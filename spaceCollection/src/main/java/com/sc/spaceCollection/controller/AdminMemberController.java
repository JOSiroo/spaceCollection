package com.sc.spaceCollection.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.common.AjaxVO;
import com.sc.spaceCollection.common.ConstUtil;
import com.sc.spaceCollection.common.PaginationInfo;
import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.reservation.model.ReservationService;
import com.sc.spaceCollection.review.model.ReviewService;
import com.sc.spaceCollection.userInfo.model.UserInfoService;
import com.sc.spaceCollection.userInfo.model.UserInfoVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/member")
@RequiredArgsConstructor
public class AdminMemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminMemberController.class);
	
	private final UserInfoService userInfoService;
	private final ReservationService reservationService;
	private final ReviewService reviewService;
	
	@RequestMapping("/memberList")
	public void memberList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("회원목록 조회, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<UserInfoVO> list = userInfoService.selectMember(searchVo);
		logger.info("회원목록 조회 결과, list.size = {}", list.size());
		
		int totalRecord = userInfoService.getTotalRecord(searchVo);
		logger.info("전체 회원 수, totalRecord = {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list );
		model.addAttribute("searchVo", searchVo );
		model.addAttribute("pagingInfo", pagingInfo );
	}
	
	@RequestMapping("/memberDetail")
	public String memberDetail(@RequestParam(defaultValue = "0")int userNum, Model model) {
		logger.info("회원정보 조회, 파라미터 userNum = {}", userNum);
		
		Map<String, Object> memberMap = userInfoService.selectByUserNum(userNum);
		logger.info("회원정보 조회 결과, memberMap = {}", memberMap);
		
		model.addAttribute("memberMap", memberMap);
		
		return "admin/member/memberDetail";
	}
	
	@RequestMapping("/memberDetail/ajax_reservationList")
	@ResponseBody
	public AjaxVO ajax_reservationList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("ajax - 예약 내역 조회, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(5);
		
		//게시물 구분
		pagingInfo.setKindFlag("reservation");
		
		searchVo.setRecordCountPerPage(5);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> reservationList = reservationService.selectReservationAll(searchVo);
			
		logger.info("ajax - 예약 내역 조회 결과, reservationList.size = {}", reservationList.size());
		
		int totalRecord = reservationService.getTotalRecord(searchVo);
		logger.info("ajax -전체 예약 수, totalRecord = {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		AjaxVO AjaxVo = new AjaxVO();
		AjaxVo.setPagingInfo(pagingInfo);
		AjaxVo.setAjaxList(reservationList);
		AjaxVo.setSearchVo(searchVo);
		
		return AjaxVo;
	}
	
	@RequestMapping("/memberDetail/ajax_reviewList")
	@ResponseBody
	public AjaxVO ajax_reviewList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("ajax - 리뷰 내역 조회, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(5);
		
		pagingInfo.setKindFlag("review");
		
		searchVo.setRecordCountPerPage(5);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> reviewList = reviewService.selectReviewEachUser(searchVo);
		logger.info("ajax - 리뷰 내역 조회 결과, reviewList.size = {}", reviewList.size());
		
		int totalRecord = reviewService.getTotalRecord(searchVo);
		logger.info("ajax -전체 리뷰 수, totalRecord = {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		AjaxVO ajaxVo = new AjaxVO();
		ajaxVo.setPagingInfo(pagingInfo);
		ajaxVo.setAjaxList(reviewList);
		ajaxVo.setSearchVo(searchVo);
		
		return ajaxVo;
	}

}
