package com.kh.app.member.list.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;

public interface MemberListDao {

	//board/list
	List<MemberVo> list(SqlSessionTemplate sst , PageVo pv, Map<String, String> paramMap);
	
	//board/detail
	MemberVo detail(SqlSessionTemplate sst , String no);

	
	//board/edit
	int edit(SqlSessionTemplate sst , MemberVo vo);

	
	//board/delete
	int delete(SqlSessionTemplate sst , MemberVo vo);
	
	
	//paging
	int getBoardCnt(SqlSessionTemplate sst);

}
