package com.kh.app.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app.member.dao.MemberDao;
import com.kh.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Service
public class MemberService {

	private SqlSessionTemplate sst;
	private MemberDao dao;
	
	@Autowired
	public MemberService(SqlSessionTemplate sst, MemberDao dao) {
		this.sst = sst;
		this.dao = dao;
	}
	
	public MemberVo login(MemberVo vo) {
		return dao.login(sst,vo);
	}

}
