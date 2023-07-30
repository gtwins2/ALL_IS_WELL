package com.kh.app.mypage.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.app.member.vo.MemberVo;
import com.kh.app.mypage.dao.MypageDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MypageService {
	
	private final MypageDao dao;
	private final SqlSessionTemplate sst;
	
	public int memberInfoUpdate(MemberVo vo) {
		return dao.memberInfoUpdate(sst, vo);
	}

	
}
