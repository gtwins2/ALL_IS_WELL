package com.kh.app.inventory.controller;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.app.approval.dao.ApprovalDao;
import com.kh.app.approval.vo.ApprovalBtnVo;
import com.kh.app.inventory.service.InventoryService;
import com.kh.app.inventory.vo.InventoryVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.service.ProceedingService;
import com.kh.app.proceeding.vo.ProceedingVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import retrofit2.http.GET;

@Controller
@RequestMapping("inventory")
@RequiredArgsConstructor
@Slf4j
public class InventoryController {
	private final InventoryService service;
	
	//재고 조회
	@GetMapping("list")
	public String inventory(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
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
	
	//재고 입고 조회
	@GetMapping("storeList")
	public String storeList(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			Model model, HttpSession session , @RequestParam Map<String , String> paramMap) {
		int listCount = service.getBoardCnt();
		int pageLimit = 5;
		int boardLimit = 10;

		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);

		List<InventoryVo> voList = service.storeList(pv, paramMap);

		model.addAttribute("pv" , pv);
		model.addAttribute("voList", voList);
		
		return "inventory/storeList";
	}
	
	
	//재고 수정 화면(재고 입고 조회 가능하고 전체 재고 갯수도 더해지게)
	@GetMapping("insert")
	public String insert(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			Model model, HttpSession session) {
		
//		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
//		/*
//		 * if(loginMember == null) { throw new LoginException(); }
//		 */
//		String no = loginMember.getNo();
//		if(no != 1) {
//			model.addAttribute("message" , "관리자만 사용할 수 있는 서비스입니다.");
//		}
//		vo.setMemberNo(no);
		
		
		List<InventoryVo> voList = service.getItemName();
		
		model.addAttribute("voList", voList);
		
		
		return "inventory/insert";
	}
	
	
	
	//재고 입고 등록 처리(재고 입고 조회 가능하고 전체 재고 갯수도 더해지게)
	@PostMapping("insert")
	public String postInsert(InventoryVo vo) {
	
		int result = service.postInsert(vo);
		log.info(vo + "");
		log.info(result + "");
		if(result != 1 ) {
			return "error/errorPage";
		}
		return "redirect:/inventory/list";
		
	}
}
