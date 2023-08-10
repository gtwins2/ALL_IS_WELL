package com.kh.app.attendance.dao;

import java.util.List;
import java.util.Map;

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
	
	public List<AttendanceVo> getAttendanceListAdmin(SqlSessionTemplate sst, PageVo pv, Map<String, String> paramMap) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("attendance.getAttendanceListAdmin", paramMap, rb);
	}

	public int getAdminAttendanceListCnt(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.selectOne("attendance.getAttendanceListAdminCnt", paramMap);
	}

	public AttendanceVo getPresentAttendance(SqlSessionTemplate sst, String no) {
		return sst.selectOne("attendance.getPresentAttendance", no);
	}

}
