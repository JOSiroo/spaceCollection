package com.sc.spaceCollection.controller;

import java.util.ArrayList;
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

import com.sc.spaceCollection.board.model.BoardService;
import com.sc.spaceCollection.board.model.UserBoardVO;
import com.sc.spaceCollection.boardType.model.BoardTypeService;
import com.sc.spaceCollection.boardType.model.BoardTypeVO;
import com.sc.spaceCollection.comments.model.CommentsService;
import com.sc.spaceCollection.comments.model.CommentsVO;
import com.sc.spaceCollection.common.ConstUtil;
import com.sc.spaceCollection.common.PaginationInfo;
import com.sc.spaceCollection.common.SearchVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

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
		List<UserBoardVO> list = boardService.selectByeventBoard();
		logger.info("이벤트 게시물 조회결과, list.size = {}", list.size());
		logger.info("이벤트 게시물 조회결과, UserBoardVO = {}", list);
		
		model.addAttribute("list", list);
		return "userMain/board/boardList"; 
	}

	@GetMapping("/boardDetail")
	public String boardDetail(@RequestParam(defaultValue = "0") int boardNum, String boardTypeId, HttpSession session,
			Model model) {
		logger.info("게시물 상세보기, 파라미터 boardNum = {}", boardTypeId);

		if (boardTypeId == null) {
			model.addAttribute("msg", "잘못된 URL 입니다.");
			model.addAttribute("url", "/user/boardList");
			return "common/message";
		} else {
			Map<String, Object> map = boardService.selectByeventBoardNum(boardNum);
			logger.info("게시물 상세조회 결과, map = {}", map);
			if (map == null || map.isEmpty()) {
				model.addAttribute("msg", "삭제되었거나 존재하지 않는 게시물입니다.");
				model.addAttribute("url", "/userMain/board/boardList");
				return "common/message";
			} else {
				String userid = (String) session.getAttribute("userid");
				List<Map<String, Object>> list = commentsService.selecteventByBoardNum(boardNum);
				logger.info("댓글 조회결과, list.size = {}", list.size());

				model.addAttribute("userid", userid);
				model.addAttribute("map", map);
				model.addAttribute("list", list);

				return "userMain/board/boardDetail";
			}
		}
	}

	@PostMapping("/board/boardDetail/commentsWrite")
	public String commentsWrite(@ModelAttribute CommentsVO vo, Model model) {
		logger.info("댓글 등록, 파라미터 vo = {}", vo);

		int cnt = commentsService.insertComments(vo);
		logger.info("댓글 등록 결과, cnt = {}", cnt);
		logger.info("vo={}", vo);
		String msg = "댓글 등록에 실패하였습니다. 다시 시도해주시기 바랍니다.",
				url = "/userMain/board/boardDetail?boardNum=" + vo.getBoardNum();
		if (cnt > 0) {
			msg = "댓글이 등록되었습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "userMain/common/message";
	}

}
