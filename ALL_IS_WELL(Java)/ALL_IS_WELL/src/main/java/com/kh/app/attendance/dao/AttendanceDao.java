package com.kh.app.attendance.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.attendance.vo.AttendanceVo;
import com.kh.app.page.vo.PageVo;

@Repository
public class AttendanceDao {

	public List<AttendanceVo> getAttendanceList(SqlSessionTemplate sst, PageVo pv, String no) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("attendance.getAttendanceList", no, rb);
	}

	public int getAttendanceListCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("attendance.getAttendanceListCnt", no);
	}
	
	public List<AttendanceVo> getAttendanceListAdmin(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("attendance.getAttendanceListAdmin", null, rb);
	}

	public int getAdminAttendanceListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("attendance.getAttendanceListAdminCnt");
	}

}
