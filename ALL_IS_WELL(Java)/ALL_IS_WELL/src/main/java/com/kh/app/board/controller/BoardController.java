package com.kh.app.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class BoardController {

	//공지사항목록
	@GetMapping("noticeList")
	public String noticeList() {
		return "board/noticeList";
	}
	
}
