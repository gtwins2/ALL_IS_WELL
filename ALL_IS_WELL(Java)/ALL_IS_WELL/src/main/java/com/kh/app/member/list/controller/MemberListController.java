package com.kh.app.member.list.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class MemberListController {
		@GetMapping("list")
		public String memberList() {
			return "member/list";
		}
	
		@GetMapping("detail")
		public String memberDetail() {
			return "member/detail";
		}
}
