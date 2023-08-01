package com.kh.app.chatting.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.chatting.vo.ChattingVo;
import com.kh.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
@Transactional
public class ChattingDao {
	
	
	
	public List<ChattingVo> getChattingList(SqlSessionTemplate sst, String memberNo) {
		return sst.selectList("chatting.getChattingList", memberNo);
	}

	public List<MemberVo> searchMember(SqlSessionTemplate sst, String searchInput) {
		return sst.selectList("chatting.searchMember", searchInput);
	}
}
