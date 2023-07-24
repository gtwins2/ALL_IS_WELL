package com.kh.app.prescription.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.patient.vo.PatientVo;
import com.kh.app.prescription.service.PrescriptionService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("prescription")
@RequiredArgsConstructor
public class PrescriptionController {

	private final PrescriptionService ps;
	
	@GetMapping("list")
	public String list(Model model, HttpSession session) {
		
		List<PatientVo> voList = ps.list();
		model.addAttribute("voList" ,voList);
		
		return "prescription/list";
	}
	
	@GetMapping("detail")
	public String detail() {
		return "prescription/detail";
	}
	
	@GetMapping("write")
	public String write() {
		return "prescription/write";
	}
	
}
