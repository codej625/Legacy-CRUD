package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {

	@Autowired
	boardService boardService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/board/boardList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardTypeSelect(Model model, PageVo pageVo, String typeSelect) throws Exception {

		// Select 된 데이터를 담아서 View에서 for문을 실행하기 위한 List를 미리 생성
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		// checkbox값을 typeSelect이라는 배열속에 받고 동적 쿼리문을 사용하기위해 Map을 미리 생성
		HashMap<String, Object> map = new HashMap<String, Object>();
		// page가 0일경우 기본값을 1로 설정하기 위한 변수
		int page = 1;
		int totalCnt = 0;
		// pageVo속에 PageNo가 0일경우 기본값을 변수 page로 설정
		if (pageVo.getPageNo() == 0) {
			pageVo.setPageNo(page);  }
		// checkbox를 선택하지 않고 조회 버튼을 누를시 typeSelect값이 null이기 때문에
		
		// 조건문을 주어 전체조회 페이지로 리턴시킨다.
		if (typeSelect == null) {
			map.put("boardType", typeSelect);
			map.put("pageNo", pageVo.getPageNo());
			
			boardList = boardService.selectBoardList(map);
			totalCnt  = boardService.selectBoardCnt();

			model.addAttribute("boardList", boardList);
			model.addAttribute("totalCnt", totalCnt);
			model.addAttribute("pageNo", page);

			return "board/boardList";
		} else {
			// checkbox값이 정상적으로 받아졌다면 typeSelect의 값을 "," 기준으로 자르고 새로운 배열속에 넣는다.
			String[] code_id = typeSelect.split(",");
			// 동적 쿼리를 작성하기 위해 배열과 필요한 값을 맵에 넣어준다.
			map.put("boardType", code_id);
			map.put("pageNo", pageVo.getPageNo());

			boardList = boardService.selectBoardList(map);
			totalCnt = boardService.selectBoardCnt();

			model.addAttribute("boardList", boardList);
			model.addAttribute("totalCnt", totalCnt);
			model.addAttribute("pageNo", page);

			return "board/boardList";
		}
	}

	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model, PageVo pageVo,
			@PathVariable("boardType") String boardType,
			@PathVariable("boardNum")  int    boardNum) throws Exception {

		BoardVo boardVo = new BoardVo();
		
		// 조회버튼 사용시 Controller가 바뀌고 Mapper에서 설정해놓은 resultMap으로 인해 매칭 컬럼이 바뀌게 된다.
		// 받아오는 boardType값이 code_name값으로 바뀌었기 때문에 값을 다시 변환해준다.
		 if (boardType.equals("일반")) {
			boardType = "a01";
		}if (boardType.equals("Q&A")) {
			boardType = "a02";
		}if (boardType.equals("익명")) {
			boardType = "a03";
		}if (boardType.equals("자유")) {
			boardType = "a04";        }

		boardVo = boardService.selectBoard(boardType, boardNum);

		model.addAttribute("board", boardVo);
		model.addAttribute("pageNo", pageVo.getPageNo());

		return "board/boardView";
	}

	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model, PageVo pageVo) throws Exception {

		model.addAttribute("pageNo", pageVo.getPageNo());

		return "board/boardWrite";
	}

	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale, BoardVo boardVo) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		int resultCnt = boardService.boardInsert(boardVo);
		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);
		
		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

	@RequestMapping(value = "/board/{boardComment}/{boardTitle}/{pageNo}/{boardNum}/{boardType}/boardUpdate.do", method = RequestMethod.GET)
	public String boardUpdate(@PathVariable("boardTitle")   String boardTitle,
							  @PathVariable("boardComment") String boardComment,
							  @PathVariable("pageNo")       String pageNo,
							  @PathVariable("boardNum")     int    boardNum, 
							  @PathVariable("boardType")    String boardType, Model model) throws Exception {

		BoardVo boardVo = new BoardVo();
		boardVo.setBoardComment(boardComment);
		boardVo.setBoardTitle(boardTitle);
		boardVo.setBoardNum(boardNum);
		boardVo.setBoardType(boardType);

		model.addAttribute("board", boardVo);
		model.addAttribute("pageNo", pageNo);

		return "board/boardUpdate";
	}

	@RequestMapping(value = "/board/boardUpdateAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardUpdateAction(BoardVo boardVo) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		int resultCnt = boardService.boardUpdate(boardVo);
		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);
		
		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

	@RequestMapping(value = "/board/boardDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardDelete(BoardVo boardVo) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		int resultCnt = boardService.boardDelete(boardVo);
		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);
		
		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

}
