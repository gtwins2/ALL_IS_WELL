package com.kh.app.attendance.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.attendance.vo.AttendanceVo;
import com.kh.app.page.vo.PageVo;

@Repository
public class AttendanceDao {

//	public List<AttendanceVo> getAttendanceList(SqlSessionTemplate sst, AttendanceVo vo) {
//		return sst.selectList("attendance.getList", vo);
//	}
//
//	public int getAttendanceListCnt(SqlSessionTemplate sst) {
//		return sst.selectOne("attendance.getAttendanceListCnt");
//	}
	
	public List<AttendanceVo> getAttendanceListAdmin(SqlSessionTemplate sst, AttendanceVo vo, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("attendance.getAttendanceListAdmin", vo, rb);
	}

	public int getAdminAttendanceListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("attendance.getAttendanceListAdminCnt");
	}

}
