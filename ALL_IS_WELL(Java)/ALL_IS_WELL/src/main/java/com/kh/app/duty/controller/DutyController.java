package com.kh.app.duty.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

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

import com.google.gson.JsonArray;
import com.kh.app.duty.service.DutyService;
import com.kh.app.duty.vo.DutyVo;
import com.kh.app.member.list.service.MemberListService;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.vo.ProceedingVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("duty")
@RequiredArgsConstructor
@Slf4j
public class DutyController {

	private final DutyService service;
	
	//당직 상세 조회
	@GetMapping(value = {"detail/{no}"})
	public String detail(@PathVariable(value = "no" , required = true) String no, Model model) {
		
		/*
		 * HttpSession session = req.getSession(); MemberVo loginMember = (MemberVo)
		 * session.getAttribute("loginMember");
		 */
		
		DutyVo vo = service.getDutyByNo(no);
		
		model.addAttribute("vo", vo);
		return "duty/detail";
	}
	
	//당직 지정
	@GetMapping("select")
	public String duty(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			Model model, HttpSession session , @RequestParam Map<String , String> paramMap) {
		int listCount = service.getBoardCnt();
		int pageLimit = 5;
		int boardLimit = 10;

		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);

		List<DutyVo> voList = service.list(pv, paramMap);

		model.addAttribute("pv" , pv);
		model.addAttribute("voList", voList);
		
		return "duty/select";
	}
	
	@PostMapping("select")
	public String dutySelect(DutyVo vo , @RequestParam("params") String params , Model model) {
		
		// 전송받은 파라미터 파싱
        JSONParser parser = new JSONParser(params);
        JsonArray jsonArray = null;
		try {
			jsonArray = (JsonArray)parser.parse();
		} catch (ParseException e) {
			e.printStackTrace();
		}

        // 파라미터에서 값을 추출
        String title = jsonArray.get(0).toString();
        String start = jsonArray.get(1).toString();
        
        vo.setTitle(title);
        vo.setDutyDay(start);
		
		log.info(vo + "");
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
		int result = service.put(vo);
		
		if(result != 1) {
			return "error/errorPage";
		}

		return "redirect:/duty/select";
		
	}
	
	@PostMapping({"edit/{no}"})
	public String edit2(@PathVariable(value = "no" , required = true) String no, Model model, DutyVo vo) {
		vo.setNo(no);
		int result = service.edit2(vo);
		
		model.addAttribute("vo" , vo);
		return "redirect:/duty/detail/" + no;
	}
	
	
}
