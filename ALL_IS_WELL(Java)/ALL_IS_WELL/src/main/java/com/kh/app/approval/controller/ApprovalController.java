package com.kh.app.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
	// 결재해야할 문서(휴가) 상세(화면)
	@GetMapping("vacation")
	public void vacation() {
		
	}
	
	
}
