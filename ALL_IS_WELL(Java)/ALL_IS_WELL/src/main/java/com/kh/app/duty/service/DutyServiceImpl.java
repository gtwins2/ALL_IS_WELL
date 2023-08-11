package com.kh.app.duty.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.duty.dao.DutyDao;
import com.kh.app.duty.vo.DutyVo;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.vo.ProceedingVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class DutyServiceImpl implements DutyService{

	private final DutyDao dao;
	private final SqlSessionTemplate sst;
	
	@Override
	public int select(Object params) {
		return dao.select(sst , params);
	}

	@Override
	public int put(DutyVo vo) {
		return dao.put(sst , vo);
	}

	@Override
	public int edit(DutyVo vo) {
		return dao.edit(sst, vo);
	}

	@Override
	public List<DutyVo> list(PageVo pv, Map<String, String> paramMap) {
		return dao.list(sst , pv , paramMap);
	}

	@Override
	public DutyVo getDutyByNo(String no) {
		return dao.detail(sst , no);
	}

	@Override
	public int edit2(DutyVo vo) {
		return dao.edit2(sst, vo);
	}

	@Override
	public List<MemberVo> getMemberList() {
		return dao.getMemberList(sst);
	}

	@Override
	public int getBoardCnt(Map<String, String> paramMap) {
		return dao.getBoardCnt(sst , paramMap);
	}

}
