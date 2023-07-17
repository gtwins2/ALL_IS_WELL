package com.kh.app.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("Mboard")
public class MboardController {

	//���ǻ��� ���(����)
	@GetMapping("suggestList")
	public String suggestList() {
		return "board/member/suggestList";
	}
	
	//���ǻ��� ��������(�����ȸ)
	@GetMapping("suggestDetail")
	public String suggestDetail() {
		return "board/member/suggestDetail";
	}
	
	
	//���ǻ��� �ۼ��ϱ�
	@GetMapping("suggestWrite")
	public String suggestWrite() {
		return "board/member/suggestWrite";
	}
	
	//���ǻ��� ���
	@GetMapping("inquiryList")
	public String inquiryList() {
		return "board/member/inquiryList";
	}
	
	//���ǻ��� �ۼ�
	@GetMapping("inquiryWrite")
	public String inquiryWrite() {
		return "board/member/inquiryWrite";
	}
	
	//���ǻ��� ��������(�����ȸ)
	@GetMapping("inquiryDetail")
	public String inquiryDetail() {
		return "board/member/inquiryDetail";
	}
	
	
	
	
	//�������׸��
	@GetMapping("noticeList")
	public String noticeList() {
		return "board/member/noticeList";
	}

	//�������� ��������
	@GetMapping("noticeDetail")
	public String noticeDetail() {
		return "board/member/noticeDetail";
	}
}
