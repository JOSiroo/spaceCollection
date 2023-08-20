package com.sc.spaceCollection.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.space.model.SpaceService;
import com.sc.spaceCollection.space.model.SpaceVO;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailListVO;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailService;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserMainController {
   private static final Logger logger = LoggerFactory.getLogger(UserMainController.class);
   private final SpaceService spaceService;
   private final SpaceDetailService sdService;
   
   //사용자메인화면
   @RequestMapping("/")
   public String home(Model model) {
       List<SpaceVO> list = spaceService.selectBySpaceNum();
       List<Integer> priceList = new ArrayList<>();
       logger.info("새로운 공간 보여주기, list.size={}", list.size());
       
       model.addAttribute("list", list);
       
       return "index";
   }
   
   //서비스약관
   @RequestMapping("/service")
   public String userChek() {
      return "userMain/service";
   }
   
   //회사소개
   @RequestMapping("/about")
   public String about() {
      return "userMain/about";
   }
   //회사소개
   @RequestMapping("/a2")
   public String a2() {
	   return "userMain/a2";
   }
   
   //이벤트
   @RequestMapping("/event")
   public String event() {
	   return "userMain/event";
   }
   
   @RequestMapping("/search")
   public String search_request() {
	   logger.info("검색창");
	   return "userMain/search";
   }
   
   @GetMapping("/getSearchData")
   @ResponseBody
   public List<Map<String, Object>> search_get( 
		 @RequestParam int page, @RequestParam int size,
		 @RequestParam(required = false) String spaceName,
         @RequestParam(defaultValue = "0") int spaceTypeNo,
         @RequestParam(required = false) String region,
         @RequestParam(defaultValue = "99") int maxPeople,
         @RequestParam(defaultValue = "0") int minPrice,
         @RequestParam(defaultValue = "300000") int maxPrice,
         @RequestParam(required = false) String filterList,
         @RequestParam(required = false) String order,
         Model model) {
	   
	   List<String> filterItem = null;
	  if(filterList != null && !filterList.isEmpty()) {
		  filterItem = Arrays.asList(filterList.split(","));
	  }
	  
	  logger.info("변환 전 oredr = {}", order);
	  if(order != null && !order.isEmpty()) {
		  order = order.replace("_", " ");
	  }
	  logger.info("변환 후 oredr = {}", order);
	   
	  logger.info("filterList = {}", filterList); 
	  logger.info("spaceRegion = {}, maxPeople = {}", region,maxPeople); 
	  logger.info("minPrice = {}, maxPrice = {}", minPrice,maxPrice); 
	   
	  List<Map<String, Object>> list = new ArrayList<>();
      if(spaceName != null && !spaceName.isEmpty()) {
         logger.info("검색창 공간 검색, 파라미터 spaceName = {}", spaceName);
         list = spaceService.selectBySpaceName(page, size, spaceName,
        		 region,maxPeople,minPrice,maxPrice,filterItem,order);
            
         logger.info("공간 검색 리스트 조회, 결과 resultMap = {}", list.size());
         
         model.addAttribute("list", list);
         model.addAttribute("totalRecord", list.size());
         
      }else if(spaceTypeNo != 0) {
		  logger.info("타입별 공간 리스트 조회, 파라미터 spaceTypeNo = {}, page = {}, size = {}", spaceTypeNo,page, size);
		  list = spaceService.selectBySpaceType(page, size, spaceTypeNo,
	        		 region,maxPeople,minPrice,maxPrice,filterItem,order);
		  logger.info("타입별 공간 리스트 조회, 파라미터 list.size = {}", list.size());
         
         model.addAttribute("list", list);
      }
      
      return list;
   }
   
   
   
   @GetMapping("/search/map")
   public String map(@RequestParam(required = false) String spaceName,
         @RequestParam(defaultValue = "0") int spaceTypeNo, Model model) {
      if(spaceName != null && !spaceName.isEmpty()) {
         logger.info("검색창 공간 검색, 파라미터 spaceName = {}", spaceName);
         List<SpaceVO> list = spaceService.selectBySpaceNameMap(spaceName);
         List<Integer> priceList = new ArrayList();
         Map<SpaceVO, Integer> resultMap = new HashMap<>(); 
         
         List<SpaceDetailVO> sdList = new ArrayList<>();
         for(int i = 0; i < list.size(); i++) {
            sdList = sdService.selectBySpaceNo(list.get(i).getSpaceNum());
            int averagePrice = 0;
            for(int j = 0; j < sdList.size(); j++) {
            	averagePrice += sdList.get(j).getSdPrice(); 
            }
            priceList.add(averagePrice/sdList.size());
            
            
            resultMap.put(list.get(i), priceList.get(i));
         }
         logger.info("공간 검색 리스트 조회, 결과 resultMap = {}", resultMap.size());
         
         model.addAttribute("spaceMap", resultMap);
         model.addAttribute("totalRecord", resultMap.size());
         
      }else if(spaceTypeNo != 0 ) {
         logger.info("타입별 공간 리스트 조회, 파라미터 spaceType = {}", spaceTypeNo);
         List<SpaceVO> list = spaceService.selectBySpaceTypeMap(spaceTypeNo);
         List<Integer> priceList = new ArrayList();
         Map<SpaceVO, Integer> resultMap = new HashMap<>(); 
         
         for(int i = 0; i < list.size(); i++) {
            List<SpaceDetailVO> sdList = new ArrayList<>();
            sdList = sdService.selectBySpaceNo(list.get(i).getSpaceNum());
            int averagePrice = 0;
            logger.info("sdList.size = {}" ,sdList.size());
            
            for(int j = 0; j < sdList.size(); j++) {
            	averagePrice += sdList.get(j).getSdPrice(); 
            }
            priceList.add(averagePrice/sdList.size());
            
            resultMap.put(list.get(i), priceList.get(i));
            
            
         }
         logger.info("타입별 공간 리스트 조회, 결과 resultMap = {}", resultMap.size());
         
         model.addAttribute("spaceMap", resultMap);
      }
      
      return "userMain/map";
   }
}