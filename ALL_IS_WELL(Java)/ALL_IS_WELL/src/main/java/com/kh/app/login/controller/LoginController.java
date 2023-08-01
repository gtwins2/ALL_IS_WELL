package com.kh.app.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.admin.vo.AdminVo;
import com.kh.app.member.service.MemberService;
import com.kh.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("member")
@RequiredArgsConstructor
public class LoginController {

	private final MemberService ms;

	@GetMapping("logout")
	public String logout() {
		return "login/logout";
	}
	
	@GetMapping("login")
	public String login() {
		return "login/login";
	}
	
	@PostMapping("login")
	public String login(MemberVo vo, HttpSession session) {
		MemberVo loginMember = ms.login(vo);
		session.setAttribute("loginMember", loginMember);

		if(loginMember == null) {
			return "redirect:/member/login";
			
		}

		return "main/Mmain";
	}
	
	@GetMapping("Alogin")
	public String Alogin() {
		return "login/Alogin";
	}
	
	@PostMapping("Alogin")
	public String Alogin(AdminVo vo, HttpSession session) {
		if(vo.getAdminId().equals("ADMIN") && vo.getAdminPwd().equals("1234")) {
			return "main/Amain";
		}
		return "error/404page";
	}
	
	@GetMapping("idFind")
	public String idFind() {
		return "login/idFind";
	}
	
	@PostMapping("idFind")
	public String idFind(MemberVo vo, Model model) {
		
		MemberVo voList = ms.idFind(vo);
		model.addAttribute("vo",voList);
		
		return "login/idFind";
	}
	
	@GetMapping("pwdFind")
	public String pwdFind() {
		return "login/pwdFind";
	}
	
}
