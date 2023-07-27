package com.kh.app.member.list.service;

import java.util.List;
import java.util.Map;

import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;

public interface MemberListService {

		//member/list
		List<MemberVo> list(PageVo pv, Map<String, String> paramMap);
		
		//member/detail
		MemberVo detail(String no);
		
		//member/edit
		int edit(MemberVo vo);
		
		//member/delete
		int delete(MemberVo vo);
		
		//페이징
		int getBoardCnt();

}


