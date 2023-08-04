package com.kh.app.chatting.dao;

import java.util.List;
import java.util.Map;

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


	public int createNewChatRoom(SqlSessionTemplate sst, Map<String, String> memberMap) {
		return sst.insert("chatting.createNewChatRoom", memberMap);
	}

	public MemberVo getReceiverInfo(SqlSessionTemplate sst, String receiverNo) {
		return sst.selectOne("chatting.getReceiverInfo", receiverNo);
	}

	public ChattingVo getChattingRoomNo(SqlSessionTemplate sst, Map<String, String> memberMap) {
		return sst.selectOne("chatting.getChattingRoomNo", memberMap);
	}

	public int saveMessage(SqlSessionTemplate sst, ChattingVo vo) {
		return sst.insert("chatting.saveMessage", vo);
	}
}
