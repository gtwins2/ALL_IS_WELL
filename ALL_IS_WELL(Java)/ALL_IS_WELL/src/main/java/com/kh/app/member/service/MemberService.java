package com.kh.app.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app.member.dao.MemberDao;
import com.kh.app.member.vo.CertificationVo;
import com.kh.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {

	private final SqlSessionTemplate sst;
	private final MemberDao dao;
	
	public MemberVo login(MemberVo vo) {
		return dao.login(sst,vo);
	}

	public MemberVo idFind(MemberVo vo) {
		return dao.idFind(sst, vo);
	}

	public int certification(CertificationVo vo) {
		return dao.certification(sst, vo);
	}

}
