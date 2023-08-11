package com.kh.app.duty.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app.duty.vo.DutyVo;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.vo.ProceedingVo;

public interface DutyDao {

	int select(SqlSessionTemplate sst, Object params);

	int put(SqlSessionTemplate sst, DutyVo vo);

	int edit(SqlSessionTemplate sst, DutyVo vo);

	List<DutyVo> list(SqlSessionTemplate sst, PageVo pv, Map<String, String> paramMap);

	int getBoardCnt(SqlSessionTemplate sst, Map<String, String> paramMap);

	DutyVo detail(SqlSessionTemplate sst, String no);

	int edit2(SqlSessionTemplate sst, DutyVo vo);

	List<MemberVo> getMemberList(SqlSessionTemplate sst);

}
