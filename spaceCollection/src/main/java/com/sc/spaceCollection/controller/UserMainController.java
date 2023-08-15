package com.sc.spaceCollection.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
   
   //약관
   @RequestMapping("/userService")
   public String userChek() {
      return "userMain/userService";
   }
   
   //이벤트
   @RequestMapping("/event")
   public String event() {
	   return "userMain/event";
   }
   
   @GetMapping("/search")
   public String search_get(@RequestParam(required = false) String spaceName,
         @RequestParam(defaultValue = "0") int spaceTypeNo, Model model) {
      
      if(spaceName != null && !spaceName.isEmpty()) {
         logger.info("검색창 공간 검색, 파라미터 spaceName = {}", spaceName);
         List<SpaceVO> list = spaceService.selectBySpaceName(spaceName);
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
         logger.info("공간 검색 리스트 조회, 결과 resultMap = {}", resultMap);
         
         model.addAttribute("spaceMap", resultMap);
         model.addAttribute("totalRecord", resultMap.size());
         
      }else if(spaceTypeNo != 0) {
         logger.info("타입별 공간 리스트 조회, 파라미터 spaceType = {}", spaceTypeNo);
         List<SpaceVO> list = spaceService.selectBySpaceType(spaceTypeNo);
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
         logger.info("타입별 공간 리스트 조회, 결과 resultMap = {}", resultMap);
         
         model.addAttribute("spaceMap", resultMap);
      }
      
      
      return "userMain/search";
   }
   
   
   @GetMapping("/search/map")
   public String map(@RequestParam(required = false) String spaceName,
         @RequestParam(defaultValue = "0") int spaceTypeNo, Model model) {
      if(spaceName != null && !spaceName.isEmpty()) {
         logger.info("검색창 공간 검색, 파라미터 spaceName = {}", spaceName);
         List<SpaceVO> list = spaceService.selectBySpaceName(spaceName);
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
         logger.info("공간 검색 리스트 조회, 결과 resultMap = {}", resultMap);
         
         model.addAttribute("spaceMap", resultMap);
         model.addAttribute("totalRecord", resultMap.size());
         
      }else if(spaceTypeNo != 0 ) {
         logger.info("타입별 공간 리스트 조회, 파라미터 spaceType = {}", spaceTypeNo);
         List<SpaceVO> list = spaceService.selectBySpaceType(spaceTypeNo);
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
         logger.info("타입별 공간 리스트 조회, 결과 resultMap = {}", resultMap);
         
         model.addAttribute("spaceMap", resultMap);
      }
      
      return "userMain/map";
   }
}