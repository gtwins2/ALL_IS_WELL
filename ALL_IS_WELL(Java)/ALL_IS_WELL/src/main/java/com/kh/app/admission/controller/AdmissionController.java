package com.kh.app.admission.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("admission")
public class AdmissionController {
	//입원실 방 리스트
	@GetMapping("roomList")
	public String getRoomList() {
		return "admission/admissionRoomList";
	}
	
	@GetMapping("admissionRecord")
	public String registerAdmission() {
		return "admission/admissionListForm";
	}
}
