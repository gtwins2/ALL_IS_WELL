package com.kh.app.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("login")
public class LoginController {

	@GetMapping
	public String login() {
		return "login/login";
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
