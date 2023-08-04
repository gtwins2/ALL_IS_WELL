package com.kh.app.websocket.server;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.kh.app.chatting.service.ChattingService;
import com.kh.app.chatting.vo.ChattingVo;
import com.kh.app.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;


@Slf4j
public class WebsocketServer extends TextWebSocketHandler {
	//유저들의 세션을 담을 set
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	
	@Autowired
	private ChattingService service;
	
	//connection이 되었을때 되고 난이후에 동작하는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("called...afterConnectionEstablished");
		
		
		
		
		//sessionSet에 세션 저장(여러명이 연결)
		sessionSet.add(session);
		
		
		
		
	}
	
	//connection이 closed되고 난 이후에 동작하는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("called...afterConnectionClosed");
		
		//sessionsSet에 저장된 세션 삭제
		sessionSet.remove(session);
	}
	
	
	//텍스트 메시지를 다루는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("called...handleTextMessage");
		
		
		log.info("받은 메시지 : "+message.getPayload().toString());
		MemberVo loginMember = (MemberVo)session.getAttributes().get("loginMember");
		
		log.info(loginMember.toString());
		
		 
		 
		 
		
		//json으로 데이터를 파싱하기
		Gson gson = new Gson();
		
		//맵 만들어서, 키 밸류 형태로 데이터를 준비하기
		//만들어진 맵을 JSON 형태로 변환
		//변환된 데이터를 send하기
		
		Map<String, String> msgVo = new HashMap<>();
		msgVo.put("name", loginMember.getName());
		msgVo.put("msg", message.getPayload());
		
		Date currentTime = new Date();

		SimpleDateFormat dateFormat = new SimpleDateFormat("M월 d일 a h:mm", Locale.KOREA);

		String formattedTime = dateFormat.format(currentTime);

		msgVo.put("time", formattedTime);
		
		String jsonStr = gson.toJson(msgVo);
		
		
		
		
		//전달받은 메세지를 모두에게 뿌려주기
		//연결된 모든 세션을 가져와서 send 해주기
		for(WebSocketSession s : sessionSet) {
			s.sendMessage(new TextMessage(jsonStr));
		}	
	}
}