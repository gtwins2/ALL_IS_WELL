package com.kh.app.attendance.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.attendance.dao.AttendanceDao;
import com.kh.app.attendance.vo.AttendanceVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class AttendanceService {

	private final SqlSessionTemplate sst;
	private final AttendanceDao dao;
	
	public List<AttendanceVo> getAttendanceList(AttendanceVo vo) {
		
		return dao.getAttendanceList(sst, vo);
	}

	public int getAttendanceListCnt() {
		return dao.getAttendanceListCnt(sst);
	}

	// 관리자 근태기록 조회(개수)
	public int getAttendanceListAdminCnt() {
		return dao.getAttendanceListAdminCnt(sst);
	}

	// 관리자 근태기록 조회
	public List<AttendanceVo> getAttendanceListAdmin(AttendanceVo vo) {
		return dao.getAttendanceListAdmin(sst, vo);
	}
	
}
