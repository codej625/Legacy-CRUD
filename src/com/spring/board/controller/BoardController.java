package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.Paging;
import com.spring.board.vo.UserVo;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {

	@Autowired
	boardService boardService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/board/boardList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardTypeSelect(Model model, PageVo pageVo) throws Exception {

		List<HashMap<String, String>> checkbox = null;
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		
		int totalCnt = 0;
		String CurrentPage = "";
		totalCnt  = boardService.selectBoardCnt(pageVo);
		CurrentPage = pageVo.getCurrentPage();
		Paging pageService = new Paging(totalCnt, CurrentPage);
		
		String check = "menu";
		
		pageVo.setStart(pageService.getStart());   // 시작시 1
		pageVo.setEnd(pageService.getEnd());       // 시작시 10 
		checkbox  = boardService.boardCheckbox(check);
		boardList = boardService.selectBoardList(pageVo);

		model.addAttribute("pg"       , pageService);
		model.addAttribute("checkbox" , checkbox);
		model.addAttribute("totalCnt" , totalCnt);
		model.addAttribute("boardList", boardList);

		return "board/boardList";
	}

	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model, PageVo pageVo, 
			@PathVariable("boardType") String boardType,
			@PathVariable("boardNum")  int    boardNum) throws Exception {

		BoardVo boardVo = new BoardVo();
		boardVo = boardService.selectBoard(boardType, boardNum);

		model.addAttribute("board" , boardVo);
		model.addAttribute("pageNo", pageVo.getPageNo());

		return "board/boardView";
	}

	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model, PageVo pageVo) throws Exception {

		String check = "menu";
		List<HashMap<String, String>> checkbox = null;
		
		checkbox = boardService.boardCheckbox(check);

		model.addAttribute("checkbox", checkbox);
		model.addAttribute("pageNo"  , pageVo.getPageNo());

		return "board/boardWrite";
	}


	@RequestMapping(value = "/board/{boardComment}/{boardTitle}/{pageNo}/{boardNum}/{boardType}/boardUpdate.do", method = RequestMethod.GET)
	public String boardUpdate(@PathVariable("boardComment") String boardComment,
							  @PathVariable("boardTitle") String boardTitle, 
							  @PathVariable("pageNo") String pageNo,
							  @PathVariable("boardNum") int boardNum, 
							  @PathVariable("boardType") String boardType, Model model) throws Exception {

		BoardVo boardVo = new BoardVo();
		boardVo.setBoardComment(boardComment);
		boardVo.setBoardTitle(boardTitle);
		boardVo.setBoardNum(boardNum);
		boardVo.setBoardType(boardType);

		model.addAttribute("board" , boardVo);
		model.addAttribute("pageNo", pageNo);

		return "board/boardUpdate";
	}
	
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale, BoardVo boardVo) throws Exception {
		
		CommonUtil commonUtil = new CommonUtil();
		HashMap<String, String> result = new HashMap<String, String>();
		
		int resultCnt = boardService.boardInsert(boardVo);
		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);
		
		System.out.println("callbackMsg::" + callbackMsg);
		
		return callbackMsg;
	}

	@RequestMapping(value = "/board/boardUpdateAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardUpdateAction(BoardVo boardVo) throws Exception {

		CommonUtil commonUtil = new CommonUtil();
		HashMap<String, String> result = new HashMap<String, String>();
		
		int resultCnt = boardService.boardUpdate(boardVo);
		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

	@RequestMapping(value = "/board/boardDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> boardDelete(BoardVo boardVo) throws Exception {

		CommonUtil commonUtil = new CommonUtil();
		HashMap<String, String> result = new HashMap<String, String>();
		
		int resultCnt = boardService.boardDelete(boardVo);
		result.put("success", (resultCnt > 0) ? "Y" : "N");

		System.out.println("callbackMsg::" + result.get("success"));

		return result;
	}
	
	@RequestMapping(value = "/board/boardJoin.do", method = RequestMethod.GET)
	public String boardJoin(Model model) throws Exception {
		List<ComVo> phoneSelect = null;
		String phone = "phone";
		
		phoneSelect = boardService.boardPhoneSelect(phone);
		
		model.addAttribute("select", phoneSelect);
		return "board/boardJoin";
	}
	
	// id 중복 검사 기능
	@RequestMapping(value = "/board/boardIdCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardIdCheck(UserVo userVo) throws Exception {
		
		// id에 대한 유효성 검사를 서버에서 한번 더 실행
		boolean regExp = userVo.getUserId().matches("^[a-zA-Z0-9]*$");
	    String message = null;
		
	    // 아이디를 조회
	    UserVo boardId = boardService.boardIdCheck(userVo);
	    
	    // 조회된 데이터가 없다면 회원가입
		if (boardId == null) {
			// 정규식 조건이 맞으면 회원가입 가능
			if (regExp == true) {
				message = "success";
			// 정규식 조건이 맞지 않으면 회원가입 불가능
			} else if (regExp == false) {
				message = "fail";
			}
		// 조회된 데이터가 있으면 회원가입 불가능
		} else if (boardId != null) {
			message = "fail";
		}
		// 결과 값을 리턴
	    return message;
	}
	
	// 회원가입 insert or 방금 회원가입한 아이디 조회
	@RequestMapping(value = "/board/boardUserJoin.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> boardJoinInsert(UserVo userVo) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		int resultCnt = 0;
		
		resultCnt = boardService.boardJoinInsert(userVo);
		
		result.put("success", (resultCnt > 0) ? "Y" : "N");
		
		return result;
	}
	
	// 로그인
	@RequestMapping(value = "/board/boardLogin.do", method = RequestMethod.GET)
	public String boardLogin() throws Exception { return "board/boardLogin"; }
	
	// 로그아웃
	@RequestMapping(value = "/board/boardLogout.do", method = RequestMethod.GET)
	public String boardLogin(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/board/boardList.do"; }
	
	// 로그인 후 로직
	@RequestMapping(value = "/board/boardLoginAction.do", method = RequestMethod.GET)
	public String boardUserLogin(UserVo userVo, HttpServletRequest req, RedirectAttributes rttr, Model model) throws Exception {
		
		// user가 입력한 값을 userVo에 받고 userId, userPw 변수에 값을 대입
		String userId = userVo.getUserId();
		String userPw = userVo.getUserPw();
		// 세션 처리
		HttpSession session = req.getSession();
		// null값을 받아 처리하기 위한 try_catch문
		try {
			// userVo에서 받아온 id로 아이디를 찾은후 입력한 id와 pw를 비교
			userVo = boardService.boardLogin(userVo);
			// 값을 비교후 userId 와 userPw가 맞으면 boardList로 redirect
			if (userId.equals(userVo.getUserId()) && userPw.equals(userVo.getUserPw())) {
				String uesrIdCheck = userVo.getUserId();
				session.setAttribute("session", userVo);
				rttr.addFlashAttribute("result", uesrIdCheck);
				return "redirect:/board/boardList.do";
			}
			// 아이디가 조회 되었어도 비밀번호가 틀림
			else if (!userPw.equals(userVo.getUserPw())) {
				String userPwCheck = "userPw";
				model.addAttribute("result", userPwCheck);
			}
		// 아이디 잘못 입력 하여 null값이 조회되었을때 예외처리
		} catch (NullPointerException e) {
			String uesrIdCheck = "userId";
			model.addAttribute("result", uesrIdCheck);
		}
		// 정상 로그인 외에 return 되는 view
		return "board/boardLogin";
	}
}
