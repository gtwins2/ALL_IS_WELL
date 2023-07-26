package com.kh.app.mail.vo;

import lombok.Data;

@Data
public class MailVo {
	private String no;
	private String mailTitle;
	private String mailContent;
	private String mailEnrollDate;
	private String senderMailNo;
	private String receiverNo;
	private String mailNo;
	private String senderMailstatus;
	private String mailAttachmentNo;
	private String attachName;
	private String receiverMailNo;
	private String receiverMailReceiverNo;
	private String receiverMailStatus;
	private String receiverMailYn;
}

