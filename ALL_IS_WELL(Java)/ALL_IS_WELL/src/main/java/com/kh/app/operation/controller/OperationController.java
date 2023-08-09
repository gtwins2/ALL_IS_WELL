package com.kh.app.operation.controller;

import java.security.Timestamp;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
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
@Transactional
@Slf4j
public class OperationController {
	private final OperationService service;
	
	//수술실 방 리스트 조회(화면)
	@GetMapping("roomList")
	public String getRoomList(@RequestParam(name="page", required=false, defaultValue="1") int currentPage,  Model model, @RequestParam Map<String, String> paramMap) {
		
		if(paramMap != null) {
		    String searchValue = paramMap.get("searchValue");
		    if(searchValue != null) {
		        if(searchValue.equals("사용중")) {
		            paramMap.put("searchValue", "O");
		        } else if(searchValue.equals("사용가능")) {
		            paramMap.put("searchValue", "X");
		        }
		    }
		}
		
		int listCount = service.getRoomCount(paramMap);
		
		int pageLimit = 5; 
				
		int boardLimit = 6;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		
		
		
		
		List<OperationVo> roomList = service.getRoomList(pv, paramMap);
		
		log.info(roomList.toString());
		
		model.addAttribute("pv", pv);
		model.addAttribute("roomList", roomList);
		
		
		if(paramMap != null) {
		    String searchValue = paramMap.get("searchValue");
		    if(searchValue != null) {
		        if(searchValue.equals("O")) {
		            paramMap.put("searchValue", "사용중");
		        } else if(searchValue.equals("X")) {
		            paramMap.put("searchValue", "사용가능");
		        }
		    }
		}
		
		
		model.addAttribute("paramMap", paramMap);
		
		
		return "surgery/operationRoomList";
	}
	
	
	
	
	//수술 일정 등록(화면)
	@GetMapping("registerOperation")
	public String registerOperation() {
		return "surgery/registerOperationForm";
	}
	
	
	//수술 일정 등록
	@PostMapping("registerOperation")
	public String registerOperation(OperationVo vo) {
		log.info(vo.toString());
		
		//환자 이름 검색해서 번호 가져오기
		String patientNo = service.getPatientNo(vo.getPatientName());
		
		if(patientNo == null) {
			throw new IllegalStateException("그런 환자는 없음...");
		}
		
		vo.setPatientNo(patientNo);
		vo.setStatus("O");
		
		
		
		
		log.info(vo.toString());
		
		int result = service.registerOperation(vo);
		
		String participants = vo.getParticipantNumbers();
		
		String[] participantArr = participants.split(",\\s*");
		
		
		List<Integer> participantList = Arrays.stream(participantArr)
                .map(Integer::valueOf)
                .collect(Collectors.toList());

		//수술 인원 등록
		int participantResult = service.registerParticipants(participantList);
		
		
		
		log.info("result : {}" , result);
		
		if(result == 0) {
			throw new IllegalStateException("수술 일정 등록 실패....");
		}
		
		if(participantResult == 0) {
			throw new IllegalStateException("수술 인원 등록 실패...");
		}
		
		int roomResult = service.updateRoom(vo);
		
		
		return "redirect:/operation/roomList";
		
		
	}
	
	//수술 일정 목록 조회
	@GetMapping("scheduleList")
	public String getScheduleList(@RequestParam(name="page", required=false, defaultValue="1") int currentPage, Model model, @RequestParam Map<String, String> paramMap) {
		int listCount = service.getScheduleListCount(paramMap);
		
		int pageLimit = 5; 
				
		int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<OperationVo> scheduleList = service.getScheduleList(pv, paramMap);
		
		log.info(scheduleList.toString());
		
		
		model.addAttribute("pv", pv);
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("paramMap", paramMap);
		
		
		
		return "surgery/operationScheduleList";
	}
	
	
	
	
	
	
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
	
	
	//수술 일정 상세 조회(화면)
	@GetMapping("operationDetail")
	public String goOperationDetail(String operationNo, Model model) {
		//수술 일정 데이터 가져오기
		OperationVo schedule = service.goOperationDetail(operationNo);
		
		log.info(schedule.toString());
		
		//수술 참여인원이 몇명인지 세기
		int count = service.countParticipants(operationNo);
		
		//수술 참여인원 가져오기
		List<Integer> participants = service.selectParticipants(schedule.getOperationNo());
		
		
		log.info(participants.toString());
		
		//수술 번호에 따른 이름과 직급 가져오기
		List<MemberVo> voList = service.getParticipantNames(participants);

		log.info(voList.toString());
		
		
		
		
		List<String> namesAndPositions = new ArrayList<>();
		
		for(int i = 0; i < voList.size(); i++) {
			String nameAndPosition = voList.get(i).getName()+"("+voList.get(i).getPositionName()+")";
			
			namesAndPositions.add(nameAndPosition);
		}
		
		String namesAndPositionsString = String.join("\n", namesAndPositions);
		
		log.info(namesAndPositions.toString());
		
		if(schedule == null) {
			throw new IllegalStateException("수술 일정 상세 조회 실패....");
		}
		
		model.addAttribute("schedule", schedule);
		model.addAttribute("namesAndPositionsString", namesAndPositionsString);
		
		return "surgery/operationDateDetailForm";
	}
	
	
	//수술 일정 상세 조회
	@PostMapping("operationDetail")
	public String updateOperationDetail(OperationVo vo) {
		
		
		//수술 일정 종료 시간 업데이트
		//수술 일정 상태를 X로 종료
		vo.setStatus("X");
		
		log.info(vo.toString());
		
		int result = service.updateOperationDetail(vo);
		
		
		
		System.out.println(result);
		
		
		//수술실 상태를 사용가능으로 
		int roomResult = service.updateRoomStatus(vo.getOperatingRoomNo());
		
		
		System.out.println("roomResult : "+roomResult);
		
		
		return "redirect:/operation/scheduleList";
	}
	
	//모든 멤버 가져오기
	@GetMapping("getAllMembers")
	@ResponseBody
	public List<MemberVo> getMemberList() {
		List<MemberVo> voList = service.getMemberList();
		
		log.info("전체 회원 조회 -> 수술 : "+voList);
		
		if(voList == null) {
			throw new IllegalStateException("전체 회원 가져오기 실패");
		}
		
		return voList;
	}
	
	
}
