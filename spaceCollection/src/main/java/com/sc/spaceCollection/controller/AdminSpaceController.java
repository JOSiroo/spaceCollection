package com.sc.spaceCollection.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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

import com.sc.spaceCollection.common.AjaxVO;
import com.sc.spaceCollection.common.ConstUtil;
import com.sc.spaceCollection.common.PaginationInfo;
import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.host.model.SpaceTypeVO;
import com.sc.spaceCollection.space.model.SpaceListVO;
import com.sc.spaceCollection.space.model.SpaceService;
import com.sc.spaceCollection.spaceType.model.SpaceTypeListVO;
import com.sc.spaceCollection.spaceType.model.SpaceTypeService;
import com.sc.spaceCollection.spaceTypeCategory.model.SpaceTypeCategoryListVO;
import com.sc.spaceCollection.spaceTypeCategory.model.SpaceTypeCategoryService;
import com.sc.spaceCollection.spaceTypeCategory.model.SpaceTypeCategoryVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/space")
@RequiredArgsConstructor
public class AdminSpaceController {
	private static final Logger logger = LoggerFactory.getLogger(AdminSpaceController.class);
	
	private final SpaceTypeCategoryService spaceTypeCategoryService;
	private final SpaceTypeService spaceTypeService;
	private final SpaceService spaceService;
	
	@RequestMapping("/spaceTypeCategoryList")
	public void spaceTypeCategoryList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("공간타입 카테고리 조회");
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<SpaceTypeCategoryVO> list = spaceTypeCategoryService.selectSpaceTypeCategory(searchVo);
		logger.info("공간타입 카테고리 조회 결과, list.size = {}", list.size());
		
		int totalRecord = spaceTypeCategoryService.getTotalRecord(searchVo);
		logger.info("전체 공간타입 카테고리 수,  totalRecord = {}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
		
	}
	
	@PostMapping("/spaceTypeCategoryWrite")
	public String spaceTypeCategoryWrite(@ModelAttribute SpaceTypeCategoryVO vo, Model model) {
		logger.info("공간 타입 카테고리 등록, 파라미터 vo = {}", vo);
		
		int cnt = spaceTypeCategoryService.insertSpaceTypeCategory(vo);
		logger.info("공간 타입 카테고리 등록 결과, cnt = {}", cnt);
		
		String msg = "카테고리 등록 중 오류가 발생했습니다. 다시 시도해주시기 바랍니다.", url = "/admin/space/spaceTypeCategoryList";
		if(cnt==SpaceTypeCategoryService.PASS) {
			return "redirect:/admin/space/spaceTypeCategoryList";
		}else if(cnt==SpaceTypeCategoryService.DUB) {
			msg = "이미 사용중인 카테고리명 입니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
		
	}
	
	@RequestMapping("/spaceTypeCategoryActive")
	public String spaceTypeCategoryActive(@ModelAttribute SpaceTypeCategoryListVO listVo, Model model) {
		logger.info("카테고리 활성화, 파라미터 listVo = {}", listVo);
		
		int cnt = spaceTypeCategoryService.spaceTypeCategoryActivation(listVo);
		
		String msg = "카테고리 활성화에 실패했습니다. 관리자에게 문의해주시기 바랍니다.", url = "/admin/space/spaceTypeCategoryList";
		if(cnt>0) {
			msg = "카테고리가 활성화 되었습니다.";
		}else if(cnt == -1) {
			msg = "카테고리 활성화 중 문제가 발생하였습니다. 다시 시도해주시기 바랍니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
		
	}
	
	@RequestMapping("/spaceTypeCategoryDeActive")
	public String spaceTypeCategoryDeActive(@ModelAttribute SpaceTypeCategoryListVO listVo, Model model) {
		logger.info("카테고리 비활성화, 파라미터 listVo = {}", listVo);
		
		int cnt = spaceTypeCategoryService.spaceTypeCategoryDeactivation(listVo);
		
		String msg = "카테고리 비활성화에 실패했습니다. 관리자에게 문의해주시기 바랍니다.", url = "/admin/space/spaceTypeCategoryList";
		if(cnt>0) {
			msg = "카테고리가 비활성화 되었습니다.";
		}else if(cnt == -1) {
			msg = "카테고리 비활성화 중 문제가 발생하였습니다. 다시 시도해주시기 바랍니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@RequestMapping("/spaceTypeList")
	public void spaceTypeList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("공간타입 조회, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> list = spaceTypeService.selectSpaceType(searchVo);
		logger.info("공간타입 조회 결과, list.size = {}", list.size());
		
		int totalRecord = spaceTypeService.getTotalRecord(searchVo);
		logger.info("전체 공간타입 수,  totalRecord = {}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
	}
	
	@RequestMapping("/spaceTypeActive")
	public String spaceTypeActive(@ModelAttribute SpaceTypeListVO listVo, Model model) {
		logger.info("공간 타입 활성화, 파라미터 listVo = {}", listVo);
		
		int cnt = spaceTypeService.spaceTypeActivation(listVo);
		
		String msg = "공간 타입 활성화에 실패했습니다. 관리자에게 문의해주시기 바랍니다.", url = "/admin/space/spaceTypeList";
		if(cnt>0) {
			msg = "공간 타입이 활성화 되었습니다.";
		}else if(cnt == -1) {
			msg = "공간 타입 활성화 중 문제가 발생하였습니다. 다시 시도해주시기 바랍니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@GetMapping("/spaceType/spaceTypeWrite")
	public String spaceTypeWrite_get(Model model) {
		logger.info("공간 카테고리 출력");
		List<SpaceTypeCategoryVO> list = spaceTypeCategoryService.selectSpaceTypeCategoryAll();
		logger.info("공간 카테고리 출력 결과, list.size = {}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/space/spaceTypeWrite";
	}
	
	@PostMapping("/spaceType/spaceTypeWrite")
	public String spaceTypeWrite_post(@ModelAttribute SpaceTypeVO spaceTypeVo, Model model) {
		logger.info("공간 타입 등록, 파라미터 spaceTypeVo = {}", spaceTypeVo);
		
		int cnt = spaceTypeService.insertSpaceType(spaceTypeVo);
		logger.info("공간 타입 등록 결과, cnt = {}", cnt);
		
		String msg = "공간 등록 중 문제가 발생했습니다. 관리자에게 문의해주시기 바랍니다.", 
				url = "/admin/space/spaceType/spaceTypeWrite";
		if(cnt == SpaceTypeService.DUB) {
				msg = "이미 사용중인 공간 타입명입니다.";
		}else if(cnt == SpaceTypeService.PASS) {
				return "redirect:/admin/space/spaceTypeList";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@RequestMapping("/spaceTypeDeActive")
	public String spaceTypeDeActive(@ModelAttribute SpaceTypeListVO listVo, Model model) {
		logger.info("공간 타입 비활성화, 파라미터 listVo = {}", listVo);
		
		int cnt = spaceTypeService.spaceTypeDeactivation(listVo);
		
		String msg = "공간 타입 비활성화에 실패했습니다. 관리자에게 문의해주시기 바랍니다.", url = "/admin/space/spaceTypeList";
		if(cnt>0) {
			msg = "공간 타입이 비활성화 되었습니다.";
		}else if(cnt == -1) {
			msg = "공간 타입 비활성화 중 문제가 발생하였습니다. 다시 시도해주시기 바랍니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@RequestMapping("/spaceType/spaceTypeDetail")
	public String spaceTypeDetail(@RequestParam String spaceTypeName, Model model) {
		logger.info("공간 타입 상세보기, 파라미터 spaceTypeName = {}", spaceTypeName);
		
		Map<String, Object> map = spaceTypeService.selectBySpaceTypeName(spaceTypeName);
		logger.info("공간 타입 상세보기 결과, map = {}", map);
		
		model.addAttribute("map", map);
		
		return "admin/space/spaceTypeDetail";
	}
	
	@GetMapping("/spaceType/spaceTypeEdit")
	public String spaceTypeEdit_get(@RequestParam String spaceTypeName, Model model) {
		logger.info("공간 타입 조회, 파라미터 spaceTypeName = {}", spaceTypeName);
		
		List<SpaceTypeCategoryVO> list = spaceTypeCategoryService.selectSpaceTypeCategoryAll();
		
		Map<String, Object> map = spaceTypeService.selectBySpaceTypeName(spaceTypeName);
		logger.info("공간 타입 조회 결과, map = {}", map);
		
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		
		return "admin/space/spaceTypeWrite";
	}
	
	@PostMapping("/spaceType/spaceTypeEdit")
	public String spaceTypeEdit_post(@ModelAttribute SpaceTypeVO spaceTypeVo, Model model) throws UnsupportedEncodingException {
		logger.info("공간 타입 수정, 파라미터 spaceTypeVo = {}", spaceTypeVo);
		SpaceTypeVO spaceTypeVo2 = spaceTypeService.selectSpaceTypeBySpaceTypeNo(spaceTypeVo.getSpaceTypeNo());
		int cnt = spaceTypeService.updateSpaceType(spaceTypeVo);
		logger.info("공간 타입 수정 결과, cnt = {}", cnt);
		
		String msg = "공간 타입 수정 처리 중 문제가 발생했습니다. 다시 시도해주시기 바랍니다.", url = "/admin/space/spaceType/spaceTypeEdit?spaceTypeName="+spaceTypeVo2.getSpaceTypeName();
		if(cnt == SpaceTypeService.PASS ) {
			String trans = URLEncoder.encode(spaceTypeVo.getSpaceTypeName(), "UTF-8");
			return "redirect:/admin/space/spaceType/spaceTypeDetail?spaceTypeName="+trans;
		}else if(cnt == SpaceTypeService.DUB) {
			msg = "이미 사용중인 공간 타입명 입니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@RequestMapping("/spaceList")
	public void spaceList(Model model) {
		logger.info("공간 조회");
	}
	
	@RequestMapping("/spaceConfirmList")
	public void spaceConfirmList() {
		logger.info("공간 승인 목록 화면");
		
	}
	
	@RequestMapping("/spaceConfirmList/ajax_spaceConfirmList")
	@ResponseBody
	public AjaxVO ajax_spaceConfirmList(@ModelAttribute SearchVO searchVo) {
		logger.info("ajax - 공간 승인 요청 내역 조회, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		pagingInfo.setKindFlag("spaceConfirmList");
		logger.info("pagining = {}", pagingInfo.getBlockSize());
		
		searchVo.setRecordCountPerPage(20);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> spaceList = spaceService.selectSpaceConfirmList(searchVo);
		logger.info("ajax - 공간 등록 내역 조회 결과, spaceList.size = {}", spaceList.size());
		
		int totalRecord = spaceService.getTotalRecordSpaceConfrimList(searchVo);
		logger.info("ajax -전체 공간 등록 수, totalRecord = {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		AjaxVO ajaxVo = new AjaxVO();
		ajaxVo.setPagingInfo(pagingInfo);
		ajaxVo.setAjaxList(spaceList);
		ajaxVo.setSearchVo(searchVo);
		
		return ajaxVo;
	}
	
	@RequestMapping("/spaceConfirmList/ajax_spaceConfirmHistoryList")
	@ResponseBody
	public AjaxVO ajax_spaceConfirmHistoryList(@ModelAttribute SearchVO searchVo) {
		logger.info("ajax - 공간 승인 내역 조회, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		pagingInfo.setKindFlag("spaceConfirmHistoryList");
		logger.info("pagining = {}", pagingInfo.getBlockSize());
		
		searchVo.setRecordCountPerPage(20);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> spaceList = spaceService.selectSpaceConfirmList(searchVo);
		logger.info("ajax - 공간 등록 내역 조회 결과, spaceList.size = {}", spaceList.size());
		
		int totalRecord = spaceService.getTotalRecordSpaceConfrimList(searchVo);
		logger.info("ajax -전체 공간 등록 수, totalRecord = {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		AjaxVO ajaxVo = new AjaxVO();
		ajaxVo.setPagingInfo(pagingInfo);
		ajaxVo.setAjaxList(spaceList);
		ajaxVo.setSearchVo(searchVo);
		
		return ajaxVo;
	}
	
	@RequestMapping("spaceConfirmList/confirm")
	public String spaceConfirm(@ModelAttribute SpaceListVO listVo, Model model) {
		logger.info("공간 승인, 파라미터 listVo = {}", listVo);
		
		int cnt = spaceService.spaceConfirm(listVo);
		
		String msg = "요청 처리중 문제가 발생하였습니다. 다시 시도해주시기 바랍니다.", url = "/admin/space/spaceConfirmList";
		if(cnt>0) {
			msg = "승인 처리가 완료되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
		
		
	}
	
	@RequestMapping("spaceConfirmList/denine")
	public String spaceDenine(@ModelAttribute SpaceListVO listVo, Model model) {
		logger.info("공간 거절, 파라미터 listVo = {}", listVo);
		
		int cnt = spaceService.spaceDenine(listVo);
		
		String msg = "요청 처리중 문제가 발생하였습니다. 다시 시도해주시기 바랍니다.", url = "/admin/space/spaceConfirmList";
		if(cnt>0) {
			msg = "거절 처리가 완료되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
		
		
	}
}
