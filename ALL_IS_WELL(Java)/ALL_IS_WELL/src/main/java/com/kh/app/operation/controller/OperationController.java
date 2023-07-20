package com.kh.app.operation.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.app.member.vo.MemberVo;
import com.kh.app.operation.service.OperationService;
import com.kh.app.operation.vo.OperationVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("operation")
@Slf4j
public class OperationController {
	private final OperationService service;
	
	//수술실 방 리스트 조회(화면)
	@GetMapping("roomList")
	public String getRoomList(@RequestParam(name="page", required=false, defaultValue="1") int currentPage, Model model) {
		
		int listCount = service.getRoomCount();
		
		int pageLimit = 5; 
				
		int boardLimit = 6;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<OperationVo> roomList = service.getRoomList(pv);
		
		model.addAttribute("roomList", roomList);
		
		return "surgery/operationRoomList";
	}
	
	
	
	
	//수술 일정 등록(화면)
	@GetMapping("registerOperation")
	public String registerOperation() {
		return "surgery/registerOperationForm";
	}
	
	
	//수술 일정 등록
	@PostMapping("registerOperation")
	public void registerOperation(OperationVo vo) {
		//데이터꺼내기
		//데이터뭉치기
		//
	}
	
	//수술 일정 목록 조회
	
	
	//수술 인원 이름 검색
	@GetMapping("searchMember")
	@ResponseBody
	public List<MemberVo> searchName(String name) throws Exception {
		
		
		List<MemberVo> voList = service.searchName(name);
		
		
		if(voList == null) {
			throw new Exception("수술 멤버 검색 실패");
		}
		
		log.info(voList.toString());
		
		
		return voList; 
	}
	
	
}
