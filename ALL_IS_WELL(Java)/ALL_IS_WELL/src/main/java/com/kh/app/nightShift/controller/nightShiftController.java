package com.kh.app.nightShift.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("nightShift")
public class nightShiftController {

//	//회의록 목록 조회
//	@GetMapping("list")
//	public String proceeding() {
//		return "proceeding/list";
//	}
//	
//	//회의록 상세 조회
//	@GetMapping("detail")
//	public String proceedingDetail() {
//		return "proceeding/detail";
//	}
	
	//당직 지정
	@GetMapping("select")
	public String proceedingWrite() {
		return "nightShift/select";
	}
	
}
