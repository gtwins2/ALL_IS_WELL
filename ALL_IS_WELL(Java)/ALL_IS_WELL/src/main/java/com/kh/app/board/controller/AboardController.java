package com.kh.app.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.app.board.service.InquiryService;
import com.kh.app.board.service.NoticeService;
import com.kh.app.board.service.SuggestService;
import com.kh.app.board.vo.InquiryVo;
import com.kh.app.board.vo.NoticeReplyVo;
import com.kh.app.board.vo.NoticeVo;
import com.kh.app.board.vo.SuggestVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.patient.vo.PatientVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("board")
@RequiredArgsConstructor
public class AboardController {

	private final NoticeService ns;
	private final SuggestService ss;
	private final InquiryService is;
	
	//�������׸��
	@GetMapping("noticeList")
	public String noticeList(@RequestParam(name="page", required=false, defaultValue="1") 
	int currentPage, Model model, HttpSession session, NoticeVo vo) {
		
		int listCount = ns.getNoticeListCnt();
	    int pageLimit = 5;
	    int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<NoticeVo> voList = ns.noticeList(pv);
		model.addAttribute("pv", pv);
		model.addAttribute("voList" ,voList);
		
		return "board/noticeList";
	}
	
//	@PostMapping("noticeList")
//	public String noticeList(NoticeVo vo, Model model) {
//		List<NoticeVo> voList = ns.noticeList(vo);
//		
//		model.addAttribute("voList" ,voList);
//		
//		return "board/noticeList";
//	}
	
	//�������� �ۼ��ϱ�
	@GetMapping("noticeWrite")
	public String noticeWrite() {
	
		return "board/noticeWrite";
	}
	
	@PostMapping("noticeWrite")
	public String noticeWrite(NoticeVo vo) {
		
		int result = ns.noticeWrite(vo);
		int result2 = ns.noticeFile(vo);
		
		return "redirect:/board/noticeList";
	}
	
	//�������� �����ϱ�
	@GetMapping("noticeUpdate")
	public String noticeUpdate(NoticeVo vo, Model model) {
		
		NoticeVo voList = ns.noticeDetail(vo);
		model.addAttribute("vo" ,voList);
		return "board/noticeUpdate";
	}
	
	@PostMapping("noticeUpdate")
	public String noticeUpdate(NoticeVo vo) {
		
		int result = ns.noticeUpdate(vo);
		int result2 = ns.fileUpdate(vo);
		
		return "redirect:/board/noticeList";
	}
	
	//�������� ��������
	@GetMapping("noticeDetail")
	public String noticeDetail(NoticeVo vo, Model model, NoticeReplyVo vo2) {
		NoticeVo voList = ns.noticeDetail(vo);
		List<NoticeReplyVo> voList2 = ns.noticeReply(vo2);
		
		
		model.addAttribute("voList2" ,voList2);
		model.addAttribute("vo" ,voList);
		
		
		return "board/noticeDetail";
	}
	
	@PostMapping("noticeDetail")
	public String noticeDetail(NoticeReplyVo vo) {
		int result = ns.replyWrite(vo);
		String no = vo.getNoticeNo();
		return "redirect:/board/noticeDetail?no="+ no;
	}
	
	@PostMapping("noticeReplyDelete")
	public String noticeReplyDelete(NoticeReplyVo vo) {
		int result = ns.noticeReplyDelete(vo);
		String no = vo.getNo();
		return "redirect:/board/noticeDetail?no="+ no;
	}
	
	@GetMapping("noticeReplyUpdate")
	public String noticeReplyUpdate(String no, String content, String noticeNo, Model model) {
		model.addAttribute("no",no);
		model.addAttribute("content",content);
		model.addAttribute("noticeNo",noticeNo);
		return "board/noticeReplyUpdate";
	}
	
	@PostMapping("noticeReplyUpdate")
	public String noticeReplyUpdate(NoticeReplyVo vo) {
		int result = ns.noticeReplyUpdate(vo);
		String no = vo.getNoticeNo();
		
		return "redirect:/board/noticeDetail?no="+ no;
	}
	
	
	
	
	//���ǻ��� ���(������)
	@GetMapping("suggestList")
	public String suggestList(@RequestParam(name="page", required=false, defaultValue="1") 
	int currentPage, Model model, HttpSession session,SuggestVo vo) {
		
		
		int listCount = ss.getListCnt();
	    int pageLimit = 5;
	    int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<SuggestVo> voList = ss.suggestList(pv);
		model.addAttribute("pv", pv);
		model.addAttribute("voList" ,voList);
		return "board/suggestList";
	}
	
//	@PostMapping("suggestList")
//	public String suggestList(SuggestVo vo, Model model) {
//		List<SuggestVo> voList = ss.suggestList(vo);
//		
//		model.addAttribute("voList" ,voList);
//		
//		return "board/suggestList";
//	}
	
	//���ǻ��� ��������(����ۼ�)
	@GetMapping("suggestDetail")
	public String suggestDetail() {
		
		
		return "board/suggestDetail";
	}
	
	
	
	
	
	
	//���ǻ��� ���
	@GetMapping("inquiryList")
	public String inquiryList(@RequestParam(name="page", required=false, defaultValue="1") 
	int currentPage, Model model, HttpSession session,InquiryVo vo) {
		
		
		int listCount = is.getListCnt();
	    int pageLimit = 5;
	    int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<InquiryVo> voList = is.inquiryList(pv);
		model.addAttribute("pv", pv);
		model.addAttribute("voList" ,voList);
		
		return "board/inquiryList";
	}
	
	//���ǻ��� ��������(�����ȸ)
	@GetMapping("inquiryDetail")
	public String inquiryDetail(InquiryVo vo, Model model, NoticeReplyVo vo2) {
		
		InquiryVo voList = is.inquiryDetail(vo);
		List<NoticeReplyVo> voList2 = is.inquiryReply(vo2);
		
		
		model.addAttribute("voList2" ,voList2);
		model.addAttribute("vo" ,voList);
		
		return "board/inquiryDetail";
	}
	
	
}
