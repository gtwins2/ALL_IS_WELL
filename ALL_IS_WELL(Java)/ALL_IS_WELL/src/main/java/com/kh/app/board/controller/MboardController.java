package com.kh.app.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("Mboard")
public class MboardController {

	//건의사항 목록(직원)
	@GetMapping("suggestList")
	public String suggestList() {
		return "board/member/suggestList";
	}
	
	//건의사항 상세페이지(댓글조회)
	@GetMapping("suggestDetail")
	public String suggestDetail() {
		return "board/member/suggestDetail";
	}
	
	
	//건의사항 작성하기
	@GetMapping("suggestWrite")
	public String suggestWrite() {
		return "board/member/suggestWrite";
	}
}
