package com.kh.app.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.member.vo.MemberVo;

@Repository
public class MemberDao {

	public MemberVo login(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("member.login", vo);
	}

	public MemberVo idFind(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("member.idFind", vo);
	}

}
