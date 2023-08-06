package com.kh.app.approval.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ApprovalVo {

	private String no;
	private Date createDate;
	private String memberNo;
	private String status;
	private String title;
	private String memberName;
	private String reason;
	
}
