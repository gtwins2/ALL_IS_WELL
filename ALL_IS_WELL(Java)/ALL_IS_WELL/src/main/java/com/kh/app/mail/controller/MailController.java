package com.kh.app.mail.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.app.mail.service.MailService;
import com.kh.app.mail.vo.MailVo;
import com.kh.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("mail")
@RequiredArgsConstructor
@Slf4j
public class MailController {
	
	@Autowired
	private JavaMailSender mailSender;
	private final MailService service;
	
	
	//받은 메일함(화면)
	@GetMapping("receiveList")
	public String receiveMailList() {
		return "mail/receiveMailForm";
	}
	
	//메일 상세조회(화면)
	@GetMapping("mailDetail")
	public String getMailDetail() {
		return "mail/mailDetailForm";
	}
	
	//메일 쓰레기통
	@GetMapping("mailTrash")
	public String getMailTrash() {
		return "mail/mailTrashCan";
	}
	
	//메일 보내기 리스트
	@GetMapping("sendMailList")
	public String sendMailList() {
		return "mail/sendMailForm";
	}
	
	
	//메일 작성(화면)
	@GetMapping("writeMail")
	public String writeMail() {
		return "mail/writeMailForm";
	}
	
	//전체 회원 이메일 조회
	@GetMapping("getAllMembers")
	@ResponseBody
	public List<MemberVo> getAllMembers() {
		List<MemberVo> voList = service.getAllMembers();
		
		log.info(voList.toString());
		
		if(voList == null) {
			throw new IllegalStateException("전체 회원 이메일 조회 실패");
			
			
		}
		
		return voList;
	}
	
	
	//검색 회원 이메일 조회
	@GetMapping("searchEmail")
	@ResponseBody
	public List<MemberVo> searchEmail(String name) {
			System.out.println(name);
		
		  List<MemberVo> voList = service.searchEmail(name);

		    log.info("전체회원이메일 조회 결과 : " + voList.toString());

		    if (voList == null) {
		        throw new IllegalStateException("검색 실패");
		    }

		 return voList;

	}
	
	
	
	//메일 작성 기능
	@PostMapping("writeMail")
	public String writeMail(MailVo vo, HttpSession session) {
		try {
			//로그인 멤버 가져오기
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			
			
			String senderEmail = loginMember.getEmail();
			
			
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
			
			//보내는 사람 이메일 여기선 google 메일서버 사용하는 아이디를 작성하면 됨
			messageHelper.setFrom(senderEmail);
			
			//받는사람 이메일
			messageHelper.setTo("");
			
			//메일 제목
			messageHelper.setSubject("");
			
			//메일 내용
			messageHelper.setText("");
			
			mailSender.send(mimeMessage);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mail/sendMailList";
	}
	
	
	
}
