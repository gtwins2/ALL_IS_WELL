package com.kh.app.proceeding.service;

import java.util.List;

import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.vo.ProceedingVo;

public interface ProceedingService {

	//게시글 목록				//board/list
	List<ProceedingVo> list(PageVo pv);
	
	//게시글 작성				//board/write
	int write(ProceedingVo vo);
	
	//게시글 상세조회			//board/detail
	ProceedingVo detail(String no);
	
	//게시글 수정				//board/edit
	int edit(ProceedingVo vo);
	
	//게시글 삭제				//board/delete
	int delete(ProceedingVo vo);
	
	//게시글 전체 갯수 조회
	int getBoardCnt();
	
}
