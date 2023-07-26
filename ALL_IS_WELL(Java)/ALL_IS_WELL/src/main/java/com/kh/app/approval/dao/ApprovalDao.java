package com.kh.app.approval.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.approval.vo.ApprovalBtnVo;
import com.kh.app.approval.vo.ApprovalVo;
import com.kh.app.approval.vo.BusinessTripApprovalVo;
import com.kh.app.approval.vo.VacationApprovalVo;
import com.kh.app.attendance.vo.AttendanceVo;
import com.kh.app.page.vo.PageVo;

@Repository
public class ApprovalDao {

	//기안한 문서 개수
	public int getApprovalListCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("approval.getApprovalListCnt", no);
	}

	//기안한 문서 리스트
	public List<ApprovalVo> getApprovalList(SqlSessionTemplate sst, PageVo pv, String no) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("approval.getApprovalList", no, rb);
	}

	

	public int vacationBtn(SqlSessionTemplate sst, ApprovalBtnVo bvo) {
		return sst.insert("approval.vacationBtn", bvo);
	}

	public ApprovalBtnVo getVacationApprovalBtnDateAfterInsert(SqlSessionTemplate sst, ApprovalBtnVo bvo) {
		return sst.selectOne("approval.vacationAfterInsert", bvo);
	}

	public int vacation(SqlSessionTemplate sst, VacationApprovalVo vvo) {
		return sst.insert("approval.vacationWrite", vvo);
	}

	/* 출장 */
	public int tripBtn(SqlSessionTemplate sst, ApprovalBtnVo avo) {
		return sst.insert("approval.tripBtn", avo);
	}

	public int writeTrip(SqlSessionTemplate sst, BusinessTripApprovalVo bvo) {
		return sst.insert("approval.writeTrip", bvo);
	}

	public ApprovalBtnVo getAfterInsert(SqlSessionTemplate sst, ApprovalBtnVo avo) {
		return sst.selectOne("approval.getAfterInsert", avo);
	}

	public ApprovalVo detailTrip(SqlSessionTemplate sst, String no) {
		return sst.selectOne("approval.detailTrip", no);
	}


}
