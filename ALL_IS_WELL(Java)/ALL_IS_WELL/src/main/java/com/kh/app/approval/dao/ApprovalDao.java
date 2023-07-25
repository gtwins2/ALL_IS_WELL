package com.kh.app.approval.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.approval.vo.ApprovalBtnVo;
import com.kh.app.approval.vo.ApprovalVo;
import com.kh.app.approval.vo.BusinessTripApprovalVo;
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

	//휴가 작성 로직
//	public int writeVacation(SqlSessionTemplate sst, ApprovalVo vo) {
//		return sst.insert("approval.writeVacation", vo);
//	}

	public int tripBtn(SqlSessionTemplate sst, ApprovalBtnVo bvo) {
		return sst.insert("approval.tripBtn", bvo);
	}

	public ApprovalBtnVo getApprovalBtnDataAfterInsert(SqlSessionTemplate sst, ApprovalBtnVo bvo) {
		return sst.selectOne("approval.tripAfterInsert", bvo);
	}

	public int trip(SqlSessionTemplate sst, BusinessTripApprovalVo vo) {
		return sst.insert("approval.tripWrite", vo);
	}

}
