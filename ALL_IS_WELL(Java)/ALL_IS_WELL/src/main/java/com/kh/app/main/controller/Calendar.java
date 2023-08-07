package com.kh.app.main.controller;

import lombok.Data;

@Data
public class Calendar {
	
	private String no;
	private String operatingRoomNo;
	private String patientNo;
	private String operationName;
	private String startDate;
	private String endDate;
	private String status;
	private String operationRecord;
	private String memberNo;
	private String dutyDay;
	
	private int calendarNo;
	private String calendarTitle;
	private String calendarMemo;
	private String calendarStart;
	private String calendarEnd;
}
