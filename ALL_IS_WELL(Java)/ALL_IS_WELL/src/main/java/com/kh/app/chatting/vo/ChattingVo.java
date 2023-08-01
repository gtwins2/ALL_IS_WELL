package com.kh.app.chatting.vo;

import lombok.Data;

@Data
public class ChattingVo {
	private String chattingRoomNo;
	private String chattingNo;
	private String senderNo;
	private String receiverNo;
	private String senderStatus;
	private String receiverStatus;
	private String writerNo;
	private String messengerContent;
	private String mailEnrollDate;
	private String confirmYn;
	private String deleteYn;
	private String senderName;
	private String senderProfile;
	private String senderDepartmentName;
	private String senderPositionName;
	private String receiverName;
	private String receiverProfile;
	private String receiverDepartmentName;
	private String receiverPositionName;
	private String receiverAttendanceStatus;
}
