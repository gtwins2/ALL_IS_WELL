package com.kh.app.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class AboardController {

	//�������׸��
	@GetMapping("noticeList")
	public String noticeList() {
		return "board/noticeList";
	}
	
	//�������� �ۼ��ϱ�
	@GetMapping("noticeWrite")
	public String noticeWrite() {
		return "board/noticeWrite";
	}
	
	//�������� �����ϱ�
	@GetMapping("noticeUpdate")
	public String noticeUpdate() {
		return "board/noticeUpdate";
	}
	
	//�������� ��������
	@GetMapping("noticeDetail")
	public String noticeDetail() {
		return "board/noticeDetail";
	}
	
	
	
	
	
	//���ǻ��� ���(������)
	@GetMapping("suggestList")
	public String suggestList() {
		return "board/suggestList";
	}
	
	//���ǻ��� ��������(����ۼ�)
	@GetMapping("suggestDetail")
	public String suggestDetail() {
		return "board/suggestDetail";
	}
	
	
	
	
	
	
	//���ǻ��� ���
	@GetMapping("inquiryList")
	public String inquiryList() {
		return "board/inquiryList";
	}
	
	//���ǻ��� ��������(�����ȸ)
	@GetMapping("inquiryDetail")
	public String inquiryDetail() {
		return "board/inquiryDetail";
	}
	
	
}
