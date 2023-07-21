package com.kh.app.receipt.controller;

import java.util.List;

import javax.security.auth.login.LoginException;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.patient.vo.PatientVo;
import com.kh.app.receipt.service.ReceiptService;
import com.kh.app.receipt.vo.ReceiptVo;

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
	
	@PostMapping("regist")
	public String regist(@RequestParam(name="page", required=false, defaultValue="1") 
	int currentPage, Model model, HttpSession session, PatientVo vo) {
		
		int result = rs.regist(vo);
		
		if(result != 1) {
			return "error/404page";
		}
		
		int listCount = rs.getPatientListCnt();
	    int pageLimit = 5;
	    int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<PatientVo> voList = rs.list(pv);
		model.addAttribute("pv", pv);
		model.addAttribute("voList" ,voList);
		
		return "redirect:/receipt/list";
	}
	
	//ȯ����ȸ
	@GetMapping("list")
	public String list(@RequestParam(name="page", required=false, defaultValue="1") 
	int currentPage, Model model, HttpSession session) {
		 
		 MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		 if(loginMember == null) {
			 
		 }
		 
		 int listCount = rs.getPatientListCnt();
	     int pageLimit = 5;
	     int boardLimit = 10;
	      
	     PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<PatientVo> voList = rs.list(pv);
		model.addAttribute("pv", pv);
		model.addAttribute("voList" ,voList);

		return "receipt/list";
	}
	
	@PostMapping("list")
	public String list(PatientVo vo, Model model) {
//		List<PatientVo> voList = rs.search(vo);
//		model.addAttribute("voList" ,voList);
		
		List<PatientVo> voList = rs.selectOneList(vo);
		model.addAttribute("voList" ,voList);
		
		System.out.println(voList);
		
		return "receipt/registContent";
	}
	
	//��������
	@GetMapping("registContent")
	public String registContent() {
		
		return "receipt/registContent";
	}
	
	@PostMapping("registContent")
	public String registContent(@RequestParam(name="page", required=false, defaultValue="1") 
	int currentPage, Model model, HttpSession session, ReceiptVo vo) {
		System.out.println("1");
		int result = rs.registContent(vo);
		System.out.println("2");
		if(result != 1) {
			return "error/404page";
		}

		int listCount = rs.getPatientListCnt();
	    int pageLimit = 5;
	    int boardLimit = 10;
		
	    System.out.println("3");
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
	    System.out.println("4");

		List<PatientVo> voList = rs.list(pv);
		model.addAttribute("voList" ,voList);
		model.addAttribute("pv", pv);
	    System.out.println("5");

		return "redirect:/receipt/registList";
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
