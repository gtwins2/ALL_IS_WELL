package com.kh.app.proceeding.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.pool.AllConstPool;
import com.kh.app.proceeding.service.ProceedingService;
import com.kh.app.proceeding.vo.ProceedingVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("proceeding")
@RequiredArgsConstructor
@Slf4j
public class ProceedingController {

	private final ProceedingService service;
	
	//회의록 목록 조회
	@GetMapping("list")
	public String proceeding(Model model) {
	
		int listCount = service.getBoardCnt();
		int currentPage = 1;
		int pageLimit = AllConstPool.PAGE_LIMIT;
		int boardLimit = AllConstPool.BOARD_LIMIT;
		
		PageVo pv = new PageVo(listCount , currentPage , pageLimit , boardLimit);
		
		
		List<ProceedingVo> voList  = service.list(pv);
		model.addAttribute("voList", voList);
		
		
		return "proceeding/list";
	}
	
	//회의록 상세 조회
	@GetMapping("detail")
	public String proceedingDetail() {
		return "proceeding/detail";
	}
	
	//게시글 작성(화면)
	@GetMapping("write")
	public String write() {
		return "proceeding/write";
	}
	
	//게시글 작성(결과 처리)
	@PostMapping("write")
	public String write(ProceedingVo vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if(loginMember == null) {
			return "redirect:/error/errorPage";
		}
		
		vo.setMemberNo(loginMember.getNo());
		log.info(loginMember.getNo());
		int result = service.write(vo);
		if(result != 1) {
			return "redirect:/error/errorPage";
		}
		return "redirect:/app/proceeding/list";
		
	}
	
}
