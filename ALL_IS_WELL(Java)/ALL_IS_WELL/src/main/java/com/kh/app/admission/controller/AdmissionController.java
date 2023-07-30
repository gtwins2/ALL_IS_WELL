package com.kh.app.admission.controller;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.app.admission.service.AdmissionService;
import com.kh.app.admission.vo.AdmissionVo;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.patient.vo.PatientVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("admission")
@Transactional
@Slf4j
public class AdmissionController {
	
	private final AdmissionService service;
	
	//입원실 방 리스트(화면)
	@GetMapping("roomList")
	public String getRoomList(@RequestParam(name="page", required=false, defaultValue="1") int currentPage, Model model,  @RequestParam Map<String, String> paramMap) {
		int listCount = service.getRoomCount(paramMap);
		
		int pageLimit = 5; 
				
		int boardLimit = 6;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		//입원실 위치와 방번호, 최대수용인원 가져오기
		List<AdmissionVo> roomList = service.getRoomList(pv, paramMap);
		
		 List<AdmissionVo> numberOfPatients = service.getNumberOfPatients();

	    //입원실에 따른 환자수 세팅하기
	    for (AdmissionVo room : roomList) {
	        String roomNumber = room.getNo();

	        for (AdmissionVo admissionVo : numberOfPatients) {
	            if (admissionVo.getNo().equals(roomNumber)) {
	                room.setNumberOfPatients(admissionVo.getNumberOfPatients());
	                break;
	            }
	        }
	    }
		 
		 log.info(roomList.toString());
		 
		 
		model.addAttribute("pv", pv);
		model.addAttribute("roomList", roomList);
		model.addAttribute("paramMap", paramMap);
		
		
		return "admission/admissionRoomList";
	}
	
	//환자 이름 검색(ajax)
	@GetMapping("searchPatient")
	@ResponseBody
	public List<PatientVo> searchPatient(String name) {
		List<PatientVo> patientList = service.searchPatient(name);
		
		log.info(patientList.toString());
		
		if(patientList == null) {
			throw new IllegalStateException("그런 환자는 없음");
		}
		
		return patientList;
	}
	
	
	//입원 기록 목록(화면)
	@GetMapping("admissionRecord")
	public String registerAdmission(@RequestParam(name="page", required=false, defaultValue="1") int currentPage, Model model, @RequestParam Map<String, String> paramMap) {
		int listCount = service.getScheduleCount(paramMap);
		
		int pageLimit = 5; 
				
		int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		//입원실 위치와 방번호, 최대수용인원 가져오기
		List<AdmissionVo> scheduleList = service.getScheduleList(pv, paramMap);
		
		
		 log.info(scheduleList.toString());
		 
		 
		model.addAttribute("pv", pv);
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("paramMap", paramMap);
		
		return "admission/admissionListForm";
	}
	
	//입원 환자 기록 상세(화면)
	@GetMapping("admissionDetail")
	public String goDetailAdmissionRecord(String admissionRecordNo, Model model) {
		
		//입원기록 상세조회 가져오기
		AdmissionVo vo = service.goDetailAdmissionRecord(admissionRecordNo);
		
		
		log.info("입원기록 상세조회 "+vo.toString());
		
		model.addAttribute("vo", vo);
		
		
		return "admission/admissionDetailForm";
	}
	
	@PostMapping("admissionDetail")
	public String goDetailAdmissionRecord(AdmissionVo vo) {
		log.info("날짜가 잘 담겼는지 : "+vo.toString());
		
		int result = service.updateAdmissionRecord(vo);
		
		if(result != 1) {
			throw new IllegalArgumentException("입원기록 업데이트 실패");
		}
		
		return "redirect:/admission/admissionRecord";
	}
	
	
	
	//입원 환자 등록(화면)
	@GetMapping("registerPatient")
	public String registerPatient() {
		return "admission/registerPatient";
	}
	
	
	//입원 환자 등록
	@PostMapping("registerPatient")
	public String registerPatient(AdmissionVo vo) {
		log.info(vo.toString());
		
		//환자 등록하기
		int result = service.registerPatient(vo);
		
		//방번호에 따른 입원실 명단 업데이트
		int listResult = service.insertInpatientList(vo);
		
		if(result != 1 && listResult != 1) {
			throw new IllegalStateException("입원실 환자 등록 실패");
		}
		
		return "redirect:/admission/roomList";
	}
}
