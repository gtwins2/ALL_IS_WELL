package com.kh.app.approval.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.approval.dao.ApprovalDao;
import com.kh.app.attendance.vo.AttendanceVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class ApprovalService {
	
	private final ApprovalDao dao;
	private final SqlSessionTemplate sst;
	
	public int getAttendanceListCnt(String no) {
		return dao.getAttendanceListCnt(sst, no);
	}

	public List<AttendanceVo> getAttendanceList(PageVo pv, String no) {
		return dao.getAttendanceList(sst, pv, no);
	}

}
