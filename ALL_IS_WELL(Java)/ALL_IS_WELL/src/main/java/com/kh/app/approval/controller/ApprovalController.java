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

	// 기안한 문서(화면)
	@GetMapping("draftList")
	public void dtaftList(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			Model model, HttpSession session) {

		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
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
	@PostMapping("vacationBtn")
	public String vacationBtn() {

//		int result = as.vacationBtn();
//
//		if (result != 1) {
//			return "errorPage";
//		}

		return "approval/writeVacation";
	}
	
	// 기안한 문서(휴가 작성)
	@GetMapping("writeVacation")
	public void writeVacation() {

	}

	// 기안한 문서(휴가 작성)
//	@PostMapping("writeVacation")
//	public String writeVacation(ApprovalVo vo, Model model, HttpSession session) {
//
//		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
//		String no = loginMember.getNo();
//
//		vo.setNo(no);
//
//		int result = as.writeVacation(vo);
//
//		if (result != 1) {
//			return "";
//		}
//
//		return "approval/draftList";
//	}
	
	// 출장 작성 버튼 클릭 시
	@PostMapping("tripBtn")
	public String tripBtn(ApprovalBtnVo bvo, HttpSession session) {

		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		String no = loginMember.getNo();
		bvo.setMemberNo(no);
		
		int result = as.tripBtn(bvo);
		
		ApprovalBtnVo updatedBvo = as.getApprovalBtnDateAfterInsert(bvo);
		session.setAttribute("bvo", updatedBvo);
				
		if(result != 1) {
			return "redirect:/errorPage";
		}
		
		return "redirect:/approval/writeTrip";
	}

	// 출장 작성(출장 화면)
	@GetMapping("trip")
	public void trip(Model model, HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
				
		model.addAttribute("loginMember", loginMember);
		
	}
	
	// 출장 작성
	@PostMapping("trip")
	public String trip(BusinessTripApprovalVo vo, HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		ApprovalBtnVo bvo = (ApprovalBtnVo) session.getAttribute("bvo");
		
		vo.setApprovalDocumentNo(bvo.getNo());
		
		int result = as.trip(vo);
				
		if(result != 1) {
			return "error/errorPage";
		}
		
		return "redirect:/approval/draftList";
	}

	// 결재된 문서(출장 상세)
	@GetMapping("detailTrip")
	public void detailTrip() {
		
	}

	// 기안한 문서(출장 작성)
	@GetMapping("writeTrip")
	public void writeTrip() {

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
