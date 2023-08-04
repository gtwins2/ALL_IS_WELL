package com.kh.app.approver.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AdminApproverVo {

	private String no;
	private Date createDate;
	private Date startDate;
	private Date endDate;
	private Date approvalDate;
	private String title;
	private String status;
	private String content;
	private String approvalNo;
	private String memberNo;
	private String memberName;
	private String positionName;
	private String positionNo;
	private String departmentName;
	private String approverNo;
	private String approverName;
	private String approverPositionName;
	private String approverDepartmentName;
	private String approverReason;
	private String reason;
	private String useDate;
	private String sign;
	private String approverSign;
	private Date completeDate;
	
}
