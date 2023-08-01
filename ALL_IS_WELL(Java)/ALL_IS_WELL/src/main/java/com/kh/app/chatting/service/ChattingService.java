package com.kh.app.chatting.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.admission.dao.admissionDao;
import com.kh.app.admission.service.AdmissionService;
import com.kh.app.chatting.dao.ChattingDao;
import com.kh.app.chatting.vo.ChattingVo;
import com.kh.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
@RequiredArgsConstructor
public class ChattingService {
	private final SqlSessionTemplate sst;
	private final ChattingDao dao;
	
	
	
	public List<ChattingVo> getChattingList(String memberNo) {
		return dao.getChattingList(sst, memberNo);
	}



	public List<MemberVo> searchMember(String searchInput) {
		return dao.searchMember(sst, searchInput);
	}
}
