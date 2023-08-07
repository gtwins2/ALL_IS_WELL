package com.kh.app.attendance.vo;

import java.sql.Date;

import lombok.Data;
import oracle.sql.DATE;

@Data
public class AttendanceVo {
	
	private String no;
	private String memberNo;
	private String memberName;
	private Date presenceTime;
	private Date leaveTime;
	private String status;
	private String departmentName;
	private String positionName;
	
	//휴가문서
	private String content;
	private Date useDate;
	private Date startDate;
	private Date endDate;
}
