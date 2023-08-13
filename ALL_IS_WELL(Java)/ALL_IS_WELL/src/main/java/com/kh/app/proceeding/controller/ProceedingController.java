package com.kh.app.proceeding.controller;

import java.net.http.HttpRequest;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.app.approval.vo.ApprovalVo;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.pool.AllConstPool;
import com.kh.app.proceeding.dao.ProceedingDao;
import com.kh.app.proceeding.service.ProceedingService;
import com.kh.app.proceeding.vo.ProceedingVo;
import com.kh.app.search.vo.SearchVo;

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
	public String proceeding(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			Model model, HttpSession session , @RequestParam Map<String , String> paramMap) {
	
		  SearchVo svo = new SearchVo();
	      svo.setSearchType(paramMap.get("searchType"));
	      svo.setSearchValue(paramMap.get("searchValue"));
	      
	      int listCount = service.getBoardCnt(paramMap);
	      int pageLimit = 5;
	      int boardLimit = 10;

	      PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);

		List<ProceedingVo> voList = service.list(pv, paramMap);

		model.addAttribute("pv" , pv);
		model.addAttribute("voList", voList);
		model.addAttribute("svo" , svo);
		
		return "proceeding/list";
	}
	@GetMapping("admin/list")
	public String proceedingAdmin(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			Model model, HttpSession session , @RequestParam Map<String , String> paramMap) {
		
		  SearchVo svo = new SearchVo();
	      svo.setSearchType(paramMap.get("searchType"));
	      svo.setSearchValue(paramMap.get("searchValue"));
	      
	      int listCount = service.getBoardCnt(paramMap);
	      int pageLimit = 5;
	      int boardLimit = 10;

	      PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<ProceedingVo> voList = service.list(pv, paramMap);
		
		model.addAttribute("pv" , pv);
		model.addAttribute("voList", voList);
		model.addAttribute("svo" , svo);
		
		return "proceeding/admin/list";
	}
	
	@GetMapping(value = {"admin/detail/{no}"})
	public String detail2(@PathVariable(value = "no" , required = true) String no, Model model) {
		
		/*
		 * HttpSession session = req.getSession(); MemberVo loginMember = (MemberVo)
		 * session.getAttribute("loginMember");
		 */
		
		ProceedingVo vo = service.getProceedingByNo(no);
		
		model.addAttribute("vo", vo);
		return "proceeding/admin/detail";
	}
	
	@GetMapping("admin/write")
	public String write2() {
		return "proceeding/admin/write";
	}
	
	//회의록 상세조회
		@GetMapping(value = {"detail/{no}"})
		public String detail(@PathVariable(value = "no" , required = true) String no, Model model) {
			
			/*
			 * HttpSession session = req.getSession(); MemberVo loginMember = (MemberVo)
			 * session.getAttribute("loginMember");
			 */
			
			ProceedingVo vo = service.getProceedingByNo(no);
			
			model.addAttribute("vo", vo);
			return "proceeding/detail";
		}
	
	//게시글 작성(화면)
	@GetMapping("write")
	public String write() {
		return "proceeding/write";
	}
	
	//게시글 작성(결과 처리)
	@PostMapping("write")
	public String write(ProceedingVo vo, HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if(loginMember == null) {
			return "redirect:/error/errorPage";
		}
		
		vo.setMemberNo(loginMember.getNo());
		int result = service.write(vo);
		if(result != 1) {
			model.addAttribute("message", "회의록 작성 실패");
			return "redirect:/error/errorPage";
		}
		model.addAttribute("message", "회의록 작성 성공");
		return "redirect:/proceeding/list";
		
	}
	
	//게시글 삭제 처리
	@GetMapping({"delete/{no}"})
	public String delete(@PathVariable(value = "no" , required = true) String no, Model model) {
		
		int result = service.delete(no);
		if(result != 1) {
			model.addAttribute("message", "회의록 삭제 실패");
		}
		model.addAttribute("message", "회의록 삭제 성공");
		return "redirect:/proceeding/list";
	}
	@GetMapping({"admin/delete/{no}"})
	public String delete2(@PathVariable(value = "no" , required = true) String no, Model model) {
		
		int result = service.delete(no);
		if(result != 1) {
			model.addAttribute("message", "회의록 삭제 실패");
		}
		model.addAttribute("message", "회의록 삭제 성공");
		return "redirect:/proceeding/admin/list";
	}
	
	//게시글 수정 화면
	@GetMapping({"edit/{no}"})
	public String edit(@PathVariable(value = "no" , required = true) String no, Model model) {
		ProceedingVo vo = service.getProceedingByNo(no);
		model.addAttribute("vo", vo);
		
		return "proceeding/edit";
	}
	@GetMapping({"admin/edit/{no}"})
	public String edit2(@PathVariable(value = "no" , required = true) String no, Model model) {
		ProceedingVo vo = service.getProceedingByNo(no);
		model.addAttribute("vo", vo);
		
		return "proceeding/admin/edit";
	}
	
	//게시글 수정 처리
	@PostMapping("edit/{no}")
	public String edit2(@PathVariable(value = "no" , required = true) String no, Model model, ProceedingVo vo) {

		int result = service.edit(vo);
		log.info(result + "");
		if(result != 1) {
			model.addAttribute("message", "회의록 수정 실패");
			return "redirect:/error/errorPage";
		}
		model.addAttribute("message", "회의록 수정 성공");
		return "redirect:/proceeding/list";
		
	}
    }
	
	/*
	 * //게시글 수정 화면
	 * 
	 * @PostMapping({"edit/{no}"}) public String edit2(@PathVariable(value = "no" ,
	 * required = true) String no, Model model) { ProceedingVo vo =
	 * service.edit(no); model.addAttribute("vo", vo);
	 * 
	 * return "proceeding/edit"; }
	 */
