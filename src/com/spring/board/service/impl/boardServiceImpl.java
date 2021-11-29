package com.spring.board.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.UserVo;

@Service
public class boardServiceImpl implements boardService {

	@Autowired
	BoardDao boardDao;

	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("selectTest service Start");
		
		return boardDao.selectTest();
	}

	@Override
	public List<BoardVo> selectBoardList(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("selectBoardList service Start");
		
		return boardDao.selectBoardList(pageVo);
	}

	@Override
	public int selectBoardCnt(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("selectBoardCnt service Start");
		
		return boardDao.selectBoardCnt(pageVo);
	}

	@Override
	public BoardVo selectBoard(String boardType, int boardNum) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("selectBoard service Start");
		
		BoardVo boardVo = new BoardVo();
		boardVo.setBoardType(boardType);
		boardVo.setBoardNum(boardNum);

		return boardDao.selectBoard(boardVo);
	}

	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("boardInsert service Start");
		
		return boardDao.boardInsert(boardVo);
	}

	@Override
	public int boardUpdate(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("boardUpdate service Start");
		
		return boardDao.boardUpdate(boardVo);
	}

	@Override
	public int boardDelete(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("boardDelete service Start");
		
		return boardDao.boardDelete(boardVo);
	}

	@Override
	public List<HashMap<String, String>> boardCheckbox(String check) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("boardCheckbox service Start");
		
		return boardDao.boardCheckbox(check);
	}

	@Override
	public UserVo boardIdCheck(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("boardIdCheck service Start");
		
		return boardDao.boardIdCheck(userVo);
	}

	@Override
	public List<ComVo> boardPhoneSelect(String phone) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("boardPhoneSelect service Start");
		
		return boardDao.boardPhoneSelect(phone);
	}

	@Override
	public int boardJoinInsert(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("boardJoinInsert service Start");
		
		return boardDao.boardJoinInsert(userVo);
	}

	@Override
	public UserVo boardLogin(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("boardLogin service Start");
		
		return boardDao.boardLogin(userVo);
	}

}
