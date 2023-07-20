package com.kh.app.approval.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.attendance.vo.AttendanceVo;
import com.kh.app.page.vo.PageVo;

@Repository
public class ApprovalDao {

	//기안한 문서 개수
	public int getAttendanceListCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("approval.getAttendanceListCnt", no);
	}

	//기안한 문서 리스트
	public List<AttendanceVo> getAttendanceList(SqlSessionTemplate sst, PageVo pv, String no) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("approval.getAttendanceList", no, rb);
	}

}
