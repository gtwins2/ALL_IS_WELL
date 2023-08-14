package com.kh.app.attendance.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.app.attendance.service.AttendanceService;
import com.kh.app.attendance.vo.AttendanceVo;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.search.vo.SearchVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("attendance")
@RequiredArgsConstructor
public class AttendanceController {

	private final AttendanceService as;
	
	//근태기록 목록(직원)
	@GetMapping("list")
	public void memberAttendanceList(@RequestParam(name="page", required=false, defaultValue="1") int currentPage, Model model, HttpSession session) {		
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		int listCount = as.getAttendanceListCnt(no);
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount-1, currentPage, pageLimit, boardLimit);
		
		AttendanceVo fvo = as.getPresentAttendance(no);
		
		
		List<AttendanceVo> voList = as.getAttendanceList(pv, no);
		
//		model.addAttribute("loginMember", loginMember);
		model.addAttribute("pv", pv);
		model.addAttribute("fvo", fvo);
		model.addAttribute("voList", voList);
		
	}
	
	//근태기록 조회(관리자)
	@GetMapping("admin/list")
	public void adminAttendanceList(@RequestParam(name="page", required=false, defaultValue="1") int currentPage, Model model
			, @RequestParam Map<String , String> paramMap) {
		
		SearchVo svo = new SearchVo();
		svo.setSearchType(paramMap.get("searchType"));
		svo.setSearchValue(paramMap.get("searchValue"));
		
		int listCount = as.getAdminAttendanceListCnt(paramMap);
		int pageLimit = 5;
		int boardLimit = 10;
				
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);

		//리스트 조회
		List<AttendanceVo> voList = as.getAttendanceListAdmin(pv, paramMap);
		model.addAttribute("voList",voList);
		model.addAttribute("pv", pv);
		model.addAttribute("svo", svo);
		
	}
	
}



















































