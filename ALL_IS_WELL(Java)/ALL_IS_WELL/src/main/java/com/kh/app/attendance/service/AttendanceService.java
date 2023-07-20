package com.kh.app.attendance.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.attendance.dao.AttendanceDao;
import com.kh.app.attendance.vo.AttendanceVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class AttendanceService {

	private final SqlSessionTemplate sst;
	private final AttendanceDao dao;
	
	public List<AttendanceVo> getAttendanceList(PageVo pv, String no) {
		
		return dao.getAttendanceList(sst, pv, no);
	}

	public int getAttendanceListCnt(String no) {
		return dao.getAttendanceListCnt(sst, no);
	}

	// 관리자 근태기록 조회
	public List<AttendanceVo> getAttendanceListAdmin(PageVo pv) {
		return dao.getAttendanceListAdmin(sst, pv);
	}

	public int getAdminAttendanceListCnt() {
		return dao.getAdminAttendanceListCnt(sst);
	}
	
}
