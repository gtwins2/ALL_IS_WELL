package com.kh.app.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.admin.service.AdminService;
import com.kh.app.admin.vo.AdminVo;
import com.kh.app.member.service.MemberService;
import com.kh.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("member")
@RequiredArgsConstructor
public class LoginController {

	private final MemberService ms;
	private final AdminService as;
	
	@GetMapping("login")
	public String login() {
		return "login/login";
	}
	
	@PostMapping("login")
	public String login(MemberVo vo, HttpSession session) {
		MemberVo loginMember = ms.login(vo);
		session.setAttribute("loginMember", loginMember);
		if(loginMember == null) {
			return "error/404page";
		}
		return "main/Mmain";
	}
	
	@GetMapping("Alogin")
	public String Alogin() {
		return "login/Alogin";
	}
	
	@PostMapping("Alogin")
	public String Alogin(AdminVo vo, HttpSession session) {
		System.out.println(vo);
		System.out.println(vo.getAdminId());
		if(vo.getAdminId().equals("ADMIN") && vo.getAdminPwd().equals("1234")) {
			return "main/Amain";
		}
		return "error/404page";
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
