package com.kh.app.proceeding.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.service.ProceedingService;
import com.kh.app.proceeding.vo.ProceedingVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("proceeding")
public class ProceedingController {

	private final ProceedingService service;
	
	//회의록 목록 조회
	@GetMapping("list")
	public String proceeding(int p , Model model) {
		
		int listCount = service.getBoardCnt();
		int currentPage = p;
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount , currentPage , pageLimit , boardLimit);
		
		List<ProceedingVo> voList = service.list(pv);
		model.addAttribute("voList" , voList);
		
		
		return "proceeding/list";
	}
	
	//회의록 상세 조회
	@GetMapping("detail")
	public String proceedingDetail() {
		return "proceeding/detail";
	}
	
	//회의록 작성
	@GetMapping("write")
	public String proceedingWrite() {
		return "proceeding/write";
	}
	
}
