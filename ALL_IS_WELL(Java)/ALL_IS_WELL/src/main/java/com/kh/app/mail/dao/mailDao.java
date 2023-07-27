package com.kh.app.mail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
@Transactional
public class mailDao {
	
	
	
	public List<MemberVo> searchEmail(SqlSessionTemplate sst, String name) {
		return sst.selectList("mail.searchEmail", name);
	}

	public List<MemberVo> getAllMembers(SqlSessionTemplate sst) {
		return sst.selectList("mail.getAllMembers");
	}

}
