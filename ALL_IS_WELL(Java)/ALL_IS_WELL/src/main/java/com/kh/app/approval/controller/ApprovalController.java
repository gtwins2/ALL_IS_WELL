package com.kh.app.approval.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.app.approval.service.ApprovalService;
import com.kh.app.attendance.vo.AttendanceVo;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("approval")
public class ApprovalController {

	private final ApprovalService as;
	
	// 기안한 문서(화면)
	@GetMapping("draftList")
	public void dtaftList(@RequestParam(name="page", required=false, defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		int listCount = as.getAttendanceListCnt(no);
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<AttendanceVo> voList = as.getAttendanceList(pv, no);
		
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
	
	// 기안한 문서(휴가 작성)
	@GetMapping("writeVacation")
	public void writeVacation() {
		
	}

	// 결재해야할 문서(출장 화면)
	@GetMapping("trip")
	public void trip() {

	}

	// 결재된 문서(출장 상세)
	@GetMapping("detailTrip")
	public void detailTrip() {

	}
	
	// 디안한 문서(출장 작성)
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
