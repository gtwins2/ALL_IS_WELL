package com.kh.app.prescription.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.app.page.vo.PageVo;
import com.kh.app.patient.vo.PatientVo;
import com.kh.app.prescription.dao.PrescriptionDao;
import com.kh.app.prescription.vo.PrescriptionVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PrescriptionService {

	private final PrescriptionDao dao;
	private final SqlSessionTemplate sst;
	
	public List<PatientVo> list() {
		return dao.list(sst);
	}

	public int write(PrescriptionVo vo) {
		return dao.write(sst, vo);
	}

	public int insertPL(PrescriptionVo vo) {
		return dao.insertPL(sst,vo);
	}

	public int getPrescriptionListCnt(Map<String, String> paramMap) {
		return dao.getPrescriptionListCnt(sst,paramMap);
	}

	public List<PatientVo> PrescriptionList(PageVo pv, Map<String, String> paramMap) {
		return dao.PrescriptionList(sst, pv, paramMap);
	}

	public PrescriptionVo detail(PrescriptionVo vo) {
		return dao.detail(sst, vo);
	}

}
