package com.kh.app.mypage.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.member.vo.MemberVo;

@Repository
public class MypageDao {

	public int memberInfoUpdate(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("mypage.memberInfoUpdate", vo);
	}

}
