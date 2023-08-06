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
import com.kh.app.approval.vo.ApprovalVo;
import com.kh.app.approval.vo.BusinessTripApprovalVo;
import com.kh.app.approval.vo.VacationApprovalVo;
import com.kh.app.approver.vo.AdminApproverVo;
import com.kh.app.approver.vo.ApproverVo;
import com.kh.app.inventory.vo.InventoryVo;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("approval")
public class ApprovalController {

	private final ApprovalService as;
	private MemberVo loginMember;

	// 기안한 문서(화면)
	@GetMapping("draftList")
	public void draftList(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
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
	
	//관리자 문서 리스트
	@GetMapping("admin/list")
	public void adminList(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			Model model, HttpSession session) throws Exception {

//		loginMember = (MemberVo) session.getAttribute("loginMember");
//		if("ADMIN".equals(loginMember.getName())) {
//			throw new LoginException();
//		}
		
		ApproverVo vo = new ApproverVo();
		String approverName = "ADMIN";
		
		vo.setApproverName(approverName);
		
		int listCount = as.getAdminListCnt(vo);
		int pageLimit = 5;
		int boardLimit = 10;

		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);

		List<ApproverVo> voList = as.getAdminList(pv, vo);
		
		model.addAttribute("loginMember", loginMember);
		model.addAttribute("pv", pv);
		model.addAttribute("voList", voList);
		
		
	}
	
	// 관리자 휴가 결재 문서
	@GetMapping("admin/vacation")
	public void adminVacation(Model model, String no) {
						
		AdminApproverVo avo = as.detailApprovalAdminVacation(no);
		
		model.addAttribute("avo", avo);
		
	}
	
	// 관리자 출장 결재 문서
	@GetMapping("admin/trip")
	public void adminTrip(Model model, String no) {
						
		AdminApproverVo avo = as.detailApprovalAdminTrip(no);
		
		model.addAttribute("avo", avo);
		
	}
	
	// 관리자 재고 결재 문서
	@GetMapping("admin/inventory")
	public void adminInventory(Model model, String no) {
						
		AdminApproverVo avo = as.detailApprovalAdminInventory(no);
		
		List<InventoryVo> voList = as.detailInventoryItems(no);	
		
		model.addAttribute("voList", voList);
		model.addAttribute("avo", avo);
		
	}
	
	//반려 선택
	@PostMapping("admin/refuse")
	public String adminRefuse(String no, String reason) {
				
		AdminApproverVo avo = new AdminApproverVo();
		avo.setNo(no);
		avo.setReason(reason);
		
		int result = as.AdminRefuseUpdate(avo);
		
		if(result != 1) {
			return "error/errorPage";
		}
		
		return "redirect:/approval/admin/list";
	}
	
	//승인 선택
	@PostMapping("admin/approval")
	public String adminApproval(String no,HttpSession session) {
		
		loginMember = (MemberVo) session.getAttribute("loginMember");
		
		AdminApproverVo avo = new AdminApproverVo();
		avo.setNo(no);
		
		int result = as.AdminApprovalUpdate(avo);
		
		if(result != 1) {
			return "error/errorPage";
		}
		
		return "redirect:/approval/admin/list";
	}

	// 결재해야할 문서(화면 (직급이 D1인 사람))
	@GetMapping("list")
	public void list(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			Model model, HttpSession session) {

		loginMember = (MemberVo) session.getAttribute("loginMember");
		/*
		 * if(loginMember == null) { throw new LoginException(); }
		 */
		
		ApproverVo vo = new ApproverVo();
		
		String no = loginMember.getNo();
		String departmentNo = loginMember.getDepartmentNo();
		String positionNo = loginMember.getPositionNo();
		
		vo.setDepartmentNo(departmentNo);
		vo.setPositionNo(positionNo);
		vo.setApproverNo(no);
		
		if(!"1".equals(positionNo)) {
			throw new RuntimeException("결제권자가 아님");
		}
		
		int listCount = as.getApproverListCnt(vo);
		int pageLimit = 5;
		int boardLimit = 10;

		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);

		List<ApproverVo> voList = as.getApproverList(pv, vo);
		
		model.addAttribute("loginMember", loginMember);
		model.addAttribute("pv", pv);
		model.addAttribute("voList", voList);
		
	}
	
	//재고 신청 문서 결재 화면
	@GetMapping("inventory")
	public void inventory(HttpSession session, Model model, String no) { 
				
		loginMember = (MemberVo) session.getAttribute("loginMember");
		
		ApproverVo vo = new ApproverVo();
		vo.setApprovalDocumentNo(no);
		vo.setApproverNo(loginMember.getNo());
		vo.setApproverName(loginMember.getName());
		vo.setSign(loginMember.getSign());
		
		AdminApproverVo ivo = null;
		
		ApproverVo statusVo = as.getStatus(no);
		String status = statusVo.getStatus();
		
		if("F".equals(status) || "R".equals(status) || "O".equals(status) || "A".equals(status)) {
			ivo = as.detailApprovalInventory(no);
		}
		else {
			ivo = as.detailInventory(no);
		}
		
		List<InventoryVo> voList = as.detailInventoryItems(no);		
		
		model.addAttribute("vo",vo);
		model.addAttribute("ivo", ivo);
		model.addAttribute("voList", voList);
		
	}
	
	//휴가 신청 문서 결재 화면
	@GetMapping("vacation")
	public void vacation(HttpSession session, Model model, String no) {
		
		loginMember = (MemberVo) session.getAttribute("loginMember");
		
		ApproverVo vo = new ApproverVo();
		vo.setApproverNo(loginMember.getNo());
		vo.setApproverName(loginMember.getName());
		vo.setSign(loginMember.getSign());
		
		ApproverVo statusVo = as.getStatus(no);
		String status = statusVo.getStatus();
		
		AdminApproverVo vvo = null;
		if("F".equals(status) || "R".equals(status) || "O".equals(status) || "A".equals(status)) {
			vvo = as.detailApprovalVacation(no);
		}
		else {
			vvo = as.detailVacation(no);
		}
		
		model.addAttribute("vvo", vvo);
		model.addAttribute("vo", vo);
	}
	
	//출장 신청 문서 결재 화면
	@GetMapping("trip")
	public void trip(HttpSession session, Model model, String no) {
		
		loginMember = (MemberVo) session.getAttribute("loginMember");
		
		ApproverVo vo = new ApproverVo();
		
		ApproverVo statusVo = as.getStatus(no);
		String status = statusVo.getStatus();
		
		AdminApproverVo bvo = null;
		
		if("F".equals(status) || "R".equals(status) || "O".equals(status) || "A".equals(status)) {
			bvo = as.detailApprovalTrip(no);
		}
		else {
			bvo = as.detailTrip(no);
		}
		
		model.addAttribute("bvo", bvo);
		model.addAttribute("vo", vo);
		
	}
	
	//반려 선택
	@PostMapping("refuse")
	public String refuse(String no, String reason, HttpSession session) {
		
		loginMember = (MemberVo) session.getAttribute("loginMember");
		
		ApproverVo vo = new ApproverVo();
		vo.setApprovalDocumentNo(no);
		vo.setReason(reason);
		vo.setApproverNo(loginMember.getNo());
		vo.setApproverName(loginMember.getName());
		vo.setPositionNo(loginMember.getPositionNo());
		vo.setDepartmentNo(loginMember.getDepartmentNo());
		
		boolean result = as.processRefuse(vo);
		
		if(!result) {
			return "error/errorPage";
		}
		
		return "redirect:/approval/list";
	}
	
	//승인 선택
	@PostMapping("approval")
	public String approval(String no, HttpSession session) {
		
		loginMember = (MemberVo) session.getAttribute("loginMember");
		
		ApproverVo vo = new ApproverVo();
		vo.setApprovalDocumentNo(no);
		vo.setApproverNo(loginMember.getNo());
		vo.setApproverName(loginMember.getName());
		vo.setPositionNo(loginMember.getPositionNo());
		vo.setDepartmentNo(loginMember.getDepartmentNo());
		
		boolean result = as.processApproval(vo);
		
		if(!result) {
			return "error/errorPage";
		}
		
		return "redirect:/approval/list";
	}
	
	/*  */

	// 결재해야할 문서(휴가 화면)
	@GetMapping("writeVacation")
	public void writeVacation(HttpSession session) throws Exception {
		
		loginMember = (MemberVo) session.getAttribute("loginMember");
		if(loginMember == null) {
			throw new LoginException();
		}
		
	}
	
	// 휴가 작성
	@PostMapping("writeVacation")
	public String writeVacation(VacationApprovalVo vvo, HttpSession session) { 
		loginMember = (MemberVo) session.getAttribute("loginMember");
	    String no = loginMember.getNo();
	    vvo.setMemberNo(no);
	    
		boolean isSuccess = as.processVacation(vvo);
		if (!isSuccess) {
			return "error/errorPage";
		}
		return "redirect:/approval/draftList";
	}

	// 결재된 문서(휴가 상세)
	@GetMapping("detailVacation")
	public void detailVacation(Model model, HttpSession session, String no) {
		
		loginMember = (MemberVo) session.getAttribute("loginMember");
		
		AdminApproverVo vvo = as.detailVacation(no);
		
		model.addAttribute("vvo", vvo);
	}


	/* 출장 */
	// 출장 화면
	@GetMapping("writeTrip")
	public void writeTrip(HttpSession session) throws Exception {
		loginMember = (MemberVo) session.getAttribute("loginMember");
		if(loginMember == null) {
			throw new LoginException();
		}
		
	}
	
	// 출장 작성
	@PostMapping("writeTrip")
	public String writeTrip(BusinessTripApprovalVo bvo, HttpSession session) {
	    loginMember = (MemberVo) session.getAttribute("loginMember");
	    String no = loginMember.getNo();
	    bvo.setMemberNo(no);
	    
		boolean isSuccess = as.processTrip(bvo);
		if (!isSuccess) {
			return "error/errorPage";
		}
		return "redirect:/approval/draftList";
	}
	

	// 결재된 문서(출장 상세)
	@GetMapping("detailTrip")
	public void detailTrip(Model model, HttpSession session, String no) {
		
		loginMember = (MemberVo) session.getAttribute("loginMember");
		
		AdminApproverVo bvo = as.detailTrip(no);
				
		model.addAttribute("bvo", bvo);
	}

	// 결재해야할 문서(재고)
	@GetMapping("writeInventory")
	public void inventory(Model model, HttpSession session) {
		loginMember = (MemberVo) session.getAttribute("loginMember");
		
		List<InventoryVo> iList = as.getInventoryData();
				
		model.addAttribute("iList", iList);
		
	}
	
	// 재고 작성
	@PostMapping("writeInventory")
	public String writeInventory(InventoryVo ivo, HttpSession session) {
		loginMember = (MemberVo) session.getAttribute("loginMember");
	    String no = loginMember.getNo();
	    ivo.setMemberNo(no);
	    System.out.println(ivo.getCategoryNoArr());
	    System.out.println(ivo.getCountArr());
		boolean isSuccess = as.processInventory(ivo);
		if (!isSuccess) {
			return "error/errorPage";
		}
		return "redirect:/approval/draftList";
	}

	// 결재된 문서(재고 상세)
	@GetMapping("detailInventory")
	public void detailInventory(HttpSession session, Model model, String no) {
		
		loginMember = (MemberVo) session.getAttribute("loginMember");
		
		AdminApproverVo ivo = null;
		
		ApproverVo statusvo = as.getStatus(no);
		String status = statusvo.getStatus();
		
		if("F".equals(status) || "R".equals(status)) {
			ivo = as.detailApprovalInventory(no);
		}
		else {
			ivo = as.detailInventory(no);
		}
		
		List<InventoryVo> voList = as.detailInventoryItems(no);		
		
		model.addAttribute("ivo", ivo);
		model.addAttribute("voList", voList);
		
	}

}
