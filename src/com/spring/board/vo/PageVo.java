package com.spring.board.vo;

public class PageVo extends BoardVo {

	private int pageNo = 0;

	private String[] boardCheckbox;

	public String[] getBoardCheckbox() {
		return boardCheckbox;
	}

	public void setBoardCheckbox(String[] boardCheckbox) {
		this.boardCheckbox = boardCheckbox;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

}
