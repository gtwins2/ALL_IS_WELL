package com.kh.app.proceeding.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.vo.ProceedingVo;

public interface ProceedingDao {

	//게시글 목록				//board/list
	List<ProceedingVo> list(SqlSessionTemplate sst , PageVo pv);
	

	//게시글 작성				//board/write
	int write(SqlSessionTemplate sst , ProceedingVo vo);


	//게시글 상세조회(+조회수증가)	//board/detail
	ProceedingVo detail(SqlSessionTemplate sst , String no);

	
	//게시글 수정				//board/edit
	int edit(SqlSessionTemplate sst , ProceedingVo vo);

	
	//게시글 삭제				//board/delete
	int delete(SqlSessionTemplate sst , ProceedingVo vo);
	
	
	//조회수 증가
	int increaseHit(SqlSessionTemplate sst , String no);

	
	//전체 게시글 갯수 조회
	int getBoardCnt(SqlSessionTemplate sst);
	
}
