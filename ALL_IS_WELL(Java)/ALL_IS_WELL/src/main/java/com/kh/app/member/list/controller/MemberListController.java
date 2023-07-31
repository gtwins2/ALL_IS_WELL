package com.kh.app.member.list.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.app.member.list.service.MemberListService;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("member")
@RequiredArgsConstructor
@Slf4j
public class MemberListController {

	private final MemberListService service;
	
	//직원 목록 조회
	@GetMapping("list")
	public String proceeding(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			Model model, HttpSession session , @RequestParam Map<String , String> paramMap) {
	
//		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
//		/*
//		 * if(loginMember == null) { throw new LoginException(); }
//		 */
//		String no = loginMember.getNo();
//		ProceedingVo vo = new ProceedingVo();
//		vo.setMemberNo(no);
		
		int listCount = service.getBoardCnt();
		int pageLimit = 5;
		int boardLimit = 10;

		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);

		List<MemberVo> voList = service.list(pv, paramMap);

		model.addAttribute("pv" , pv);
		model.addAttribute("voList", voList);
		return "member/list";
	}
	
	//게시글 상세조회			//board/detail
	@GetMapping(value = {"detail/{no}"})
	public String detail(@PathVariable(value = "no" , required = true) String no, Model model) {
		
		MemberVo vo = service.getMemberByNo(no);
		
		model.addAttribute("vo", vo);
		return "member/detail";
	}

	
	//직원 삭제
	@GetMapping({"delete/{no}" , "delete"})
	public String Delete(@PathVariable(value = "no" , required = false) String no, Model model) {
		
		int result = service.delete(no);
		if(result != 1) {
			model.addAttribute("message", "회원 탈퇴 실패");
		}
		model.addAttribute("message", "회원 탈퇴 성공");
		return "redirect:/member/list";
	}
	
}




//@Controller
//@RequestMapping("member")
//public class MemberListController {
//		@GetMapping("list")
//		public String memberList() {
//			return "member/list";
//		}
//	

//}
