package com.kh.app.operation.vo;

import lombok.Data;

@Data
public class OperationVo {
	private String operationNo;
	private String operatingRoomNo;
	private String patientNo;
	private String patientName;
	private String operationName;
	private String startDate;
	private String endDate;
	private String status;
	private String operationRecord;
	private String operatingRoomStatus;
	private String operatingRoomLocation;
	private String participantNumbers;
}
