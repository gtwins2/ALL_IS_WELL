package com.kh.app.proceeding.service;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.dao.ProceedingDao;
import com.kh.app.proceeding.vo.ProceedingVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class ProceedingServiceImpl implements ProceedingService{

	private final ProceedingDao dao;
	private final SqlSessionTemplate sst;
	
	@Override
	public List<ProceedingVo> list(PageVo pv) {
		return dao.list(sst, pv);
	}
	@Override
	public int write(ProceedingVo vo) {
		return dao.write(sst, vo);
	}
	@Override
	public ProceedingVo detail(String no) {
		return dao.detail(sst, no);
	}
	@Override
	public int edit(ProceedingVo vo) {
		return dao.edit(sst, vo);
	}
	@Override
	public int delete(ProceedingVo vo) {
		return dao.delete(sst, vo);
	}
	@Override
	public int getBoardCnt() {
		return dao.getBoardCnt(sst);
	}
	
	

}
