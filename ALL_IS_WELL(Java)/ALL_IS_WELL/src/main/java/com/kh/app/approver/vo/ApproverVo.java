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
	private String positionName;
	private String departmentNo;
	private String departmentName;
	private String approvalDocumentNo;
	private String status;
	private String title;
	private Date createDate;
	private Date approvalDate;
	private String reason;
	private String sign;
	private String searchType;
	private String searchValue;
	private String searchValue2;
}
