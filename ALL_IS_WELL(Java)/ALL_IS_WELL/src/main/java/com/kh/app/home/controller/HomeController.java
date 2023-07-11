package com.kh.app.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("common/member")
public class HomeController{

	@GetMapping("side-bar")
	public void home() {
		
	}
	
}