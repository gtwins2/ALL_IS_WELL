package com.kh.app.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("attendance")
@RequiredArgsConstructor
public class AttendanceController {

	
	//ȸ�� ����Ȯ��(ȭ��)
	@GetMapping("list")
	public void attendanceList() {
		
		
	}
	
	//������ ����Ȯ��(ȭ��)
	@GetMapping("admin/list")
	public void adminAttendanceList() {
		
	}
	
}
