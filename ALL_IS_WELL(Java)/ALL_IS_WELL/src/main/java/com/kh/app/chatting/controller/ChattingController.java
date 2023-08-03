package com.kh.app.chatting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.app.chatting.service.ChattingService;
import com.kh.app.chatting.vo.ChattingVo;
import com.kh.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("chatting")
@RequiredArgsConstructor
@Slf4j
public class ChattingController {
	private final ChattingService service;
	
	
	@GetMapping("chattingDetail")
	public String getChattingDetail() {
		return "chatting/chattingDetailForm";
	}
	
	@GetMapping("chattingList")
	public String getChattingList(HttpSession session, Model model) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		String memberNo = loginMember.getNo();
		
		log.info("memberNo : "+memberNo);
		
		List<ChattingVo> chatList = service.getChattingList(memberNo);
		
		log.info("채팅방 목록 :  "+chatList.toString());
		
		if(chatList == null) {
			throw new IllegalStateException("채팅방 목록 조회 실패");
		}
		
		model.addAttribute("chatList", chatList);
		
		return "chatting/chattingListForm";
	}
	
	
	
	@GetMapping("chattingResult")
	public String searchChatting() {
		return "chatting/searchChattingResult";
	}
	
	@GetMapping("searchMember")
	public ResponseEntity<List<MemberVo>> searchMember(@RequestParam String searchInput) {
		List<MemberVo> searchList = service.searchMember(searchInput); 
		
		
		// attendanceStatus가 null인 경우 기본 값을 'X'로 설정
	    for (MemberVo member : searchList) {
	        if (member.getAttendanceStatus() == null) {
	            member.setAttendanceStatus("X");
	        }
	    }
		
		log.info(searchList.toString());
		
		
		 return ResponseEntity.ok(searchList);
	}
	
	@GetMapping("createNewChatRoom")
	public String createNewChatRoom(@RequestParam String receiverNo, HttpSession session, Model model) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		String senderNo = loginMember.getNo();
		
		Map<String, String> memberMap = new HashMap<>();
		memberMap.put("senderNo", senderNo);
		memberMap.put("receiverNo", receiverNo);
		
		//채팅방 생성
		int result = service.createNewChatRoom(memberMap);
		
		log.info(String.valueOf(result));
		
		//리시버의 정보 가져오기
		MemberVo receiver = service.getReceiverInfo(receiverNo);
		
		log.info(receiver.toString());
		
		//채팅방 번호 가져오기
		ChattingVo roomVo = service.getChattingRoomNo(memberMap);
		
		log.info(roomVo.toString());
		
		String roomNo = roomVo.getChattingRoomNo();
		
		
		
		model.addAttribute("receiver", receiver);
		model.addAttribute("roomVo", roomVo);
		
		return "chatting/newChattingRoom";
	}
}	
