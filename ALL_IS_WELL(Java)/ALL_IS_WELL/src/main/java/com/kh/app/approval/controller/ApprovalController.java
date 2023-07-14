package com.kh.app.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("approval")
public class ApprovalController {

	// 기안한 문서(h화면)
	@GetMapping("draft_list")
	public void dtaftList() {

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
