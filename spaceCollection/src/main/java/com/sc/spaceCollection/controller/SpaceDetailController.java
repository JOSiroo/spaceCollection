package com.sc.spaceCollection.controller;

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

import com.sc.spaceCollection.qna.model.QnaService;
import com.sc.spaceCollection.qna.model.QnaVO;
import com.sc.spaceCollection.refund.model.RefundVO;
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
		
		logger.info("공간 상세 페이지 resultMap = {}", resultMap);
		logger.info("공간 상세 페이지 qnaList = {}", qnaList);
		logger.info("공간 상세 페이지 resultMap.get(vo) = {}", resultMap.get(vo));
		logger.info("공간 상세 페이지 refundVO vo = {}", refundVo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("map", resultMap.get(vo));
		model.addAttribute("refundVo", refundVo);
		
		return "spaceDetail/detail";
	}
}
