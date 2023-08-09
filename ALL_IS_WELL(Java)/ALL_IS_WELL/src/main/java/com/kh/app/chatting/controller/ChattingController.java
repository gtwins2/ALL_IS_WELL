package com.kh.app.chatting.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.app.chatting.service.ChattingService;
import com.kh.app.chatting.vo.ChattingVo;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.websocket.server.WebsocketServer;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("chatting")
@RequiredArgsConstructor
@Slf4j
public class ChattingController {

	
	private final ChattingService service;
   
    
	
	
	@GetMapping("chattingDetail")
	public String getChattingDetail(@RequestParam String chattingRoomNo,  Model model, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		
		log.info("chattingRoomNo 잘 넘어갔나? : "+chattingRoomNo);
		
		
		
		List<ChattingVo> chattingDetailList = service.getChattingDetail(chattingRoomNo);
		
		log.info("채팅 디테일 잘 들어왔나? : "+chattingDetailList.toString());
		
		if(chattingDetailList == null) {
			throw new IllegalStateException("chatting Detail  가져오기 실패");
			
		}
		
		model.addAttribute("chattingDetailList", chattingDetailList);
		
		
		return "chatting/chattingDetailForm";
	}
	
	@GetMapping("chattingList")
	public String getChattingList(HttpSession session, Model model, @RequestParam(name = "searchValue", required = false) String searchValue) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		String memberNo = loginMember.getNo();
		
		log.info("memberNo : "+memberNo);
		
		Map<String, String> chattingMap = new HashMap<>();
		
		chattingMap.put("memberNo", memberNo);
		chattingMap.put("searchValue", searchValue);
		
		List<ChattingVo> chatList = service.getChattingList(chattingMap);
		
		log.info("채팅방 목록 :  "+chatList.toString());
		
		if(chatList == null) {
			throw new IllegalStateException("채팅방 목록 조회 실패");
		}
		
		model.addAttribute("chatList", chatList);
		model.addAttribute("currentUserNo", memberNo);
		
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
	
	@PostMapping("saveMessage")
	public ResponseEntity<String> saveMessage(@RequestBody ChattingVo vo, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		
		vo.setWriterNo(loginMember.getNo());
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDate = dateFormat.format(new Date());
		vo.setMailEnrollDate(currentDate);
		
		
		log.info("저장할 변수 : "+vo.toString());
		
		int result = service.saveMessage(vo);
		
		log.info("메시지 저장 성공 여부 : "+String.valueOf(result));
		
		if(result != 1) {
			throw new IllegalStateException("메시지 저장 실패");
		}
		
		

		return ResponseEntity.ok("메시지 디비에 저장됨");
	}
	
	@GetMapping("quitChatting")
	public String quitChatting(@RequestParam("chattingRoomNo") String chattingRoomNo, HttpSession session) {
		
		log.info("채팅방 나가기를 위한 채팅방번호 : "+chattingRoomNo);
		
		int result = service.quitChatting(chattingRoomNo);
		
		log.info("채팅방 나가기 결과 : "+String.valueOf(result));
		
		if(result != 1) {
			throw new IllegalStateException("채팅방 나가기 실패");
		}
		
		return "redirect:/chatting/chattingList";
	}
	
	//상대방 접속 확인 여부
//	@PostMapping("check_opponent_status")
//	public ResponseEntity<String> checkOpponentStatus(@RequestParam String opponentId) {
//		
//
//		return ResponseEntity.ok(isConnected ? "connected" : "disconnected");
//	}
	
	@PostMapping("updateConfirmYn")
	public ResponseEntity<Void> updateConfirmYn(String chattingRoomNo, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		String memberNo = loginMember.getNo();
		
		Map<String, String> confirmMap = new HashMap<>();
		
		confirmMap.put("chattingRoomNo", chattingRoomNo);
		confirmMap.put("memberNo", memberNo);
		
		int count = service.selectCountOfChatting(confirmMap);
		
		
		for(int i = 0; i < count; i++) {
			int result = service.updateConfirmYn(confirmMap);
			
			log.info(String.valueOf(result));
			
			if(result != 1) {
				throw new IllegalStateException("업데이트 실패");
			}
		}
		
		return ResponseEntity.ok().build();
	}

	
}	
