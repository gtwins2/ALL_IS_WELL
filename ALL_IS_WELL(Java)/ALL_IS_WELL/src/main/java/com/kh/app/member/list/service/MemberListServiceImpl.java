package com.kh.app.member.list.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.member.list.dao.MemberListDao;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.dao.ProceedingDao;
import com.kh.app.proceeding.vo.ProceedingVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class MemberListServiceImpl implements MemberListService{

	private final MemberListDao dao;
	private final SqlSessionTemplate sst;
	
	@Override
	public List<MemberVo> list(PageVo pv , Map<String, String> paramMap) {
		return dao.list(sst, pv , paramMap);
	}
	@Override
	public MemberVo getMemberByNo(String no) {
		return dao.getMemberByNo(sst, no);
	}
	@Override
	public int delete(String no) {
		return dao.delete(sst, no);
	}
	@Override
	public int edit(MemberVo vo) {
		return dao.edit(sst , vo);
	}
	@Override
	public int join(MemberVo vo) {
		return dao.join(sst, vo);
	}
	@Override
	public int getBoardCnt(Map<String, String> paramMap) {
		return dao.getBoardCnt(sst , paramMap);
	}
		

}
