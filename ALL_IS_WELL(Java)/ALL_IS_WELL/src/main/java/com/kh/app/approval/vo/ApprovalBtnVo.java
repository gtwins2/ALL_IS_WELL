package com.kh.app.approval.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ApprovalBtnVo {

	private String no;
	private String memberNo;
	private String createDate;
	private String title;
	private String startDate;
	private String endDate;
	
	//추가 데이터
	private String departmentName;
}
