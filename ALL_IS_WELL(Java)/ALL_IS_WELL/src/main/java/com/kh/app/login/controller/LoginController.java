package com.kh.app.login.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.app.admin.vo.AdminVo;
import com.kh.app.approval.service.ApprovalService;
import com.kh.app.approval.vo.ApprovalVo;
import com.kh.app.approver.vo.ApproverVo;
import com.kh.app.attendance.service.AttendanceService;
import com.kh.app.attendance.vo.AttendanceVo;
import com.kh.app.board.service.InquiryService;
import com.kh.app.board.service.NoticeService;
import com.kh.app.board.service.SuggestService;
import com.kh.app.board.vo.NoticeVo;
import com.kh.app.inventory.service.InventoryService;
import com.kh.app.inventory.vo.InventoryVo;
import com.kh.app.main.controller.CalendarService;
import com.kh.app.main.service.MainService;
import com.kh.app.member.service.MemberService;
import com.kh.app.member.vo.CertificationVo;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.operation.vo.OperationVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.patient.vo.PatientVo;
import com.kh.app.search.vo.SearchVo;

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

	private final CalendarService calendarService; 
	private final MemberService ms;
	private final MainService ms2;
	DefaultMessageService messageService;
	private final NoticeService ns;
	private final SuggestService ss;
	private final InquiryService is;
	private final ApprovalService as;
	private final AttendanceService as2;
	private final InventoryService service;
	
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
	public String login(MemberVo vo, HttpSession session,ModelAndView mv, HttpServletRequest request, 
			Model model, @RequestParam Map<String , String> paramMap) {
		MemberVo loginMember = ms.login(vo);
		session.setAttribute("loginMember", loginMember);
		
		if(loginMember == null) {
			return "login/error/loginError";
			
		}
		
		String viewpage = "calendar";
		
		List<Calendar> calendar = null;
		List<OperationVo> operation = ms2.operation(loginMember);
		
		PageVo pv = new PageVo(3, 3, 3, 3);
		List<NoticeVo> voList = ns.noticeList(pv, paramMap);
		model.addAttribute("voList" ,voList);
		
		SearchVo svo = new SearchVo();
		svo.setNo(loginMember.getNo());
		List<ApprovalVo> voList2 = as.getApprovalList(pv, svo);
		model.addAttribute("voList2" ,voList2);
		
		String no = loginMember.getNo();
		List<AttendanceVo> voList3 = as2.getAttendanceList(pv, no);
		model.addAttribute("voList3" ,voList3);
		
		try {
			calendar = calendarService.getCalendar(loginMember);
			request.setAttribute("calendarList", calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName(viewpage);
		model.addAttribute("operation", operation);
		
		
		
		return "main/Mmain";
	}
	
	@GetMapping("Alogin")
	public String Alogin() {
		return "login/Alogin";
	}
	
	@PostMapping("Alogin")
	public String Alogin(AdminVo vo, HttpSession session, Model model,ModelAndView mv, HttpServletRequest request
			, @RequestParam Map<String , String> paramMap) {
		if(vo.getAdminId().equals("ADMIN") && vo.getAdminPwd().equals("1234")) {
			int listCount = ms2.mCount();
			int currentPage = ms2.fCount();
			PageVo pv2 = new PageVo(listCount, currentPage, 3, 3);
			
			int nine = ms2.nineCount(); 
			int eight = ms2.eightCount(); 
			int seven = ms2.sevenCount(); 
			int six = ms2.sixCount(); 
			int five = ms2.fiveCount(); 
			
			String viewpage = "calendar";
			List<Calendar> calendar = null;
			
			PageVo pv = new PageVo(3, 3, 3, 3);
			List<NoticeVo> voList = ns.noticeList(pv, paramMap);
			model.addAttribute("voList" ,voList);
			
			SearchVo svo = new SearchVo();
			List<ApproverVo> voList2 = as.getAdminList(pv, svo);
			model.addAttribute("voList2" ,voList2);
			
			List<InventoryVo> voList3 = service.list(pv, paramMap);
			model.addAttribute("voList3" ,voList3);
			
			try {
				calendar = calendarService.getCalendar();
				request.setAttribute("calendarList", calendar);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.setViewName(viewpage);
			
			model.addAttribute("pv", pv2);
			model.addAttribute("nine", nine);
			model.addAttribute("eight", eight);
			model.addAttribute("seven", seven);
			model.addAttribute("six", six);
			model.addAttribute("five", five);
			
			System.out.println(five);
			System.out.println(six);
			System.out.println(seven);
			return "redirect:/Amain";
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
		if(voList == null) {
			return "login/error/idfindError";
		}
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
	
	@PostMapping("certification")
	public String certification(CertificationVo vo, int n) {
		n =1234;
		if(vo.getNumber() == n) {
			int result = ms.certification(vo);
		}
		
		System.out.println(vo.getNumber());
		System.out.println(vo.getN());
		return "login/login";
	}
	
	 @PostMapping("send-one")
	    public String sendOne(CertificationVo vo, Model model) {
	        Message message = new Message();
	        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
	        int n = (int)(Math.random() * 8999) + 1000;
	        vo.setN(n);
	        System.out.println(vo.getN());
	        message.setFrom("01089801388");
	        message.setTo("01089801388");
	        message.setText("인증번호는" +"1234"+ "입니다.");
	        
	        model.addAttribute("n",n);
	        
	        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
	        System.out.println(response);
	        
	        return "login/pwdFind";
	    }

	
}
