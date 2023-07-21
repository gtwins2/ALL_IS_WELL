package com.kh.app.duty.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("duty")
public class DutyController {

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
	public void proceedingWrite() {
		
	}
	
}
