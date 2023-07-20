package com.kh.app.receipt.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.patient.vo.PatientVo;
import com.kh.app.receipt.service.ReceiptService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("receipt")
@RequiredArgsConstructor
public class ReceiptController {

	private final ReceiptService rs; 
	
	//����
	@GetMapping("regist")
	public String regist() {
		return "receipt/regist";
	}
	
	//ȯ����ȸ
	@GetMapping("list")
	public String list(Model model) {
		
		List<PatientVo> voList = rs.list();
		model.addAttribute("voList" ,voList);
		return "receipt/list";
	}
	
	@PostMapping("list")
	public String list(PatientVo vo, Model model) {
		List<PatientVo> voList = rs.search(vo);
		model.addAttribute("voList" ,voList);
		System.out.println(voList);
		
		return "receipt/registContent";
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
	
	//접수
	@GetMapping("diagnosis")
	public String diagnosis() {
		return "receipt/diagnosis";
	}
	
	
	
}
