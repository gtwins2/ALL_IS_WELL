package com.kh.app.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MypageController {

	@GetMapping("mypageMember")
	public String mypage() {
		
		return "mypage/mypageMember";
	}
	
	@GetMapping("memberInfoUpdate")
	public String memberInfoUpdate() {
		
		return "mypage/memberInfoUpdate";
	}
	
	
	
	
}
