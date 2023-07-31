package com.kh.app.approval.controller;

import java.util.List;

import javax.security.auth.login.LoginException;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionSuspensionNotSupportedException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.app.approval.service.ApprovalService;
import com.kh.app.approval.vo.ApprovalVo;
import com.kh.app.approval.vo.BusinessTripApprovalVo;
import com.kh.app.approval.vo.VacationApprovalVo;
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

	// 결재한 문서(화면)
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
		
		vo.setDepartmentNo(departmentNo);
		vo.setApproverNo(no);
		

		int listCount = as.getApproverListCnt(vo);
		int pageLimit = 5;
		int boardLimit = 10;

		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);

		List<ApproverVo> voList = as.getApproverList(pv, vo);

		model.addAttribute("loginMember", loginMember);
		model.addAttribute("pv", pv);
		model.addAttribute("voList", voList);
		
	}

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
		
		VacationApprovalVo vvo = as.detailVacation(no);
		
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
		
		BusinessTripApprovalVo bvo = as.detailTrip(no);
				
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
		
		InventoryVo ivo = as.detailInventory(no);
		
		model.addAttribute("ivo", ivo);
		
	}

}
