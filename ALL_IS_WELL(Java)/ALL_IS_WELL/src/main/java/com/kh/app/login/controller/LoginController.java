package com.kh.app.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.member.service.MemberService;
import com.kh.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("member")
@RequiredArgsConstructor
public class LoginController {

	private final MemberService service;
	
	@GetMapping("login")
	public String login() {
		return "login/login";
	}
	
	@PostMapping("login")
	public String login(MemberVo vo, HttpSession session) {
		System.out.println("1");
		MemberVo loginMember = service.login(vo);
		session.setAttribute("loginMember", loginMember);
		return "main/Mmain";
	}
	
	@GetMapping("Alogin")
	public String Alogin() {
		return "login/Alogin";
	}
	
	@GetMapping("idFind")
	public String idFind() {
		return "login/idFind";
	}
	
	@GetMapping("pwdFind")
	public String pwdFind() {
		return "login/pwdFind";
	}
	
}
