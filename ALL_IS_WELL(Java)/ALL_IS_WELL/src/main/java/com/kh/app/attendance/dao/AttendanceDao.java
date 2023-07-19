package com.kh.app.attendance.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.attendance.vo.AttendanceVo;

@Repository
public class AttendanceDao {

	public List<AttendanceVo> getAttendanceList(SqlSessionTemplate sst, AttendanceVo vo) {
		return sst.selectList("attendance.getList", vo);
	}

	public int getAttendanceListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("attendance.getAttendanceListCnt");
	}

	//관리자 근태 조회(개수)
//	public int getAttendanceListAdminCnt(SqlSessionTemplate sst) {
//		return sst.selectOne("attendance.getAttendanceListAdminCnt");
//	}
//
//	public List<AttendanceVo> getAttendanceListAdmin(SqlSessionTemplate sst, AttendanceVo vo) {
//		
//		return sst.selectList(null, vo);
//	}

}
