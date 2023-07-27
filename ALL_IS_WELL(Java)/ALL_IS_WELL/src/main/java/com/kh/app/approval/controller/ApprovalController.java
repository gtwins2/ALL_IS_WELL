package com.kh.app.approval.controller;

import java.util.List;

import javax.security.auth.login.LoginException;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.app.approval.service.ApprovalService;
import com.kh.app.approval.vo.ApprovalBtnVo;
import com.kh.app.approval.vo.ApprovalVo;
import com.kh.app.approval.vo.BusinessTripApprovalVo;
import com.kh.app.approval.vo.VacationApprovalVo;
import com.kh.app.attendance.vo.AttendanceVo;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequiredArgsConstructor
@RequestMapping("approval")
public class ApprovalController {

	private final ApprovalService as;
	private MemberVo loginMember;

	// 기안한 문서(화면)
	@GetMapping("draftList")
	public void dtaftList(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			Model model, HttpSession session) {

		loginMember = (MemberVo) session.getAttribute("loginMember");
		/*
		 * if(loginMember == null) { throw new LoginException(); }
		 */
		String no = loginMember.getNo();

		int listCount = as.getApprovalListCnt(no);
		int pageLimit = 5;
		int boardLimit = 10;

		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);

		List<ApprovalVo> voList = as.getApprovalList(pv, no);

		model.addAttribute("loginMember", loginMember);
		model.addAttribute("pv", pv);
		model.addAttribute("voList", voList);

	}

	// 결재한 문서(화면)
	@GetMapping("list")
	public void list() {

	}

	// 결재해야할 문서(휴가 화면)
	@GetMapping("vacation")
	public void vacation() {

	}

	// 결재된 문서(휴가 상세)
	@GetMapping("detailVacation")
	public void detailVacation() {

	}

	// 휴가 작성 버튼 클릭 시
//	@PostMapping("vacationBtn")
//	public String vacationBtn(ApprovalBtnVo bvo, HttpSession session) {
//
//		loginMember = (MemberVo) session.getAttribute("loginMember");
//		String no = loginMember.getNo();
//		bvo.setMemberNo(no);
//		
//		int result = as.vacationBtn(bvo);
//		ApprovalBtnVo updateBvo = as.getVacationApprovalBtnDateAfterInsert(bvo);
//		session.setAttribute("bvo", updateBvo);
//		
//		if (result != 1) {
//			return "errorPage";
//		}
//
//		return "approval/writeVacation";
//	}

	// 휴가 작성(화면)
//	@GetMapping("writeVacation")
//	public void writeVacation() {
//		
//	}

	// 기안한 문서(휴가 작성)
//	@GetMapping("writeVacation")
//	public String writeVacation(VacationApprovalVo vvo, HttpSession session) {
//
//		loginMember = (MemberVo) session.getAttribute("loginMember");
//		ApprovalBtnVo bvo = (ApprovalBtnVo) session.getAttribute("bvo");
//		vvo.setApprovalDocumentNo(bvo.getNo());
//		
//		int result = as.vacation(vvo);
//
//		if (result != 1) {
//			return "error/errorPage";
//		}
//
//		return "approval/draftList";
//	}

	/* 출장 */
	// 출장 작성 버튼 클릭 시
	@PostMapping("tripBtn")
	public String tripBtn(HttpSession session) {
		loginMember = (MemberVo) session.getAttribute("loginMember");
		String no = loginMember.getNo();
				
		return "approval/writeTrip";
	}
	
	@GetMapping("writeTrip")
	public void writeTrip() {
		
	}
	
	// 출장 작성
	@PostMapping("writeTrip")
	public String writeTrip(BusinessTripApprovalVo bvo, HttpSession session) {
		
	    loginMember = (MemberVo) session.getAttribute("loginMember");
	    String no = loginMember.getNo();
		boolean isSuccess = as.processTrip(no, bvo);
		if (!isSuccess) {
			return "error/errorPage";
		}
		
		return "approval/draftList";
	}
	

	// 결재된 문서(출장 상세)
	@GetMapping("detailTrip")
	public void detailTrip(String bno, Model model, HttpSession session) {

		loginMember = (MemberVo) session.getAttribute("loginMember");

		BusinessTripApprovalVo bvo = as.detailTrip(bno);

		model.addAttribute("bvo", bvo);
	}

	// 결재해야할 문서(재고)
	@GetMapping("inventory")
	public void inventory() {

	}

	// 결재된 문서(재고 상세)
	@GetMapping("detailInventory")
	public void detailInventory() {

	}

	// 기안한 문서(재고 작성)
	@GetMapping("writeInventory")
	public void writeInventory() {

	}
}
