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
import com.kh.app.attendance.vo.AttendanceVo;
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

//	//휴가 작성 버튼 클릭 시
//	public int vacationBtn(ApprovalBtnVo bvo) {
//		return dao.vacationBtn(sst, bvo);
//	}
//
//	//휴가 작성 버튼 클릭시 데이터 옮기기
//	public ApprovalBtnVo getVacationApprovalBtnDateAfterInsert(ApprovalBtnVo bvo) {
//		return dao.getVacationApprovalBtnDateAfterInsert(sst, bvo);
//	}

//	//휴가 작성
//	public int vacation(VacationApprovalVo vvo) {
//		return dao.vacation(sst, vvo);
//	}
	
	public BusinessTripApprovalVo detailTrip(String bno) {
		return dao.detailTrip(sst, bno);
	}

	/* 출장 */
	public int tripBtn(String no) {
		return dao.tripBtn(sst, no);
	}
	
	public int writeTrip(BusinessTripApprovalVo bvo) {
		return dao.writeTrip(sst, bvo);
	}
	
    public boolean processTrip(String no, BusinessTripApprovalVo bvo) {
        // 첫 번째 메소드 호출: tripBtn
        int tripBtnResult = tripBtn(no);
        
        // 두 번째 메소드 호출 전 필요한 정보 설정: writeTrip
        bvo.setApprovalDocumentNo(no);
        int writeTripResult = writeTrip(bvo);
        
        // 결과 확인
        if (tripBtnResult != 1 || writeTripResult != 1) {
            throw new RuntimeException("Transaction failed");
        }

        // 모든 트랜잭션이 성공적으로 완료
        return true;
    }




}
