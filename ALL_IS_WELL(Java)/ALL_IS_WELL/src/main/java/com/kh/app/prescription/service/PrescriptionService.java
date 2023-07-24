package com.kh.app.prescription.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.app.patient.vo.PatientVo;
import com.kh.app.prescription.dao.PrescriptionDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PrescriptionService {

	private final PrescriptionDao dao;
	private final SqlSessionTemplate sst;
	
	public List<PatientVo> list() {
		return dao.list(sst);
	}

}
