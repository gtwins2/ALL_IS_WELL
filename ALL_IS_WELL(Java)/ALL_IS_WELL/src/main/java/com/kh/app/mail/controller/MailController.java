package com.kh.app.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("mail")
@RequiredArgsConstructor
public class MailController {
	//받은 메일함(화면)
	@GetMapping("receiveList")
	public String receiveMailList() {
		return "mail/receiveMailForm";
	}
}
