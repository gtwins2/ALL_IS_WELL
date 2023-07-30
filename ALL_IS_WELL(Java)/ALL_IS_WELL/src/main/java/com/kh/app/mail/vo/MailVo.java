package com.kh.app.mail.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MailVo {
	private String no;
	private String mailTitle;
	private String mailContent;
	private String mailEnrollDate;
	private String senderMailNo;
	private String receiverMailAddress;
	private String receiverNo;
	private String mailNo;
	private String senderMailstatus;
	private String mailAttachmentNo;
	private String attachName;
	private String receiverMailNo;
	private String receiverMailReceiverNo;
	private String receiverMailStatus;
	private String receiverMailYn;
	private List<MultipartFile> attachments;
	private String selectedMemberNumbers;
	private String senderNo;
	private String filePath;
	private String senderName;
	private String receiverName;
	private String receiverMail;
	private String senderMail;
}

