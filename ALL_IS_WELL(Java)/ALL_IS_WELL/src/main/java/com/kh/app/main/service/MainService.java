package com.kh.app.main.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.app.attendance.vo.AttendanceVo;
import com.kh.app.main.dao.MainDao;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.operation.vo.OperationVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainService {
	
	private final MainDao dao;
	private final SqlSessionTemplate sst;
	
	
	public int attend(AttendanceVo vo) {
		return dao.attend(sst, vo);
	}


	public int leave(AttendanceVo vo) {
		return dao.leave(sst, vo);
	}


	public int mCount() {
		return dao.mCount(sst);
	}


	public int fCount() {
		return dao.fCount(sst);
	}


	public int nineCount() {
		return dao.nineCount(sst);
	}
	
	public int eightCount() {
		return dao.eightCount(sst);
	}
	
	public int sevenCount() {
		return dao.sevenCount(sst);
	}
	
	public int sixCount() {
		return dao.sixCount(sst);
	}
	
	public int fiveCount() {
		return dao.fiveCount(sst);
	}


	public List<OperationVo> operation(MemberVo loginMember) {
		return dao.operation(sst, loginMember);
	}


	public int tenCount() {
		return dao.tenCount(sst);
	}


	public int elevenCount() {
		return dao.elevenCount(sst);
	}

}
