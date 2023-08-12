package com.kh.app.main.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.app.admin.vo.AdminVo;
import com.kh.app.approval.service.ApprovalService;
import com.kh.app.approval.vo.ApprovalVo;
import com.kh.app.attendance.service.AttendanceService;
import com.kh.app.attendance.vo.AttendanceVo;
import com.kh.app.board.service.InquiryService;
import com.kh.app.board.service.NoticeService;
import com.kh.app.board.service.SuggestService;
import com.kh.app.board.vo.NoticeVo;
import com.kh.app.main.service.MainService;
import com.kh.app.member.service.MemberService;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.operation.vo.OperationVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.patient.vo.PatientVo;
import com.kh.app.search.vo.SearchVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class Main {
	
	private final MainService ms;
	private final CalendarService calendarService; 
	private final MainService ms2;
	private final NoticeService ns;
	private final SuggestService ss;
	private final InquiryService is;
	private final AttendanceService as2;
	private final ApprovalService as;
	
	@GetMapping("Mmain")
	public String Mmain(ModelAndView mv, HttpServletRequest request, String check,
			Model model, OperationVo vo, @RequestParam Map<String , String> paramMap, HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		String viewpage = "calendar";
		
		List<Calendar> calendar = null;
		List<OperationVo> operation = ms2.operation(loginMember);
		
		PageVo pv = new PageVo(3, 3, 3, 3);
		List<NoticeVo> voList = ns.noticeList(pv, paramMap);
		model.addAttribute("voList" ,voList);
		
		SearchVo svo = new SearchVo();
		svo.setNo(loginMember.getNo());
		List<ApprovalVo> voList2 = as.getApprovalList(pv, svo);
		model.addAttribute("voList2" ,voList2);
		
		String no = loginMember.getNo();
		List<AttendanceVo> voList3 = as2.getAttendanceList(pv, no);
		model.addAttribute("voList3" ,voList3);
		
		try {
			calendar = calendarService.getCalendar(loginMember);
			request.setAttribute("calendarList", calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName(viewpage);
		model.addAttribute("check", check);
		model.addAttribute("operation", operation);
		System.out.println(operation);
		
		return "main/Mmain";
	}
	
	//출근
	@PostMapping("attend")
	public String attend(AttendanceVo vo) {
		
		int result = ms.attend(vo);
		
		if(result != 1) {
			return "error/500page";
		}
		
		
		
		return "main/attend";
	}
	
	//퇴근
	@PostMapping("leave")
	public String leave(AttendanceVo vo) {
		int result = ms.leave(vo);
		
		if(result != 1) {
			return "error/500page";
		}
		
		return "main/leave";
	}
	
	@GetMapping("Amain")
	public String Amain(AdminVo vo, HttpSession session, Model model,ModelAndView mv, HttpServletRequest request) {
		int listCount = ms2.mCount();
		int currentPage = ms2.fCount();
		PageVo pv = new PageVo(listCount, currentPage, 3, 3);
		
		int nine = ms2.nineCount(); 
		int eight = ms2.eightCount(); 
		int seven = ms2.sevenCount(); 
		int six = ms2.sixCount(); 
		int five = ms2.fiveCount(); 
		
		String viewpage = "calendar";
		List<Calendar> calendar = null;
		try {
			calendar = calendarService.getCalendar();
			request.setAttribute("calendarList", calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		
		model.addAttribute("pv", pv);
		model.addAttribute("nine", nine);
		model.addAttribute("eight", eight);
		model.addAttribute("seven", seven);
		model.addAttribute("six", six);
		model.addAttribute("five", five);
		
		System.out.println(five);
		System.out.println(six);
		System.out.println(seven);
		
		return "main/Amain";
	}
	
	
	
}
