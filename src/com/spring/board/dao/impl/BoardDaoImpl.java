package com.spring.board.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.UserVo;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("selectTest dao Start");

		String a = sqlSession.selectOne("board.boardList");

		return a;
	}

	@Override
	public List<BoardVo> selectBoardList(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("selectBoardList dao Start");

		return sqlSession.selectList("board.boardList", pageVo);
	}

	@Override
	public int selectBoardCnt(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("selectBoardCnt dao Start");

		return sqlSession.selectOne("board.boardTotal", pageVo);
	}

	@Override
	public BoardVo selectBoard(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("selectBoard dao Start");

		return sqlSession.selectOne("board.boardView", boardVo);
	}

	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("boardInsert dao Start");

		return sqlSession.insert("board.boardInsert", boardVo);
	}

	@Override
	public int boardUpdate(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("boardUpdate dao Start");

		return sqlSession.update("board.boardUpdate", boardVo);
	}

	@Override
	public int boardDelete(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("boardDelete dao Start");

		return sqlSession.delete("board.boardDelete", boardVo);
	}

	@Override
	public List<HashMap<String, String>> boardCheckbox(String check) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("boardCheckbox dao Start");
		
		return sqlSession.selectList("board.boardCheckbox", check);
	}

	@Override
	public UserVo boardIdCheck(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("boardIdCheck dao Start");
		
		return sqlSession.selectOne("board.boardIdCheck", userVo);
	}

	@Override
	public List<ComVo> boardPhoneSelect(String phone) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("boardPhoneSelect dao Start");
		
		return sqlSession.selectList("boardPhoneSelect", phone);
	}

	@Override
	public int boardJoinInsert(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("boardJoinInsert dao Start");
		
		return sqlSession.insert("boardJoinInsert", userVo);
	}

	@Override
	public UserVo boardLogin(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("boardLogin dao Start");
		
		return sqlSession.selectOne("boardLogin", userVo);
	}

}
