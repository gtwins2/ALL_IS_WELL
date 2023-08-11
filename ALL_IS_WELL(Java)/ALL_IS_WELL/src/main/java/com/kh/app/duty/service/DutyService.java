package com.kh.app.duty.service;

import java.util.List;
import java.util.Map;

import com.kh.app.duty.vo.DutyVo;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.vo.ProceedingVo;

public interface DutyService {

	int select(Object params);

	int put(DutyVo vo);

	int edit(DutyVo vo);

	int getBoardCnt(Map<String, String> paramMap);

	List<DutyVo> list(PageVo pv, Map<String, String> paramMap);

	DutyVo getDutyByNo(String no);

	int edit2(DutyVo vo);

	List<MemberVo> getMemberList();

}
