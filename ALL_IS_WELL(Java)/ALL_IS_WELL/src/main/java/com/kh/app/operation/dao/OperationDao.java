package com.kh.app.operation.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class OperationDao {
	
	
	//멤버 검색
	public List<MemberVo> searchName(SqlSessionTemplate sst, String name) {
		return sst.selectList("operation.searchMember", name);
	}
}
