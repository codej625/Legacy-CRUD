package com.spring.board.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.UserVo;

public interface BoardDao {

	public String selectTest() throws Exception;

	public List<BoardVo> selectBoardList(PageVo pageVo) throws Exception;

	public BoardVo selectBoard(BoardVo boardVo) throws Exception;

	public int selectBoardCnt(PageVo pageVo) throws Exception;

	public int boardInsert(BoardVo boardVo) throws Exception;

	public int boardUpdate(BoardVo boardVo) throws Exception;

	public int boardDelete(BoardVo boardVo) throws Exception;
	
	public UserVo boardIdCheck(UserVo userVo) throws Exception;
	
	public List<ComVo> boardPhoneSelect(String phone) throws Exception;
	
	public List<HashMap<String, String>> boardCheckbox(String check) throws Exception;
	
	public int boardJoinInsert(UserVo userVo) throws Exception;
	
	public UserVo boardLogin(UserVo userVo)  throws Exception;

}
