package com.kh.app.approval.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BusinessTripApprovalVo {

	private String no;
	private String memberNo;
	private String memberName;
	private String approvalDocumentNo;
	private String content;
	private Date startDate;
	private Date endDate;
	private String departmentName;
	private String sign;
	
	private Date createDate;
}
