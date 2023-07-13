package com.kh.app.prescription.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("prescription")
public class PrescriptionController {

	@GetMapping("list")
	public String list() {
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
