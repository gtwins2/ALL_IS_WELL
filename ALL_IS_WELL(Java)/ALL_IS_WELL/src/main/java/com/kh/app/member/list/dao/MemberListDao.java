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
	MemberVo getMemberByNo(SqlSessionTemplate sst , String no);

	//board/delete
	int delete(SqlSessionTemplate sst , String no);
	
	
	//paging
	int getBoardCnt(SqlSessionTemplate sst);

	int edit(SqlSessionTemplate sst, MemberVo vo);

	int join(SqlSessionTemplate sst, MemberVo vo);

}
