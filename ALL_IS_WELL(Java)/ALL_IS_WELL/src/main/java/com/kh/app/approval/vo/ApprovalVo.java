package com.kh.app.approval.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ApprovalVo {

	private String no;
	private String memberNo;
	private String createDate;
	private String title;
	
}
