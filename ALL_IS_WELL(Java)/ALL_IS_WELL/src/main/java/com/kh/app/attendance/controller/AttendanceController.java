package com.kh.app.attendance.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.app.attendance.service.AttendanceService;
import com.kh.app.attendance.vo.AttendanceVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("attendance")
@RequiredArgsConstructor
public class AttendanceController {

	private final AttendanceService as;
	
//	//근태기록 목록(직원)
//	@GetMapping("list")
//	public void attendanceList(AttendanceVo vo, Model model) {
//		
////		String no = loginMember.get(no);
//		
////		vo.setMemberNo(no);
//		
//		int listCount = as.getAttendanceListCnt();
//		int currentPage = 1;
//		int pageLimit = 5;
//		int boardLimit = 10;
//		
//		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
//		
//		List<AttendanceVo> voList = as.getAttendanceList(vo);
//		
////		model.addAttribute("loginMember", loginMember);
//		model.addAttribute("voList", voList);
//		
//	}
	
	//근태기록 조회(관리자)
	@GetMapping("admin/list")
	public void adminAttendanceList(AttendanceVo vo, Model model) {
						
		int listCount = as.getAdminAttendanceListCnt();
		int currentPage = 1;
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);

		//리스트 조회
		List<AttendanceVo> voList = as.getAttendanceListAdmin(vo, pv);
		
		model.addAttribute("voList",voList);
		model.addAttribute("pv", pv);
		
	}
	
}



















































