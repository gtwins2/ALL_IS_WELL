package com.kh.app.receipt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("receipt")
public class ReceiptController {

	//����
	@GetMapping("regist")
	public String regist() {
		return "receipt/regist";
	}
	
	//ȯ����ȸ
	@GetMapping("list")
	public String list() {
		return "receipt/list";
	}
	
	//��������
	@GetMapping("registContent")
	public String registContent() {
		return "receipt/registContent";
	}
	
	//������ ȯ����ȸ
	@GetMapping("registList")
	public String registList() {
		return "receipt/registList";
	}
	
	//ȯ����������
	@GetMapping("infoUpdate")
	public String infoUpdate() {
		return "receipt/infoUpdate";
	}
	
	//������
	@GetMapping("diagnosis")
	public String diagnosis() {
		return "receipt/diagnosis";
	}
	
}
