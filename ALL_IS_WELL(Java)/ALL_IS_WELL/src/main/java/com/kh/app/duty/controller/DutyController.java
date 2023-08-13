package com.kh.app.duty.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.kh.app.duty.service.DutyService;
import com.kh.app.duty.vo.DutyVo;
import com.kh.app.main.controller.CalendarService;
import com.kh.app.main.service.MainService;
import com.kh.app.member.list.service.MemberListService;
import com.kh.app.member.service.MemberService;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.vo.ProceedingVo;
import com.kh.app.search.vo.SearchVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("duty")
@RequiredArgsConstructor
@Slf4j
public class DutyController {

	private final DutyService service;
	private final CalendarService calendarService; 
	private final MemberService ms;
	private final MainService ms2;
	
	//당직 상세 조회
	@GetMapping(value = {"detail/{no}"})
	public String detail(@PathVariable(value = "no" , required = true) String no, Model model) {
		
		DutyVo vo = service.getDutyByNo(no);
		
		model.addAttribute("vo", vo);
		return "duty/detail";
	}
	
	//당직 지정
	@GetMapping("select")
	public String duty(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage, ModelAndView mv, HttpServletRequest request,
			Model model, HttpSession session , @RequestParam Map<String , String> paramMap) {
		
		 SearchVo svo = new SearchVo();
	      svo.setSearchType(paramMap.get("searchType"));
	      svo.setSearchValue(paramMap.get("searchValue"));
	      
	      int listCount = service.getBoardCnt(paramMap);
	      int pageLimit = 5;
	      int boardLimit = 10;

	      PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		 List<DutyVo> voList = service.list(pv, paramMap);
		 
		 
        String viewpage = "calendar";
        List<Calendar> calendar = null;
        try {
           calendar = calendarService.getCalendar();
           request.setAttribute("calendarList", calendar);
        } catch (Exception e) {
           e.printStackTrace();
        }
        mv.setViewName(viewpage);
        
        System.out.println(listCount);
        
		model.addAttribute("voList", voList);
		model.addAttribute("pv" , pv);
		model.addAttribute("svo" , svo);
		
		return "duty/select";
	}

	@GetMapping("admin/select")
	public String dutyAdmin(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage, ModelAndView mv, HttpServletRequest request,
			Model model, HttpSession session , @RequestParam Map<String , String> paramMap) {
		
		SearchVo svo = new SearchVo();
		svo.setSearchType(paramMap.get("searchType"));
		svo.setSearchValue(paramMap.get("searchValue"));
		
		int listCount = service.getBoardCnt(paramMap);
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<DutyVo> voList = service.list(pv, paramMap);
		
		
		String viewpage = "calendar";
		List<Calendar> calendar = null;
		try {
			calendar = calendarService.getCalendar();
			request.setAttribute("calendarList", calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		
		System.out.println(listCount);
		
		model.addAttribute("voList", voList);
		model.addAttribute("pv" , pv);
		model.addAttribute("svo" , svo);
		
		return "duty/admin/select";
	}
	
	@PostMapping("select")
	public String dutySelect(MemberVo vo,ModelAndView mv, HttpServletRequest request, HttpSession session , @RequestParam("params") String params , Model model) {
		
		MemberVo loginMember = ms.login(vo);
		session.setAttribute("loginMember", loginMember);
		
		String viewpage = "calendar";
		List<Calendar> calendar = null;
		try {
			calendar = calendarService.getCalendar(loginMember);
			request.setAttribute("calendarList", calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		
		if(loginMember == null) {
			return "redirect:/member/login";
			
		}
		int result = service.select(vo);
		
		if(result != 1) {
			model.addAttribute("message" , "duty select error");
			return "error/errorPage";
		}
		return "duty/select";
		
	}
	
	@GetMapping("put")
	public String putScreen(Model model) {
		
		List<MemberVo> voList = service.getMemberList();
		model.addAttribute("voList", voList);
		
		return "duty/putScreen";
	}
	
	@PostMapping("put")
	public String put(Model model , DutyVo vo) {
		System.out.println(vo);
		int result = service.put(vo);
		
		if(result != 1) {
			return "error/errorPage";
		}

		return "redirect:/duty/select";
		
	}
	
	@PostMapping({"edit/{no}"})
	public String edit2(@PathVariable(value = "no" , required = true) String no, Model model, DutyVo vo) {
		int result = service.edit2(vo);
		
		model.addAttribute("vo" , vo);
		return "redirect:/duty/detail/" + no;
	}
	
	
}
