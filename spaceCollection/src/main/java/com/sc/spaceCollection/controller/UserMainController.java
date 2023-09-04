package com.sc.spaceCollection.controller;

import java.io.PrintWriter;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.review.model.ReviewService;
import com.sc.spaceCollection.space.model.SpaceService;
import com.sc.spaceCollection.space.model.SpaceVO;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailService;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailVO;
import com.sc.spaceCollection.usermain.model.ApiExamCaptchaNkeyResult;
import com.sc.spaceCollection.usermain.model.Coupon;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserMainController {
   private static final Logger logger = LoggerFactory.getLogger(UserMainController.class);
   private final SpaceService spaceService;
   private final SpaceDetailService sdService;
   private final ReviewService reviewService;
   private final Coupon coupon;
   
   //사용자메인화면
   @RequestMapping("/")
   public String home(Model model) {
	   List<String> nullList = null; 
	   
       List<Map<String,Object>> list = spaceService.selectAll(1, 9,"",0,0,0,nullList,"SPACE_REG_DATE");
       logger.info("새로운 공간 보여주기, list.size={}", list.size());
       
       List<Map<String, Object>> map = reviewService.selectNewReview();
       logger.info("리뷰, reviewlist={}", map.size());
       
       Map<String, Object> usercount = spaceService.usercount();
       logger.info("카운팅, userCounts={}", usercount);

       model.addAttribute("list", list);
       model.addAttribute("map", map);
       model.addAttribute("usercount", usercount);
       
       
       return "index";
   }
   
   @RequestMapping("/coupon")
   public String coupon(HttpSession session, Model model) {
	   String userId = (String)session.getAttribute("userId");
		if(userId == null || userId.isEmpty()) {
			model.addAttribute("msg", "먼저 로그인을 해주세요");
			model.addAttribute("url", "/login/login");
			
			return "common/message";
		}
	    return "userMain/board/roulette";
	}
   
   @RequestMapping("/coupon2")
   public String coupon2(HttpSession session, Model model) {
	   String userId = (String)session.getAttribute("userId");
		if(userId == null || userId.isEmpty()) {
			model.addAttribute("msg", "먼저 로그인을 해주세요");
			model.addAttribute("url", "/");
			
			return "common/message";
		}
	   
	   String num = Coupon.generateCoupon();
	   logger.info("num={}",num);
	   model.addAttribute("num", num);
	   
	   return "userMain/board/coupon";
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
   
   //사업자
   @RequestMapping("/Certificate")
   public String Certificate(Model model) {
	   return "userMain/Certificate";
   }
   
   //사업자
   @RequestMapping("/Certificate2")
   public String Certificate2() {
	   return "userMain/Certificate2";
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
         @RequestParam(defaultValue = "0") int maxPeople,
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
		  if(order.equals("spaceRegDate_desc")) {
			  order = "space_reg_date desc";
		  }else{
			  order = order.replace("_", " ");
		  }
	  }
	  logger.info("변환 후 oredr = {}", order);
	   
	  logger.info("filterList = {}", filterList); 
	  logger.info("spaceRegion = {}, maxPeople = {}", region,maxPeople); 
	  logger.info("minPrice = {}, maxPrice = {}", minPrice,maxPrice); 
	   
	  List<Map<String, Object>> list = new ArrayList<>();
	  
	  
	  if((spaceName == null || spaceName.isEmpty()) && spaceTypeNo == 0) {
		  list = spaceService.selectAll(page, size,region,maxPeople,minPrice,maxPrice,filterItem,order);
	            
         logger.info("공간 검색 리스트 조회, 결과 resultMap = {}", list.size());
	         
         model.addAttribute("totalRecord", list.size());
	  }else if(spaceName != null && !spaceName.isEmpty()) {
         logger.info("검색창 공간 검색, 파라미터 spaceName = {}", spaceName);
         list = spaceService.selectBySpaceName(page, size, spaceName,
        		 region,maxPeople,minPrice,maxPrice,filterItem,order);
            
         logger.info("공간 검색 리스트 조회, 결과 resultMap = {}", list.size());
         
         model.addAttribute("totalRecord", list.size());
         
      }else if(spaceTypeNo != 0) {
		  logger.info("타입별 공간 리스트 조회, 파라미터 spaceTypeNo = {}, page = {}, size = {}", spaceTypeNo,page, size);
		  list = spaceService.selectBySpaceType(page, size, spaceTypeNo,
	        		 region,maxPeople,minPrice,maxPrice,filterItem,order);
		  logger.info("타입별 공간 리스트 조회, 파라미터 list.size = {}", list.size());
         
      }
	  
	  for(Map<String, Object> map : list) {
		  map.put("SPACE_REG_DATE", map.get("SPACE_REG_DATE")+"");
	  }//timestamp 오류나서 String으로 변환
	  
	  model.addAttribute("list", list);
	  
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
      }else if((spaceName == null || spaceName.isEmpty()) && spaceTypeNo == 0){
    	  logger.info("타입별 공간 리스트 조회, 파라미터 spaceType = {}", spaceTypeNo);
          List<SpaceVO> list = spaceService.selectAllMap();
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