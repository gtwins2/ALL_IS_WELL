package com.kh.app.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Main {

	@GetMapping("Mmain")
	public String Mmain() {
		
		return "main/Mmain";
	}
	
	@GetMapping("Amain")
	public String Amain() {
		
		return "main/Amain";
	}
	
}
