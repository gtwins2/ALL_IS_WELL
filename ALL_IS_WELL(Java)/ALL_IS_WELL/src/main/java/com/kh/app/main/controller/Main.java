package com.kh.app.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.attendance.vo.AttendanceVo;
import com.kh.app.main.service.MainService;
import com.kh.app.page.vo.PageVo;
import com.kh.app.patient.vo.PatientVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class Main {
	
	private final MainService ms;
	
	@GetMapping("Mmain")
	public String Mmain() {
		
		return "main/Mmain";
	}
	
	//출근
	@PostMapping("attend")
	public String attend(AttendanceVo vo) {
		
		int result = ms.attend(vo);
		
		if(result != 1) {
			return "error/500page";
		}
		
		
		
		return "main/Mmain";
	}
	
	//퇴근
	@PostMapping("leave")
	public String leave(AttendanceVo vo) {
		int result = ms.leave(vo);
		
		if(result != 1) {
			return "error/500page";
		}
		
		return "main/Mmain";
	}
	
	@GetMapping("Amain")
	public String Amain(Model model) {
		
		return "main/Amain";
	}
	
	
	
}
