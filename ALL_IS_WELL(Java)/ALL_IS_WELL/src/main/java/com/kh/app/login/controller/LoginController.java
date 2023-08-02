package com.kh.app.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app.admin.vo.AdminVo;
import com.kh.app.member.service.MemberService;
import com.kh.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;


@Controller
@RequestMapping("member")
@RequiredArgsConstructor
public class LoginController {

	private final MemberService ms;
	DefaultMessageService messageService;
	
	@Autowired
	public void ExampleController() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize("NCSRQ4MAHHI6QWOM", "WMY9PPXVO9D5MHLWIN1PLATU2A4UDYYD", "https://api.coolsms.co.kr");
    }
	
	@GetMapping("logout")
	public String logout() {
		return "login/logout";
	}
	
	@GetMapping("login")
	public String login() {
		return "login/login";
	}
	
	@PostMapping("login")
	public String login(MemberVo vo, HttpSession session) {
		MemberVo loginMember = ms.login(vo);
		session.setAttribute("loginMember", loginMember);

		if(loginMember == null) {
			return "redirect:/member/login";
			
		}

		return "main/Mmain";
	}
	
	@GetMapping("Alogin")
	public String Alogin() {
		return "login/Alogin";
	}
	
	@PostMapping("Alogin")
	public String Alogin(AdminVo vo, HttpSession session) {
		if(vo.getAdminId().equals("ADMIN") && vo.getAdminPwd().equals("1234")) {
			return "main/Amain";
		}
		return "error/404page";
	}
	
	@GetMapping("idFind")
	public String idFind() {
		return "login/idFind";
	}
	
	@PostMapping("idFind")
	public String idFind(MemberVo vo, Model model) {
		
		MemberVo voList = ms.idFind(vo);
		model.addAttribute("vo",voList);
		
		return "login/idFind";
	}
	
	@GetMapping("pwdFind")
	public String pwdFind() {
		return "login/pwdFind";
	}
	
	@GetMapping("pwdFindTest")
	public String pwdFindTest() {
		return "login/pwdFindTest";
	}
	
	 @PostMapping("send-one")
	    public SingleMessageSentResponse sendOne() {
	        Message message = new Message();
	        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
	        message.setFrom("01057963553");
	        message.setTo("01057963553");
	        message.setText("인증번호는 1111 입니다.");

	        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
	        System.out.println(response);

	        return response;
	    }

	
}
