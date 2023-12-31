package com.kh.app.approval.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ApprovalBtnVo {

	private String no;
	private String memberNo;
	private Date createDate;
	private String title;
	private Date startDate;
	private Date endDate;
	
	//추가 데이터
	private String departmentName;
}
