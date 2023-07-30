package com.kh.app.mail.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.Part;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.InputStreamSource;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.kh.app.mail.service.MailService;
import com.kh.app.mail.vo.MailVo;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.operation.vo.OperationVo;
import com.kh.app.page.vo.PageVo;

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
	public String receiveMailList(@RequestParam(name="page", required=false, defaultValue="1") int currentPage,  Model model, @RequestParam Map<String, String> paramMap, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		String receiverNo = loginMember.getNo();
		
		paramMap.put("receiverNo", receiverNo);
		
		int listCount = service.getReceiveMailCount(paramMap);
		
		int pageLimit = 5; 
				
		int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<OperationVo> receiveList = service.getReceiveMailList(pv, paramMap);
		
		log.info(receiveList.toString());
		
		model.addAttribute("pv", pv);
		model.addAttribute("receiveList", receiveList);
		model.addAttribute("paramMap", paramMap);
		
		
		
		return "mail/receiveMailForm";
	}
	
	//메일 상세조회(화면)
	@GetMapping("mailDetail")
	public String getMailDetail(String no, Model model) {
		MailVo vo = service.getMailDetail(no);
		
		model.addAttribute("vo", vo);
		
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
			
			log.info(vo.toString());
			
			vo.setSenderNo(loginMember.getNo());
			
			
			String senderEmail = loginMember.getEmail();
			
			  List<String> receiverEmailList = new ArrayList<String>(Arrays.asList(vo.getReceiverMailAddress().split("\\s*,\\s*")));

	        // 빈 문자열 제거
	        receiverEmailList.removeIf(String::isEmpty);
			
			System.out.println("receiverEmailList : "+receiverEmailList);
	        
			
			//구글 지메일로 메일 보내기
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
			
			
			
			
			
			for (int i = 0; i < receiverEmailList.size(); i++) {
			    messageHelper.setFrom("alliswell221230@naver.com");
			    messageHelper.setTo(receiverEmailList.get(i));

			    // 이메일 제목
			    messageHelper.setSubject("[AllIsWell] "+loginMember.getName()+"("+loginMember.getDepartmentName()+") 님이 보낸 메일 : "+vo.getMailTitle());

			    // 이메일 내용
			    messageHelper.setText(vo.getMailContent());

			    // 보낸 날짜
			    messageHelper.setSentDate(new Date());

			    List<MultipartFile> attachments = vo.getAttachments();

			    if (attachments != null && !attachments.isEmpty()) {
			        for (MultipartFile attachment : attachments) {
			            // 첨부 파일 추가:
			            String attachmentName = attachment.getOriginalFilename();
			            InputStreamSource attachmentSource = new InputStreamSource() {
	                        @Override
	                        public InputStream getInputStream() throws IOException {
	                            return attachment.getInputStream();
	                        }
	                    };
	                    messageHelper.addAttachment(attachmentName, attachmentSource);
			        }
			    }

			    mailSender.send(mimeMessage);
			}

			//이메일 등록, 
			int mailResult = service.registerEmail(vo);
			
			log.info("mailResult : "+mailResult);
			
			//발신 메일 등록
			int sendResult = service.registerSenderMail(vo);
			
			log.info("sendResult : "+sendResult);
			
			
			String[] selectedMemberNumbers = vo.getSelectedMemberNumbers().split(",");
			
			log.info(selectedMemberNumbers.toString());
			
			
			//수신 메일 등록
			for(String memberNumber: selectedMemberNumbers) {
				vo.setReceiverNo(memberNumber);
				
				int receiveResult = service.registerReceiverMail(vo);
			}
			
			
			//첨부파일 등록
			List<MultipartFile> attachments = vo.getAttachments();
			if(attachments != null && !attachments.isEmpty()) {
				
				//Attachments directory
				String attachmentsDir = "c:/tmp/";
				
				for (MultipartFile attachment : attachments) {
					
					
					
		            // 첨부 파일 추가:
		            String attachmentName = attachment.getOriginalFilename();
		            
		            vo.setAttachName(attachmentName);
		            
		            String filePath = attachmentsDir + attachmentName;
		            
		            vo.setFilePath(filePath);
		            
		            //첨부파일 서버에 저장
		            File destFile = new File(filePath);
		            //디렉토리 생성
		            destFile.getParentFile().mkdirs();
		            
		            //파일을 생성된 경로에 저장
		            attachment.transferTo(destFile);
		            
		            
		            
		         // 첨부파일 정보를 데이터베이스에 저장
	                int attachResult = service.registerAttachment(vo);
	                
	                log.info(String.valueOf(attachResult));
		        }
			}
			
			
			
			
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mail/sendMailList";
	}
	
	
	//썸머노트 이미지파일 업로드
	@PostMapping("summernoteUpload")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response) {
		
		
		
		log.info(multipartFile.toString());
		
		
		
		//내부경로로 저장하기
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/");
		
		//원래 파일이름
		String originalFileName = multipartFile.getOriginalFilename();
		
		//파일 확장자
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		//저장될 파일명
		String savedFileName = UUID.randomUUID()+extension;
		
		File targetFile = new File(path + savedFileName);
		
		try {
			//서버에 저장
			multipartFile.transferTo(targetFile);

		} catch(IOException e) {
			//저장된 파일 삭제
			FileUtils.deleteQuietly(targetFile);

			e.printStackTrace();
			return "fail";
		}
		
		
		
		System.out.println("파일 잘 들어옴");
		
		
		log.info(targetFile.toString());
		
		return "ok";
	}
	
	//받은 메일함에서 메일 삭제하기
	@PostMapping("deleteReceiveMail")
	public ResponseEntity<?> deleteReceiveMail(@RequestParam("mailNos[]") String[] mailNos) {
		log.info(mailNos.toString());
		
		for(String mailNo : mailNos) {
			int result = service.deleteReceiveMail(mailNo);
			
			log.info(String.valueOf(result));
			
			if(result != 1) {
				throw new IllegalStateException("받은 메일함에서 메일 삭제 실패");
			}
		}
			
		return ResponseEntity.ok("{\"success\": true}");
	
	}
}
