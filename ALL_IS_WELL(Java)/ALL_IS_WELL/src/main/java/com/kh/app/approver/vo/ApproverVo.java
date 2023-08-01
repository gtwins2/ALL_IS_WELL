package com.kh.app.approver.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ApproverVo {

	private String no;
	private String memberName;
	private String approverNo;
	private String approverName;
	private String positionNo;
	private String departmentNo;
	private String approvalDocumentNo;
	private String status;
	private String title;
	private Date createDate;
	private String approvalDate;
	private String reason;
}
