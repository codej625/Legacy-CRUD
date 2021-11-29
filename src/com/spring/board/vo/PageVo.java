package com.spring.board.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageVo {

	// 조회용
	private String search;
	private int    pageNo;
	private String keyword;
	private String pageNum;  
	private int start; 		 
	private int end;
	private String[] boardCheckbox;
	private String currentPage;

}
