package com.kh.app.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("approval")
public class ApprovalController {

	@GetMapping("list")
	public String list() {
		
		return "approval/list";
	}
	
}
