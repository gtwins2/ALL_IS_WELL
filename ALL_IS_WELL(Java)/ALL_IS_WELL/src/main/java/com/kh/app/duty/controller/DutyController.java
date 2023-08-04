package com.kh.app.duty.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.kh.app.duty.service.DutyService;
import com.kh.app.duty.vo.DutyVo;
import com.kh.app.member.list.service.MemberListService;
import com.kh.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("duty")
@RequiredArgsConstructor
@Slf4j
public class DutyController {

	private final DutyService service;
	
//	//회의록 목록 조회
//	@GetMapping("list")
//	public String proceeding() {
//		return "proceeding/list";
//	}
//	
//	//회의록 상세 조회
//	@GetMapping("detail")
//	public String proceedingDetail() {
//		return "proceeding/detail";
//	}
	
	//당직 지정
	@GetMapping("select")
	public void duty() {
		
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
        vo.setStart(start);
		
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
		List<DutyVo> voList = service.list();

		model.addAttribute("voList", voList);
		
		return "duty/putScreen";
	}
	
	@PostMapping("put")
	public String put(Model model , DutyVo vo) {
		int result = service.put(vo);

		

		return "redirect:/duty/select";
		
	}
}
