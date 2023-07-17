package com.kh.app.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class AboardController {

	//공지사항목록
	@GetMapping("noticeList")
	public String noticeList() {
		return "board/noticeList";
	}
	
	//공지사항 작성하기
	@GetMapping("noticeWrite")
	public String noticeWrite() {
		return "board/noticeWrite";
	}
	
	//공지사항 수정하기
	@GetMapping("noticeUpdate")
	public String noticeUpdate() {
		return "board/noticeUpdate";
	}
	
	//공지사항 상세페이지
	@GetMapping("noticeDetail")
	public String noticeDetail() {
		return "board/noticeDetail";
	}
	
	
	
	
	
	//건의사항 목록(관리자)
	@GetMapping("suggestList")
	public String suggestList() {
		return "board/suggestList";
	}
	
	//건의사항 상세페이지(댓글작성)
	@GetMapping("suggestDetail")
	public String suggestDetail() {
		return "board/suggestDetail";
	}
	
	
	
	
	
	
	//문의사항 목록
	@GetMapping("inquiryList")
	public String inquiryList() {
		return "board/inquiryList";
	}
	
	//문의사항 상세페이지(댓글조회)
	@GetMapping("inquiryDetail")
	public String inquiryDetail() {
		return "board/inquiryDetail";
	}
	
	
}
