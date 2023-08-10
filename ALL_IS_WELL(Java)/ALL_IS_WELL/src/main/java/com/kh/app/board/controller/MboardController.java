package com.kh.app.board.controller;

import java.util.List;
import java.util.Map;

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
import com.kh.app.search.vo.SearchVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("Mboard")
@RequiredArgsConstructor
public class MboardController {

	private final NoticeService ns;
	private final SuggestService ss;
	private final InquiryService is;
	
	//���ǻ��� ���(����)
	@GetMapping("suggestList")
	public String suggestList(@RequestParam(name="page", required=false, defaultValue="1") 
	int currentPage, Model model, HttpSession session,SuggestVo vo
	,@RequestParam Map<String , String> paramMap) {
		
		SearchVo svo = new SearchVo();
	    svo.setSearchType(paramMap.get("searchType"));
	    svo.setSearchValue(paramMap.get("searchValue"));
	    
		int listCount = ss.getListCnt(paramMap);
	    int pageLimit = 5;
	    int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<SuggestVo> voList = ss.suggestList(pv, paramMap);
		model.addAttribute("pv", pv);
		model.addAttribute("voList" ,voList);
		
		System.out.println(listCount);
		return "board/member/suggestList";
	}
	
	//���ǻ��� ��������(�����ȸ)
	@GetMapping("suggestDetail")
	public String suggestDetail(SuggestVo vo ,Model model) {
		SuggestVo voList = ss.suggestDetail(vo);
		
		
		model.addAttribute("vo" ,voList);
		
		return "board/member/suggestDetail";
	}
	
	
	//���ǻ��� �ۼ��ϱ�
	@GetMapping("suggestWrite")
	public String suggestWrite() {
		return "board/member/suggestWrite";
	}
	
	@PostMapping("suggestWrite")
	public String suggestWrite(SuggestVo vo) {
		
		int result = ss.suggestWrite(vo);
		
		return "redirect:/Mboard/suggestList";
	}
	
	@GetMapping("suggestUpdate")
	public String suggestUpdate(SuggestVo vo, Model model) {

		SuggestVo voList = ss.suggestDetail(vo);
		model.addAttribute("vo" ,voList);
		return "board/member/suggestUpdate";
	}
	
	@PostMapping("suggestUpdate")
	public String suggestUpdate(SuggestVo vo) {
		
		int result = ss.suggestUpdate(vo);
		
		return "redirect:/Mboard/suggestList";
	}
	
	
	//���ǻ��� ���
	@GetMapping("inquiryList")
	public String inquiryList(@RequestParam(name="page", required=false, defaultValue="1") 
	int currentPage, Model model, HttpSession session,InquiryVo vo
	,@RequestParam Map<String , String> paramMap) {
		
		SearchVo svo = new SearchVo();
	    svo.setSearchType(paramMap.get("searchType"));
	    svo.setSearchValue(paramMap.get("searchValue"));
		
		int listCount = is.getListCnt(paramMap);
	    int pageLimit = 5;
	    int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<InquiryVo> voList = is.inquiryList(pv, paramMap);
		model.addAttribute("pv", pv);
		model.addAttribute("voList" ,voList);
		model.addAttribute("svo", svo);
		
		return "board/member/inquiryList";
	}
	
	//���ǻ��� �ۼ�
	@GetMapping("inquiryWrite")
	public String inquiryWrite() {
		
		
		return "board/member/inquiryWrite";
	}
	
	@PostMapping("inquiryWrite")
	public String inquiryWrite(InquiryVo vo) {
		
		int result = is.inquiryWrite(vo);
		
		return "redirect:/Mboard/inquiryList";
	}
	
	//���ǻ��� ��������(�����ȸ)
	@GetMapping("inquiryDetail")
	public String inquiryDetail(InquiryVo vo, Model model, NoticeReplyVo vo2) {
		
		InquiryVo voList = is.inquiryDetail(vo);
		List<InquiryVo> voList2 = is.inquiryReply(vo2);
		
		
		model.addAttribute("voList2" ,voList2);
		model.addAttribute("vo" ,voList);
		return "board/member/inquiryDetail";
	}
	
	@PostMapping("inquiryDetail")
	public String inquiryDetail(InquiryVo vo) {
		int result = is.replyWrite(vo);
		String no = vo.getInquiryNo();
		return "redirect:/Mboard/inquiryDetail?no="+ no;
	}
	
	@GetMapping("inquiryUpdate")
	public String inquiryUpdate(InquiryVo vo, Model model) {
		
		InquiryVo voList = is.inquiryDetail(vo);
		model.addAttribute("vo" ,voList);
		return "board/member/inquiryUpdate";
	}
	
	@PostMapping("inquiryUpdate")
	public String inquiryUpdate(InquiryVo vo) {
		
		int result = is.inquiryUpdate(vo);
		
		return "redirect:/Mboard/inquiryList";
	}
	
	
	//�������׸��
	@GetMapping("noticeList")
	public String noticeList(@RequestParam(name="page", required=false, defaultValue="1") 
	int currentPage, Model model, HttpSession session, NoticeVo vo
	,@RequestParam Map<String , String> paramMap) {
		SearchVo svo = new SearchVo();
	    svo.setSearchType(paramMap.get("searchType"));
	    svo.setSearchValue(paramMap.get("searchValue"));
	    
		int listCount = ns.getNoticeListCnt(paramMap);
	    int pageLimit = 5;
	    int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<NoticeVo> voList = ns.noticeList(pv, paramMap);
		model.addAttribute("pv", pv);
		model.addAttribute("voList" ,voList);
		return "board/member/noticeList";
	}

	//�������� ��������
	@GetMapping("noticeDetail")
	public String noticeDetail(NoticeVo vo, Model model, NoticeReplyVo vo2) {
		NoticeVo voList = ns.noticeDetail(vo);
		List<NoticeReplyVo> voList2 = ns.noticeReply(vo2);
		
		
		model.addAttribute("voList2" ,voList2);
		model.addAttribute("vo" ,voList);
		return "board/member/noticeDetail";
	}
	
	@PostMapping("noticeDetail")
	public String noticeDetail(NoticeReplyVo vo) {
		int result = ns.replyWrite(vo);
		String no = vo.getNoticeNo();
		return "redirect:/Mboard/noticeDetail?no="+ no;
	}
	
	@PostMapping("noticeReplyDelete")
	public String noticeReplyDelete(NoticeReplyVo vo) {
		int result = ns.noticeReplyDelete(vo);
		String no = vo.getNoticeNo();
		return "redirect:/Mboard/noticeDetail?no="+ no;
	}
	
	@GetMapping("noticeReplyUpdate")
	public String noticeReplyUpdate(String no, String content, String noticeNo, Model model) {
		model.addAttribute("no",no);
		model.addAttribute("content",content);
		model.addAttribute("noticeNo",noticeNo);
		return "board/member/noticeReplyUpdate";
	}
	
	@PostMapping("noticeReplyUpdate")
	public String noticeReplyUpdate(NoticeReplyVo vo) {
		int result = ns.noticeReplyUpdate(vo);
		String no = vo.getNoticeNo();
		
		return "redirect:/Mboard/noticeDetail?no="+ no;
	}
}
