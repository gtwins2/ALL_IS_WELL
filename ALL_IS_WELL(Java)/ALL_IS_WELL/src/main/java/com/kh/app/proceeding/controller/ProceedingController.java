package com.kh.app.proceeding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("proceeding")
public class ProceedingController {

	//회의록 목록 조회
	@GetMapping("list")
	public String proceeding() {
		return "proceeding/list";
	}
	
	//회의록 상세 조회
	@GetMapping("detail")
	public String proceedingDetail() {
		return "proceeding/detail";
	}
	
	//회의록 작성
	@GetMapping("write")
	public String proceedingWrite() {
		return "proceeding/write";
	}
	
}
