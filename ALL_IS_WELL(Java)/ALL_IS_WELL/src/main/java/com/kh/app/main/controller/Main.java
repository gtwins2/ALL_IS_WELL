package com.kh.app.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Main {

	@GetMapping("main")
	public String main() {
		
		return "main/main";
	}
	
}
