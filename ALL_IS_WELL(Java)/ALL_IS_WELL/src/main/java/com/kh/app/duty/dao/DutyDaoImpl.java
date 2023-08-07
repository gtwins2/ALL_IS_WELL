package com.kh.app.duty.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.duty.vo.DutyVo;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class DutyDaoImpl implements DutyDao{

	@Override
	public int select(SqlSessionTemplate sst, Object params) {
		return sst.insert("duty.insert" , params);
	}

	@Override
	public int put(SqlSessionTemplate sst, DutyVo vo) {
		return sst.insert("duty.put" , vo);
	}

	@Override
	public int edit(SqlSessionTemplate sst, DutyVo vo) {
		return sst.update("duty.edit" , vo);
	}

	@Override
	public List<DutyVo> list(SqlSessionTemplate sst, PageVo pv, Map<String, String> paramMap) {
		return sst.selectList("duty.getList");
	}

	@Override
	public int getBoardCnt(SqlSessionTemplate sst) {
		return sst.selectOne("duty.getBoardCnt");
	}

	@Override
	public DutyVo detail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("duty.getDutyByNo" , no);
	}

	@Override
	public int edit2(SqlSessionTemplate sst, DutyVo vo) {
		return sst.update("duty.edit" , vo);
	}

	@Override
	public List<MemberVo> getMemberList(SqlSessionTemplate sst) {
		return sst.selectList("duty.getMemberList");
	}


}
