package com.sc.spaceCollection.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.catalina.connector.Response;
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
import org.springframework.web.bind.annotation.RestController;

import com.sc.spaceCollection.board.model.BoardService;
import com.sc.spaceCollection.board.model.BoardVO;
import com.sc.spaceCollection.boardType.model.BoardTypeService;
import com.sc.spaceCollection.boardType.model.BoardTypeVO;
import com.sc.spaceCollection.comments.model.CommentsService;
import com.sc.spaceCollection.comments.model.CommentsVO;
import com.sc.spaceCollection.common.ConstUtil;
import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.guest.model.GuestService;
import com.sc.spaceCollection.guest.model.GuestVO;
import com.sc.spaceCollection.userInfo.model.UserInfoService;
import com.sc.spaceCollection.usermain.model.Coupon;
import com.sc.spaceCollection.zzim.model.ZzimServiceImpl;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

//@RestController = @Controller + @ResponseBody
@Controller 
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserBoardController {
	private static final Logger logger = LoggerFactory.getLogger(UserBoardController.class);
	private final BoardService boardService;
	private final CommentsService commentsService;
	private final BoardTypeService boardTypeService;
	private final UserInfoService userInfoService;
	private final GuestService guestService;
	
	 //자주묻는질문
	@RequestMapping("/faq")
	public String FAQ() {
		return "userMain/board/FAQ";
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
        return "userMain/board/notice";
    }
	

	
	@RequestMapping("/boardList")
	public String boardList(Model model) {
		logger.info("이벤트 게시물 조회결과");
		List<Map<String, Object>> list = boardService.selectByeventBoard();
		logger.info("이벤트 게시물 조회결과, list.size = {}", list.size());
		logger.info("이벤트 게시물 조회결과, UserBoardVO = {}", list);
		
		model.addAttribute("list", list);
		return "userMain/board/boardList"; 
	}

	@GetMapping("/boardDetail")
	public String boardDetail(@RequestParam(defaultValue = "0") int boardNum, HttpSession session, Model model) {
		logger.info("게시물 상세보기, 파라미터 boardNum = {}", boardNum);

		String userId = (String)session.getAttribute("userId");
		/*String userId = (String)session.getAttribute("userId");
		int userNum = 0; // 기본값으로 초기화
		if (userId == null) {
			 userId ="null";
	    }else {
	    	userNum = guestService.selectUserInfo(userId).getUserNum();
	    }
		model.addAttribute("userNum", userNum);
    	userNum = guestService.selectUserInfo(userId).getUserNum();
    	logger.info(userId);
		model.addAttribute("userNum", userNum);*/

		
				if (boardNum == 0) {
					model.addAttribute("msg", "잘못된 URL 입니다.");
					model.addAttribute("url", "/user/boardList");
					return "common/message";
				} else {
					Map<String, Object> map = boardService.selectByeventBoardNum(boardNum);
					List<CommentsVO> list = commentsService.selectUserComments(boardNum);
					int count = commentsService.countComments(boardNum);
					logger.info("게시물 boardNum, boardNum = {}", boardNum);
					logger.info("댓글 comments, list = {}", list);
					logger.info("댓글 count = {}", count);
						if (map == null ) {
							model.addAttribute("msg", "삭제되었거나 존재하지 않는 게시물입니다.");
							model.addAttribute("url", "/userMain/board/boardList");
							return "common/message";
						} else {
							logger.info("게시물 내용 조회결과, map = {}", map);
			
							model.addAttribute("map", map);
							model.addAttribute("list", list);
							model.addAttribute("count", count);
							
			
							return "userMain/board/boardDetail";
						}
				}
		
	}
	
	@ResponseBody //=> vo가 json 으로 변환되서 리턴
	@PostMapping("/board/boardDetail/commentsWrite")
	public CommentsVO commentsWrite(@ModelAttribute CommentsVO vo, 
									HttpSession session ,Model model) {
		
		 int result = 0; 
		 String userId = (String)session.getAttribute("userId");
		 int userNum = guestService.selectUserInfo(userId).getUserNum();
		
		logger.info("vo={}",vo);
		int cnt = commentsService.insertComments(vo);
		logger.info("댓글 등록 결과, cnt = {}", cnt);
		logger.info("댓글 등록, 파라미터 vo = {}", vo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("result", result);
		
		return vo;
	}
	
	@GetMapping("/board/boardDetail/commentsLoad")
	@ResponseBody
	public List<CommentsVO> commentsLoad(@RequestParam(defaultValue = "0")int boardNum,
					 					@RequestParam(defaultValue = "0")int page,
					 					CommentsVO commentsVO, Model model ) {
		logger.info("ajax - 댓글 조회, 파라미터 boardNum = {}, page = {}", boardNum, page);
		
		int size=5;
		int count = commentsService.countComments(boardNum);
	    List<CommentsVO> list1 = commentsService.selectPaging(page, size, boardNum);
	    
	    for(CommentsVO vo : list1) {
	    	logger.info("getUserNum = {}",vo.getUserNum());
	    	vo.setUserId(guestService.selectByUserNum(vo.getUserNum()));
	    	
	    	logger.info("getUserId = {}",vo.getUserId());
	    }
	    
	    int userNum=0;
	    
	    logger.info("list1={}",list1);
	    
	    model.addAttribute("list1", list1);
	    model.addAttribute("userNum", userNum);
	    
	    return list1;
	}

	@RequestMapping("/board/boardDetail/ajax_commentsDelete")
	@ResponseBody
	public int ajax_commentsDelete(@RequestParam(defaultValue = "0")int commentNum, HttpSession session) {
		logger.info("ajax - 댓글 삭제, 파라미터 commentNum = {}", commentNum);
		
		int cnt = commentsService.updateCommentsDelFlag(commentNum);
		logger.info("ajax - 댓글 삭제 결과, cnt = {}", cnt);
		
		return cnt;
	}
	
	@RequestMapping("/board/boardDetail/ajax_commentsEdit")
	@ResponseBody
	public int ajax_commentsEdit(@RequestParam String commentContent, @RequestParam String commentNum) {
		logger.info("ajax - 댓글 수정, 파라미터 commentsVo = {}", commentContent, commentNum);
		
		CommentsVO vo = new CommentsVO();
		vo.setCommentContent(commentContent);
		vo.setCommentNum(Integer.parseInt(commentNum));
		
		int cnt = commentsService.updateComments(vo);
		logger.info("ajax - 댓글 수정 결과, cnt = {}", cnt);
		
		return cnt;
	}
	
	 @RequestMapping("/couponList")
	   public String couponList(HttpSession session, Model model) {
		   String userId = (String)session.getAttribute("userId");
			if(userId == null || userId.isEmpty()) {
				model.addAttribute("msg", "먼저 로그인을 해주세요");
				model.addAttribute("url", "/login/login");
				
				return "common/message";
			}
			
			GuestVO userInfo = new GuestVO();
			userInfo = guestService.selectUserInfo(userId);
			
			logger.info("마이페이지 유저 정보 불러오기 결과, userInfo={}",userInfo);
			
			model.addAttribute("guestVo",userInfo);
			
			return "userMain/board/couponList";
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
				model.addAttribute("msg", "로그인 후 이용 가능합니다.");
				model.addAttribute("url", "/");
				
				return "common/message";
			}
		   
		   String num = Coupon.generateCoupon();
		   logger.info("num={}",num);
		   model.addAttribute("num", num);
		   
		   return "userMain/board/coupon";
	   }
	
	   @RequestMapping("/focusList")
	   public String focusList(Model model) {
		   
		   List<BoardVO> list = boardService.selectFocus();
		   logger.info("list={}",list);
		   model.addAttribute(list);
		   
		   return "userMain/board/focusList";
	   }
	

}
