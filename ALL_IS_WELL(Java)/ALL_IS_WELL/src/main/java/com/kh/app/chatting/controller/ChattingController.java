package com.kh.app.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("chatting")
@RequiredArgsConstructor
public class ChattingController {
	
	@GetMapping("chattingDetail")
	public String getChattingDetail() {
		return "chatting/chattingDetailForm";
	}
	
	@GetMapping("chattingList")
	public String getChattingList() {
		return "chatting/chattingListForm";
	}
	
	@GetMapping("chattingResult")
	public String searchChatting() {
		return "chatting/searchChattingResult";
	}
}	
