package com.kh.app.inventory.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.app.inventory.service.InventoryService;
import com.kh.app.inventory.vo.InventoryVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.service.ProceedingService;
import com.kh.app.proceeding.vo.ProceedingVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("inventory")
@RequiredArgsConstructor
public class InventoryController {
	private final InventoryService service;
	
	//재고 조회
	@GetMapping("list")
	public String proceeding(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			Model model, HttpSession session , @RequestParam Map<String , String> paramMap) {
	
//		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
//		/*
//		 * if(loginMember == null) { throw new LoginException(); }
//		 */
//		String no = loginMember.getNo();
//		if(no != 1) {
//			model.addAttribute("message" , "관리자만 사용할 수 있는 서비스입니다.");
//		}
//		vo.setMemberNo(no);
		
		int listCount = service.getBoardCnt();
		int pageLimit = 5;
		int boardLimit = 10;

		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);

		List<InventoryVo> voList = service.list(pv, paramMap);

		model.addAttribute("pv" , pv);
		model.addAttribute("voList", voList);
		
		return "inventory/list";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("storeList")
	public String storeList() {
		return "inventory/storeList";
	}
}
