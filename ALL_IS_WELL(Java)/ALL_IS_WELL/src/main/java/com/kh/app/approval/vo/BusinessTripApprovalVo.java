package com.kh.app.approval.vo;

import lombok.Data;
import oracle.sql.DATE;

@Data
public class BusinessTripApprovalVo {

	private String no;
	private String memberNo;
	private String approvalDocumentNo;
	private String content;
	private DATE startDate;
	private DATE endDate;
	
	private DATE createDate;
}
