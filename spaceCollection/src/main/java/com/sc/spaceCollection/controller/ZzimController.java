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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.guest.model.GuestService;
import com.sc.spaceCollection.zzim.model.ZzimService;
import com.sc.spaceCollection.zzim.model.ZzimServiceImpl;
import com.sc.spaceCollection.zzim.model.ZzimVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ZzimController {
	private final ZzimService zzimService;
	private final GuestService guestService;
	private final static Logger logger = 
			LoggerFactory.getLogger(ZzimController.class);
	

	@GetMapping("/zzim")
	@ResponseBody
	public int zzim(HttpSession session,@RequestParam int spaceNum, Model model) {
		int result = 0;
		String userId = (String)session.getAttribute("userId");
		if(userId == null || userId.isEmpty()) {
			return ZzimServiceImpl.NOT_LOGIN;
		}
		
		int userNum = guestService.selectUserInfo(userId).getUserNum();
		logger.info("찜 파리미터 userNum = {}, spaceNum = {}", userNum, spaceNum);
		
		result = zzimService.selectZzimBySpaceNum(spaceNum,userNum);
		
		if(result == ZzimServiceImpl.ZZIM_OK) {
			result = ZzimServiceImpl.ZZIM_OK;
		}else if(result == ZzimServiceImpl.ZZIM_DELETE) {
			result = ZzimServiceImpl.ZZIM_DELETE;
		}
		
		logger.info("찜 결과 : result = {}",result);
		
		model.addAttribute("notLogin", ZzimServiceImpl.NOT_LOGIN);
		model.addAttribute("ok", ZzimServiceImpl.ZZIM_OK);
		model.addAttribute("deleted", ZzimServiceImpl.ZZIM_DELETE);
		
		return result;
	}
	
	
	@GetMapping("/showZzim")
	@ResponseBody
	public int showZzim(HttpSession session,@RequestParam int spaceNum, Model model) {
		
		String userId = (String)session.getAttribute("userId");
		if(userId == null || userId.isEmpty()) {
			return ZzimServiceImpl.NOT_LOGIN;
		}
		
		int userNum = guestService.selectUserInfo(userId).getUserNum();
		
		int result = 0;
		result = zzimService.selectZzim(spaceNum, userNum);
		logger.info("찜 결과 : result = {}",result);
		
		return result;
	}
	@RequestMapping("/zzimList")
	public String zzimList_show() {
		return "zzim/zzimList";
	}
	
	@GetMapping("/getZzimList")
	@ResponseBody
	public List<Map<String,Object>> zzimList(HttpSession session,@RequestParam int page, @RequestParam int size, Model model ) {
		String userId =(String)session.getAttribute("userId");
		int userNum = guestService.selectUserInfo(userId).getUserNum();
		
		
		
		logger.info("찜 목록 조회, 파라미터 Usernum = {}",userNum);
		List<Map<String, Object>> list = zzimService.showZzimList(page, size, userNum);
		logger.info("찜 목록 조회, 파라미터 결과 = {}",list);
		
		model.addAttribute("list", list);
		return list;
	}
}
