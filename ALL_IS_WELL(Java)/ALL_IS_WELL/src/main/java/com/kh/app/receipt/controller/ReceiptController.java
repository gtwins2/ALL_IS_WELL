package com.kh.app.receipt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("receipt")
public class ReceiptController {

	@GetMapping("regist")
	public String registration() {
		return "receipt/regist";
	}
}
