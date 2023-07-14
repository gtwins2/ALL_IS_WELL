package com.kh.app.receipt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("receipt")
public class ReceiptController {

	//접수
	@GetMapping("regist")
	public String regist() {
		return "receipt/regist";
	}
	
	//환자조회
	@GetMapping("list")
	public String list() {
		return "receipt/list";
	}
	
	//접수내용
	@GetMapping("registContent")
	public String registContent() {
		return "receipt/registContent";
	}
	
	//접수한 환자조회
	@GetMapping("registList")
	public String registList() {
		return "receipt/registList";
	}
	
	//환자정보수정
	@GetMapping("infoUpdate")
	public String infoUpdate() {
		return "receipt/infoUpdate";
	}
	
	//진료기록
	@GetMapping("diagnosis")
	public String diagnosis() {
		return "receipt/diagnosis";
	}
	
}
