package com.kh.app.attendance.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class AttendanceVo {
	
	private String no;
	private String memberNo;
	private String memberName;
	private String presenceTime;
	private String leaveTime;
	private String status;
}
