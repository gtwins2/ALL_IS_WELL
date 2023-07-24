package com.kh.app.admission.vo;

import lombok.Data;

@Data
public class AdmissionVo {
	private String no;
	private String inpatientListNo;
	private String maxCapacity;
	private String inpatientPosition;
	private String inpatientNo;
	private String patientNo;
	private String patientName;
	private String admissionRecordNo;
	private String reason;
	private String admissionDate;
	private String dischargeDate;
	private int numberOfPatients;
}
