package com.kh.app.operation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.operation.vo.OperationVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("operation")
public class OperationController {
	//수술실 방 조회(화면)
	@GetMapping("roomList")
	public String getRoomList() {
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
	
	//수술 인원 이름 검색
	public void searchName(String searchName) {
		
	}
}
