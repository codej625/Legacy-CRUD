package com.spring.board.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.board.vo.BoardVo;

public interface BoardDao {

	public String selectTest() throws Exception;

	public List<BoardVo> selectBoardList(HashMap<String, Object> map) throws Exception;

	public BoardVo selectBoard(BoardVo boardVo) throws Exception;

	public int selectBoardCnt() throws Exception;

	public int boardInsert(BoardVo boardVo) throws Exception;

	public int boardUpdate(BoardVo boardVo) throws Exception;

	public int boardDelete(BoardVo boardVo) throws Exception;

}
