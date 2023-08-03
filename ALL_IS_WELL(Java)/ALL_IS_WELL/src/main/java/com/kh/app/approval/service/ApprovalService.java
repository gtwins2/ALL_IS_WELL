package com.kh.app.approval.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.approval.dao.ApprovalDao;
import com.kh.app.approval.vo.ApprovalBtnVo;
import com.kh.app.approval.vo.ApprovalVo;
import com.kh.app.approval.vo.BusinessTripApprovalVo;
import com.kh.app.approval.vo.VacationApprovalVo;
import com.kh.app.approver.vo.ApproverVo;
import com.kh.app.attendance.vo.AttendanceVo;
import com.kh.app.inventory.vo.InventoryVo;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class ApprovalService {

	private final ApprovalDao dao;
	private final SqlSessionTemplate sst;

	public int getApprovalListCnt(String no) {
		return dao.getApprovalListCnt(sst, no);
	}

	public List<ApprovalVo> getApprovalList(PageVo pv, String no) {
		return dao.getApprovalList(sst, pv, no);
	}

	

	/* 출장 */
	private int tripBtn(ApprovalBtnVo avo) {
		return dao.tripBtn(sst, avo);
	}

	private int writeTrip(BusinessTripApprovalVo bvo) {
		return dao.writeTrip(sst, bvo);
	}


	public boolean processTrip(BusinessTripApprovalVo bvo) {
		ApprovalBtnVo avo = new ApprovalBtnVo();

		avo.setMemberNo(bvo.getMemberNo());
		avo.setStartDate(bvo.getStartDate());
		avo.setEndDate(bvo.getEndDate());

		int tripBtnResult = tripBtn(avo);
		
		avo = dao.selectMostRecentApprovalDocument(sst, avo);
		bvo.setApprovalDocumentNo(avo.getNo());
		
		int writeTripResult = writeTrip(bvo);

		if (tripBtnResult != 1 || writeTripResult != 1) {
			throw new RuntimeException("출장 작성 트랜잭션 오류");
		}

		return true;
	}
	
	public BusinessTripApprovalVo detailTrip(String no) {
		return dao.detailTrip(sst, no);
	}
	
	/* 휴가 */
	private int vacationBtn(ApprovalBtnVo avo) {
		return dao.vacationBtn(sst, avo);
	}
	
	private int writeVacation(VacationApprovalVo vvo) {
		return dao.writeVacation(sst, vvo);
	}

	public VacationApprovalVo detailVacation(String no) {
		return dao.detailVacation(sst, no);
	}
	
	public boolean processVacation(VacationApprovalVo vvo) {
		ApprovalBtnVo avo = new ApprovalBtnVo();
		
		avo.setMemberNo(vvo.getMemberNo());
		avo.setStartDate(vvo.getStartDate());
		avo.setEndDate(vvo.getEndDate());
		
		int vacationBtnResult = vacationBtn(avo);
		avo = dao.selectMostRecentApprovalDocument(sst, avo);
		vvo.setApprovalDocumentNo(avo.getNo());

		int writeVacationResult = writeVacation(vvo);
		if(vacationBtnResult != 1 || writeVacationResult != 1) {
			throw new RuntimeException("휴가 작성 트랜잭션 오류");
		}
		
		return true;
	}

	/* 재고 */
	public List<InventoryVo> getInventoryData() {
		return dao.getInventoryData(sst);
	}

	private int inventoryBtn(ApprovalBtnVo avo) {
		return dao.inventoryBtn(sst, avo);
	}
	
	private int writeInventory(InventoryVo ivo) {
		return dao.writeInventory(sst, ivo);
	}
	
	public boolean processInventory(InventoryVo ivo) {
		ApprovalBtnVo avo = new ApprovalBtnVo();
			
		avo.setMemberNo(ivo.getMemberNo());
			
		int inventoryBtnResult = inventoryBtn(avo);
		avo = dao.selectMostRecentApprovalDocument(sst, avo);

		if(ivo.getCategoryNoArr() != null && ivo.getCountArr() != null && ivo.getCategoryNoArr().size() == ivo.getCountArr().size()) {
		    for (int i = 0; i < ivo.getCategoryNoArr().size(); i++) {
		    	InventoryVo newIvo = new InventoryVo();
		        newIvo.setApprovalDocumentNo(avo.getNo());
		        newIvo.setCategoryNo(ivo.getCategoryNoArr().get(i));
		        newIvo.setCount(ivo.getCountArr().get(i));
		        int writeInventoryResult = writeInventory(newIvo);
		        if (writeInventoryResult != 1 || inventoryBtnResult != 1) {
		            throw new RuntimeException("재고 작성 트랜잭션 오류");
		        }
		    }
		} else {
		    throw new RuntimeException("categoryNoArr와 countArr의 길이가 일치하지 않거나 null입니다.");
		}
		return true;
	}
	
	public InventoryVo detailInventory(String no) {
		return dao.detailInventory(sst, no);
	}

	public List<InventoryVo> detailInventoryItems(String no) {
		return dao.detailInventoryItems(sst, no);
	}


	public int getApproverListCnt(ApproverVo vo) {
		return dao.getApproverListCnt(sst, vo);
	}

	public List<ApproverVo> getApproverList(PageVo pv, ApproverVo vo) {
		return dao.getApproverList(sst, pv, vo);
	}

	//반려 버튼(status update)
	private int refuseUpdateStatus(ApproverVo vo) {
		return dao.refuseUpdateStatus(sst, vo);
	}
	
	//반려 버튼(approver 테이블 insert)
	private int refuseInsertApprover(ApproverVo vo) {
		return dao.refuseInsertApprover(sst, vo);
	}
	
	public boolean processRefuse(ApproverVo vo) {
		
		int insertResult = refuseInsertApprover(vo);		
		int updateResult = refuseUpdateStatus(vo);
		
		if(insertResult != 1 || updateResult != 1) {
			throw new RuntimeException("반려 실패");
		}
		
		return true;
		
	}
	
	//승인 버튼(status update)
	private int approvalUpdateStatus(ApproverVo vo) {
		return dao.approvalUpdateStatus(sst, vo);
	}
	
	//승인 버튼(approver 테이블 insert)
	private int approvalInsertApprover(ApproverVo vo) {
		return dao.approvalInsertApprover(sst, vo);
	}

	public boolean processApproval(ApproverVo vo) {
		
		int insertResult = approvalInsertApprover(vo);
		int updateResult = approvalUpdateStatus(vo);
		
		if(insertResult != 1 || updateResult != 1) {
			throw new RuntimeException("승인 실패");
		}
		
		return true;
	}

	//인벤토리 결재자 결재 페이지
	public InventoryVo detailApprovalInventory(String no) {
		return dao.detailApprovalInventory(sst, no);
	}

	//휴가 결재자 결재 페이지
	public VacationApprovalVo detailApprovalVacation(String no) {
		return dao.detailApprovalVacation(sst, no);
	}

	//출장 결재자 결재 페이지
	public BusinessTripApprovalVo detailApprovalTrip(String no) {
		return dao.detailApprovalTrip(sst, no);
	}
	
	public ApproverVo getStatus(String no) {
		return dao.getStatus(sst, no);
	}

	//관리자 결재 페이지
	public int getAdminListCnt(ApproverVo vo) {
		return dao.getAdminListCnt(sst, vo);
	}
	
}
