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
import org.springframework.web.bind.annotation.RestController;

import com.sc.spaceCollection.board.model.BoardService;
import com.sc.spaceCollection.boardType.model.BoardTypeService;
import com.sc.spaceCollection.comments.model.CommentsService;
import com.sc.spaceCollection.comments.model.CommentsVO;

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
	public String boardDetail(@RequestParam(defaultValue = "0") int boardNum, Model model) {
		logger.info("게시물 상세보기, 파라미터 boardNum = {}", boardNum);

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
	public CommentsVO commentsWrite(@ModelAttribute CommentsVO vo, Model model) {
		
		logger.info("댓글 등록, 파라미터 vo = {}", vo);
		int cnt = commentsService.insertComments(vo);
		logger.info("댓글 등록 결과, cnt = {}", cnt);
		logger.info("vo={}",vo);
			String msg = "댓글 등록에 실패하였습니다. 다시 시도해주시기 바랍니다.",
					url = "/user/board/boardDetail?boardNum=" + vo.getBoardNum();
				if(cnt>0) {
					msg = "댓글이 등록되었습니다.";
					url = "/user/board/boardDetail?boardNum=" + vo.getBoardNum();
				}
				
				
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return vo;
	}
	
	@GetMapping("/board/boardDetail/commentsLoad")
	@ResponseBody
	public List<CommentsVO> commentsLoad(@RequestParam String boardNum) {
		logger.info("댓글조회 = {}", boardNum );
	    List<CommentsVO> list = commentsService.selectUserComments(Integer.parseInt(boardNum));
	    return list;
	}

	/*public List<Map<String, Object>> commentsLoad(@RequestParam(defaultValue = "0")int boardNum,
												@RequestParam(defaultValue = "0")int addNum) {
		logger.info("ajax - 댓글 조회, 파라미터 boardNum = {}, addNum = {}", boardNum, addNum);
		
		CommentsVO commentsVo = new CommentsVO();
		commentsVo.setBoardNum(boardNum);
		commentsVo.setAddNum(addNum);
		
		List<Map<String, Object>> list = commentsService.selectByBoardNum(commentsVo);
		for(Map<String, Object> map : list) {
			map.put("COMMENT_REG_DATE", (map.get("COMMENT_REG_DATE")+"").substring(0, 10));
			map.put("COMMENT_CONTENT", ((String)map.get("COMMENT_CONTENT")).replace("\n", "<br>"));
		}
		logger.info("ajax - 댓글 조회결과, list = {}", list);
		
		return list;
	}*/
	
	
		
	
	
	@RequestMapping("/board/boardDetail/ajax_commentsEdit")
	@ResponseBody
	public int ajax_commentsEdit(@ModelAttribute CommentsVO commentsVo) {
		logger.info("ajax - 댓글 수정, 파라미터 commentsVo = {}", commentsVo);
		int cnt = commentsService.updateComments(commentsVo);
		logger.info("ajax - 댓글 수정 결과, cnt = {}", cnt);
		return cnt;
	}

	
	@RequestMapping("/board/boardDetail/ajax_commentsDelete")
	@ResponseBody
	public int ajax_commentsDelete(@RequestParam(defaultValue = "0")int commentNum) {
		logger.info("ajax - 댓글 삭제, 파라미터 commentNum = {}", commentNum);
		int cnt = commentsService.updateCommentsDelFlag(commentNum);
		logger.info("ajax - 댓글 삭제 결과, cnt = {}", cnt);
		return cnt;
	}
	

}
