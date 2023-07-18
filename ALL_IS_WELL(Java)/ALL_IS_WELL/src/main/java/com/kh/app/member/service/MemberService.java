package com.kh.app.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app.member.dao.MemberDao;
import com.kh.app.member.vo.MemberVo;

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
		System.out.println("2");
		return dao.login(sst,vo);
	}

}
