package com.kh.app.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.member.vo.MemberVo;
import com.kh.app.mypage.service.MypageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MypageController {

	private final MypageService ms;
	
	@GetMapping("mypageMember")
	public String mypage() {
		
		return "mypage/mypageMember";
	}
	
	@GetMapping("memberInfoUpdate")
	public String memberInfoUpdate() {
		
		return "mypage/memberInfoUpdate";
	}
	
	@PostMapping("memberInfoUpdate")
	public String memberInfoUpdate(MemberVo vo) {
		
		int result = ms.memberInfoUpdate(vo);
		if(vo.getPassword().equals(vo.getPassword2())) {
			return "login/login";
		}
		return "mypage/passwordError";
	}
	
	@PostMapping("sign")
	public String sign(MemberVo vo) {
		
		int result = ms.sign(vo);
		
		return "login/login";
	}
	
	
}
