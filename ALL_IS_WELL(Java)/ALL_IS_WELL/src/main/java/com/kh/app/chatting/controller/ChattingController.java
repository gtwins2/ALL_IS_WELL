package com.kh.app.chatting.controller;

import java.util.List;

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
		
		 return ResponseEntity.ok(searchList);
	}
}	
