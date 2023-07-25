package com.kh.app.approval.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.approval.dao.ApprovalDao;
import com.kh.app.approval.vo.ApprovalBtnVo;
import com.kh.app.approval.vo.ApprovalVo;
import com.kh.app.approval.vo.BusinessTripApprovalVo;
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

	//휴가 작성 로직
//	public int writeVacation(ApprovalVo vo) {
//		return dao.writeVacation(sst, vo);
//	}

	
	
	//출장 버튼 클릭 시
	public int tripBtn(ApprovalBtnVo bvo) {
		return dao.tripBtn(sst, bvo);
	}

	//출장 데이터 옮기기
	public ApprovalBtnVo getApprovalBtnDateAfterInsert(ApprovalBtnVo bvo) {
		 return dao.getApprovalBtnDataAfterInsert(sst, bvo);
	}

	//출장 작성
	public int trip(BusinessTripApprovalVo vo) {
		return dao.trip(sst, vo);
	}

}
