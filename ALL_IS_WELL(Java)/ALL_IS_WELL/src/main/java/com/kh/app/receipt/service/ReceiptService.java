package com.kh.app.receipt.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.app.page.vo.PageVo;
import com.kh.app.patient.vo.PatientVo;
import com.kh.app.receipt.dao.ReceiptDao;
import com.kh.app.receipt.vo.ReceiptVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReceiptService {

	private final ReceiptDao dao;
	private final SqlSessionTemplate sst;
	
	public List<PatientVo> search(PatientVo vo) {
		return dao.search(sst, vo);
	}

	public List<PatientVo> list(PageVo pv) {
		return dao.list(sst, pv);
	}

	public int regist(PatientVo vo) {
		return dao.regist(sst, vo);
	}

	public int registContent(ReceiptVo vo) {
		return dao.registContent(sst, vo);
	}

	public int getPatientListCnt() {
		return dao.getPatientListCnt(sst);
	}

	public PatientVo selectOneList(PatientVo vo) {
		return dao.selectOneList(sst, vo);
	}

	public List<PatientVo> registList(PageVo pv) {
		return dao.registList(sst, pv);
	}

	public PatientVo infoUpdate(PatientVo vo) {
		return dao.infoUpdate(sst, vo);
	}

	public int infoUpdateUpdate(PatientVo vo) {
		return dao.infoUpdateUpdate(sst, vo);
	}

}
