package com.sc.spaceCollection.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.qna.model.QnaService;
import com.sc.spaceCollection.qna.model.QnaVO;
import com.sc.spaceCollection.refund.model.RefundVO;
import com.sc.spaceCollection.review.model.ReviewService;
import com.sc.spaceCollection.space.model.SpaceService;
import com.sc.spaceCollection.space.model.SpaceVO;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailService;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailVO;
import com.sc.spaceCollection.zzim.model.ZzimServiceImpl;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SpaceDetailController {
	private static final Logger logger = LoggerFactory.getLogger(SpaceDetailController.class);
	private final SpaceDetailService spaceDetailService;
	private final ReviewService reviewService;
	private final QnaService qnaService;
	
	@GetMapping("/detail")
	public String test2(@RequestParam int spaceNum, HttpSession session,Model model) {
		logger.info("공간 상세 페이지, 파라미터 no = {}", spaceNum);
		
		Map<SpaceVO, List<Map<String, Object>>> resultMap = spaceDetailService.selectDetailByNo(spaceNum);
		SpaceVO vo = new SpaceVO();
		List<Map<String, Object>> qnaList = qnaService.selectQnaBySpaceNum(spaceNum);
		for (Entry<SpaceVO, List<Map<String, Object>>> entry : resultMap.entrySet()) {
			vo = entry.getKey();
		}
		
		RefundVO refundVo = spaceDetailService.selectRefund(vo.getRefundNum());
		
		
		
		
		logger.info("공간 상세 페이지 resultMap = {}", resultMap.size());
		logger.info("공간 상세 페이지 qnaList = {}", qnaList.size());
		logger.info("공간 상세 페이지 resultMap.get(vo) = {}", resultMap.get(vo));
		logger.info("공간 상세 페이지 refundVO vo = {}", refundVo);
		
		
		model.addAttribute("vo", vo);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("map", resultMap.get(vo));
		model.addAttribute("refundVo", refundVo);
		
		return "spaceDetail/detail";
	}
	
	@GetMapping("/callReview")
	@ResponseBody
	public List<Map<String, Object>> callReview(@RequestParam int spaceNum,@RequestParam int page ,Model model){
		logger.info("page = {}", page);
		List<Map<String, Object>> reviewList = reviewService.spaceDetailReview(spaceNum, page);
		
		int avg = 0;
		float floatAvg = 0;
		if(reviewList.size() != 0) {
			for(Map<String, Object> map : reviewList) {
				map.put("REVIEW_REG_DATE",map.get("REVIEW_REG_DATE")+"");
				
				 String tempAvg = String.valueOf(map.get("REVIEW_RATE"));
				 avg += Integer.parseInt(tempAvg);
				 
				 floatAvg = (float)((avg/reviewList.size())/2.0);
			}
		}
		
		
		String avgReview = Float.toString(floatAvg) + "점";
		model.addAttribute("avgReview",avgReview);
		logger.info("공간 상세 페이지 reviewList = {}", reviewList);
		
		return reviewList;
	}
	@GetMapping("/reviewPage")
	@ResponseBody
	public Map<String,Integer> reviewPage(@RequestParam int spaceNum,@RequestParam int page){
		
		int reviewTotalSize = reviewService.getTotalRecordBySpaceNum(spaceNum);
		int reviewBlockPages = 0;
		if(reviewTotalSize % 5 != 0) {
			reviewBlockPages = reviewTotalSize/5 + 1;
		}else {
			reviewBlockPages = reviewTotalSize/5;
		}
		
		Map<String, Integer> reviewPage = new HashMap<>();
		reviewPage.put("reviewBlockPages", reviewBlockPages);
		reviewPage.put("currentPage", page);
		return reviewPage;
	}
}
