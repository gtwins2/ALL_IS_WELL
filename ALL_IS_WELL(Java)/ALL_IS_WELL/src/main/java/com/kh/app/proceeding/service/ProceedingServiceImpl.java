package com.kh.app.proceeding.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.member.vo.MemberVo;
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
	public List<ProceedingVo> list(PageVo pv , Map<String, String> paramMap) {
		return dao.list(sst, pv , paramMap);
	}
	@Override
	public int write(ProceedingVo vo) {
		return dao.write(sst, vo);
	}
	@Override
	public ProceedingVo getProceedingByNo(String no) {
		return dao.getProceedingByNo(sst , no);
	}
	@Override
	public int delete(String no) {
		return dao.delete(sst, no);
	}
	@Override
	public int edit(ProceedingVo vo) {
		return dao.edit(sst, vo);
	}
	@Override
	public int getBoardCnt(Map<String, String> paramMap) {
		return dao.getBoardCnt(sst , paramMap);
	}
	
}