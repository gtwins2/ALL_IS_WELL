package com.kh.app.approval.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.approval.vo.ApprovalBtnVo;
import com.kh.app.approval.vo.ApprovalVo;
import com.kh.app.approval.vo.BusinessTripApprovalVo;
import com.kh.app.approval.vo.VacationApprovalVo;
import com.kh.app.approver.vo.ApproverVo;
import com.kh.app.inventory.vo.InventoryVo;
import com.kh.app.member.vo.MemberVo;
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
	
	public BusinessTripApprovalVo detailTrip(SqlSessionTemplate sst, String no) {
		return sst.selectOne("approval.detailTrip", no);
	}

	/* 출장 */
	public int tripBtn(SqlSessionTemplate sst, ApprovalBtnVo avo) {
		return sst.insert("approval.tripBtn", avo);
	}

	public int writeTrip(SqlSessionTemplate sst, BusinessTripApprovalVo bvo) {
		return sst.insert("approval.writeTrip", bvo);
	}

	public ApprovalBtnVo selectMostRecentApprovalDocument(SqlSessionTemplate sst, ApprovalBtnVo avo) {
	    return sst.selectOne("approval.selectMostRecentApprovalDocument", avo);
	}

	/* 휴가 */
	public int vacationBtn(SqlSessionTemplate sst, ApprovalBtnVo avo) {
		return sst.insert("approval.vacationBtn", avo);
	}

	public int writeVacation(SqlSessionTemplate sst, VacationApprovalVo vvo) {
		return sst.insert("approval.writeVacation", vvo);
	}
	
	public VacationApprovalVo detailVacation(SqlSessionTemplate sst, String no) {
		return sst.selectOne("approval.detailVacation", no);
	}

	public List<InventoryVo> getInventoryData(SqlSessionTemplate sst) {
		return sst.selectList("approval.getInventoryData");
	}

	public int inventoryBtn(SqlSessionTemplate sst, ApprovalBtnVo avo) {
		return sst.insert("approval.inventoryBtn", avo);
	}

	public int writeInventory(SqlSessionTemplate sst, InventoryVo ivo) {
		return sst.insert("approval.writeInventory", ivo);
	}
	
	public InventoryVo detailInventory(SqlSessionTemplate sst, String no) {
		return sst.selectOne("approval.detailInventory", no);
	}
	
	public List<InventoryVo> detailInventoryItems(SqlSessionTemplate sst, String no) {
		return sst.selectList("approval.detailInventoryItems", no);
	}

	public int getApproverListCnt(SqlSessionTemplate sst, ApproverVo vo) {
		return sst.selectOne("approver.getApproverListCnt", vo);
	}

	public List<ApproverVo> getApproverList(SqlSessionTemplate sst, PageVo pv, ApproverVo vo) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("approver.getApproverList", vo, rb);
	}

	//반려
	public int refuseUpdateStatus(SqlSessionTemplate sst, ApproverVo vo) {
		return sst.update("approver.refuseUpdateStatus", vo);
	}
	
	public int refuseInsertApprover(SqlSessionTemplate sst, ApproverVo vo) {
		return sst.insert("approver.refuseInsertApprover", vo);
	}

	public int approvalUpdateStatus(SqlSessionTemplate sst, ApproverVo vo) {
		return sst.update("approver.approvalUpdateStatus", vo);
	}

	public int approvalInsertApprover(SqlSessionTemplate sst, ApproverVo vo) {
		return sst.insert("approver.approvalInsertApprover", vo);
	}
	
}
