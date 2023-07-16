package com.kh.app.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("attendance")
@RequiredArgsConstructor
public class AttendanceController {

	
	//회원 근태확인(화면)
	@GetMapping("list")
	public void attendanceList() {
		
		
	}
	
	//관리자 근태확인(화면)
	@GetMapping("admin/list")
	public void adminAttendanceList() {
		
	}
	
}
