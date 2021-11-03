package com.spring.board.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;

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
	public List<BoardVo> selectBoardList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("selectBoardList service Start");
		
		return boardDao.selectBoardList(map);
	}

	@Override
	public int selectBoardCnt() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("selectBoardCnt service Start");
		
		return boardDao.selectBoardCnt();
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

}
