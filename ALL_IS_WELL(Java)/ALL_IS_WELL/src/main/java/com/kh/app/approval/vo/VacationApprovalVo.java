package com.kh.app.approval.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class VacationApprovalVo {

	private String no;
	private String MemberNo;
	private String memberName;
	private String sign;
	private String approvalDocumentNo;
	private String content;
	private String useDate;
	private String departmentName;
	private Date createDate;
	private Date startDate;
	private Date endDate;
	
}
