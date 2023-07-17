package com.kh.app.page.vo;

import lombok.Getter;

@Getter
public class PageVo {
	
	public PageVo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		
		int maxPage = (int)Math.ceil((double)(listCount / boardLimit));
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		int offset = (currentPage-1) * boardLimit;
		
		
		this.maxPage = maxPage; 
		this.startPage = startPage; 
		this.endPage = endPage;
		this.offset = offset;
	}
	
	private int listCount;
	private int currentPage;
	private int pageLimit;
	private int boardLimit;
	
	private int maxPage;
	private int startPage;
	private int endPage;
	private int offset;
	
}
