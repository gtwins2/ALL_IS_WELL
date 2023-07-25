package com.kh.app.board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.board.service.NoticeService;
import com.kh.app.board.vo.NoticeVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("board")
@RequiredArgsConstructor
public class AboardController {

	private final NoticeService ns;
	
	//�������׸��
	@GetMapping("noticeList")
	public String noticeList() {
		return "board/noticeList";
	}
	
	@PostMapping("noticeList")
	public String noticeList(NoticeVo vo) {
		List<NoticeVo> voList = ns.noticeList(vo);
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
