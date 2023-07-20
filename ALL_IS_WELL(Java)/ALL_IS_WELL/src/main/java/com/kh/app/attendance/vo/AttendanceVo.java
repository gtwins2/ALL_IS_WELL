package com.kh.app.attendance.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class AttendanceVo {
	
	private String no;
	private String memberNo;
	private String memberName;
	private Date presenceTime;
	private Date leaveTime;
	private String status;
}
