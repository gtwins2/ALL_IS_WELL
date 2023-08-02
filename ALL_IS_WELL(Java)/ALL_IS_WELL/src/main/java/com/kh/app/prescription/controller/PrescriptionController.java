package com.kh.app.prescription.controller;

import java.util.List;

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
import com.kh.app.prescription.service.PrescriptionService;
import com.kh.app.prescription.vo.PrescriptionVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("prescription")
@RequiredArgsConstructor
public class PrescriptionController {

	private final PrescriptionService ps;
	
	@GetMapping("list")
	public String list(@RequestParam(name="page", required=false, defaultValue="1") 
	int currentPage, Model model, HttpSession session, PrescriptionVo vo) {
		
		int listCount = ps.getPrescriptionListCnt(vo);
	    int pageLimit = 5;
	    int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<PatientVo> voList = ps.PrescriptionList(pv);
		model.addAttribute("voList" ,voList);
		model.addAttribute("pv", pv);
		
		return "prescription/list";
	}
	
	@GetMapping("detail")
	public String detail(PrescriptionVo vo, Model model) {
		
		PrescriptionVo voList = ps.detail(vo);
		model.addAttribute("vo" ,voList);
		
		return "prescription/detail";
	}
	
//	@GetMapping("write")
//	public String write() {
//		return "prescription/write";
//	}
	@GetMapping("write")
	public String write() {
		return "prescription/write";
	}
	
	
	@PostMapping("write")
	public String write(@RequestParam(name="page", required=false, defaultValue="1") 
	int currentPage, Model model, HttpSession session, PrescriptionVo vo) {
		
		int result2 = ps.insertPL(vo);
		int result = ps.write(vo);
		
		int listCount = ps.getPrescriptionListCnt(vo);
	    int pageLimit = 5;
	    int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<PatientVo> voList = ps.PrescriptionList(pv);
		model.addAttribute("voList" ,voList);
		model.addAttribute("pv", pv);
		
		return "prescription/list";
	}
	
}
