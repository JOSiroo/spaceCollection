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

import com.sc.spaceCollection.admin.model.AdminService;
import com.sc.spaceCollection.board.model.BoardService;
import com.sc.spaceCollection.board.model.BoardVO;
import com.sc.spaceCollection.boardType.model.BoardTypeService;
import com.sc.spaceCollection.boardType.model.BoardTypeVO;
import com.sc.spaceCollection.comments.model.CommentsService;
import com.sc.spaceCollection.comments.model.CommentsVO;
import com.sc.spaceCollection.common.ConstUtil;
import com.sc.spaceCollection.common.PaginationInfo;
import com.sc.spaceCollection.common.SearchVO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	private final AdminService adminService;
	private final BoardTypeService boardTypeService;
	private final BoardService boardService;
	private final CommentsService commentsService;
	
	@GetMapping("/adminLogin")
	public String adminLogin() {
		logger.info("관리자 로그인화면 출력");
		
		return "admin/adminLogin";
	}
	
	@PostMapping("/adminLogin")
	public String adminLogin(@RequestParam String adminId, @RequestParam String adminPwd, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required = false)String chkSave, Model model) {
		logger.info("로그인 처리, 파라미터 adminId={}, adminPwd={}, chkSave={}", adminId, adminPwd, chkSave);
		
		String msg = "로그인 중 오류가 발생하였습니다. <br>관리자에게 문의해주시기 바랍니다.", url = "/admin/adminLogin";
		int loginResult = adminService.loginCheck(adminId, adminPwd);
		logger.info("로그인 처리결과, loginResult={}", loginResult);
		
		if(loginResult == AdminService.LOGIN_OK) {
			HttpSession session = request.getSession();
			session.setAttribute("adminId", adminId);
			
			Cookie ck = new Cookie("ck_adminId", adminId);
			ck.setPath("/");
			if(chkSave != null) {
				ck.setMaxAge(1000*60*60*24);
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			
			return "redirect:/admin/adminMain";
		}else if(loginResult == AdminService.USERID_NONE) {
			msg = "아이디가 존재하지 않습니다.";
		}else if(loginResult == AdminService.PWD_DISAGREE) {
			msg = "아이디 또는 비밀번호가 일치하지 않습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@RequestMapping("/adminLogout")
	public String adminLogout(HttpSession session ,Model model) {
		session.removeAttribute("adminId");
		
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "/admin/adminLogin");
		
		return "admin/common/message";
	}
	
	
	@RequestMapping("/adminMain")
	public String adminMain() {
		logger.info("관리자 메인화면");
		
		return "admin/adminMain";
	}
	
	@RequestMapping("/board/boardTypeList")
	public void boardSetting(Model model) {
		logger.info("게시판 종합 관리");
		
		List<BoardTypeVO> list = boardTypeService.selectBoardType();
		logger.info("게시물 타입 조회결과, list.size = {}", list.size());
		
		model.addAttribute("list", list);
	}
	
	@GetMapping("/board/boardTypeCreate")
	public void boardCreate() {
		logger.info("게시판 생성 화면");
	}
	
	@PostMapping("/board/boardTypeCreate")
	public String boardCreate(@ModelAttribute BoardTypeVO vo, Model model) {
		logger.info("게시판 생성, 파라미터 vo = {}", vo);
		
		if(vo.getBoardTypeCommentOk()==null) {
			vo.setBoardTypeCommentOk("N");
		}else {
			vo.setBoardTypeCommentOk("Y");
		}
		
		if(vo.getBoardTypeFileOk()==null) {
			vo.setBoardTypeFileOk("N");
		}else {
			vo.setBoardTypeFileOk("Y");
		}
		
		if(vo.getBoardTypeUse()==null) {
			vo.setBoardTypeUse("N");
		}else {
			vo.setBoardTypeUse("Y");
		}
		String msg = "게시판 생성에 실패하였습니다.", url = "/admin/board/boardTypeCreate";
		int result = boardTypeService.createBoard(vo);
		if(result>0) {
			msg = "게시판이 생성되었습니다.";
			url = "/admin/board/boardTypeList";
		}else if(result<0){
			msg = "이미 사용중인 게시판 이름입니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@GetMapping("/board/boardTypeEdit")
	public void boardEdit(@RequestParam String boardTypeId, Model model) {
		logger.info("게시판 정보 출력, 파라미터 boardTypeId = {}", boardTypeId);
		
		BoardTypeVO vo = boardTypeService.selectByBoardTypeId(boardTypeId);
		
		model.addAttribute("vo", vo);
		
	}
	
	@RequestMapping("/board/boardTypeEditn")
	public String boardEditn(Model model) {
		model.addAttribute("msg", "변경된 항목이 없습니다.");
		model.addAttribute("url", "/admin/board/boardTypeList");
		
		return "admin/common/message";
	}
	
	@PostMapping("/board/boardTypeEdit")
	public String boardEdit(@ModelAttribute BoardTypeVO vo, Model model) {
		logger.info("게시판 수정, 파라미터 vo = {}", vo);
		
		if(vo.getBoardTypeCommentOk()==null) {
			vo.setBoardTypeCommentOk("N");
		}else {
			vo.setBoardTypeCommentOk("Y");
		}
		
		if(vo.getBoardTypeFileOk()==null) {
			vo.setBoardTypeFileOk("N");
		}else {
			vo.setBoardTypeFileOk("Y");
		}
		
		if(vo.getBoardTypeUse()==null) {
			vo.setBoardTypeUse("N");
		}else {
			vo.setBoardTypeUse("Y");
		}
		String msg = "게시판 수정에 실패하였습니다.", url = "/admin/board/boardTypeEdit";
		int result = boardTypeService.updateBoardType(vo);
		if(result>0) {
			msg = "게시판이 수정되었습니다.";
			url = "/admin/board/boardTypeList";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}	
	
	@RequestMapping("/board/boardList")
	public void name(@ModelAttribute SearchVO searchVo, @RequestParam(required = false)String boardTypeName, Model model) {
		logger.info("게시판별 게시물 보기, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		//[2]SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		searchVo.setBoardTypeName(boardTypeName);
		List<BoardTypeVO> boardTypeList = boardTypeService.selectBoardType();

		List<Map<String, Object>> list = boardService.selectBoardAll(searchVo);
		logger.info("게시물 조회 결과, list.size = {}", list.size());

		int totalRecord=boardService.getTotalRecord(searchVo);
		logger.info("글 목록 전체 조회 - totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		//3
		model.addAttribute("list", list);
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("boardTypeList", boardTypeList);
		model.addAttribute("pagingInfo", pagingInfo);
	}

	@RequestMapping("/board/boardWrite")
	public void boardWrite(@RequestParam String boardTypeName, Model model) {
		logger.info("게시물 작성 화면, 초기 게시판 설정 boardTypeName = {}", boardTypeName);
		
		List<BoardTypeVO> list = boardTypeService.selectBoardType();
		
		model.addAttribute("boardTypeName", boardTypeName);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("/board/boardWriteSub")
	public String boardWrite(@RequestParam String boardTypeName, @ModelAttribute BoardVO vo, Model model) {
		logger.info("게시물 저장, 파라미터 vo = {}", vo);
		
		int cnt = boardService.insertBoard(vo);
		logger.info("게시물 저장 결과, cnt = {}", cnt);
		
		String msg = "게시물 등록에 실패하였습니다. <br> 관리자에게 문의해주시기 바랍니다.", 
				url = "/admin/board/boardWrite";
		
		if(cnt>0) {
			msg = "게시물이 등록되었습니다.";
			url = "/admin/board/boardList?boartTypeName="+boardTypeName;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@GetMapping("/board/boardDetail")
	public String name(@RequestParam(defaultValue = "0")int boardNum, HttpSession session, Model model) {
		logger.info("게시물 상세보기, 파라미터 boardNum = {}", boardNum);
		
		if(boardNum==0) {
			model.addAttribute("msg", "잘못된 URL 입니다.");
			model.addAttribute("url", "/admin/board/boardList");
			
			return "admin/common/message";
		}else {
			Map<String, Object> map = boardService.selectByBoardNum(boardNum);
			logger.info("게시물 상세조회 결과, map = {}", map);
			if(map==null || map.isEmpty()) {
				model.addAttribute("msg", "삭제되었거나 존재하지 않는 게시물입니다.");
				model.addAttribute("url", "/admin/board/boardList");
				
				return "admin/common/message";

			}else {
				String userid = (String)session.getAttribute("userid");
				List<Map<String, Object>> list = commentsService.selectByBoardNum(boardNum);
				logger.info("댓글 조회결과, list.size = {}", list.size());
				
				
				model.addAttribute("userid", userid);
				model.addAttribute("map", map);
				model.addAttribute("list", list);
				
				return "admin/board/boardDetail";
			}
		}
	}
	
	@PostMapping("/board/boardDetail/commentsWrite")
	public String name(@ModelAttribute CommentsVO vo, Model model) {
		logger.info("댓글 등록, 파라미터 vo = {}", vo);
		
		int cnt = commentsService.insertComments(vo);
		logger.info("댓글 등록 결과, cnt = {}", cnt);
		logger.info("vo={}",vo);
		String msg = "댓글 등록에 실패하였습니다. 다시 시도해주시기 바랍니다.", url = "/admin/board/boardDetail?boardNum=" + vo.getBoardNum();
		if(cnt>0) {
			msg = "댓글이 등록되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
}
