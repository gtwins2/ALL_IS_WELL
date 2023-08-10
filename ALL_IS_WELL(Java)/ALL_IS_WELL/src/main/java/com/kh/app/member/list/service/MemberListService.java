package com.kh.app.member.list.service;

import java.util.List;
import java.util.Map;

import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;

public interface MemberListService {

		//member/list
		List<MemberVo> list(PageVo pv, Map<String, String> paramMap);
		
		//member/detail
		MemberVo getMemberByNo(String no);
		
		//member/delete
		int delete(String no);
		
		//페이징
		int getBoardCnt(Map<String , String> paramMap);

		int edit(MemberVo vo);

		int join(MemberVo vo);

		
}


