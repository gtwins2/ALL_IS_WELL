package com.kh.app.receipt.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.app.patient.vo.PatientVo;
import com.kh.app.receipt.dao.ReceiptDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReceiptService {

	private final ReceiptDao dao;
	private final SqlSessionTemplate sst;
	
	public List<PatientVo> search(PatientVo vo) {
		return dao.search(sst, vo);
	}

	public List<PatientVo> list() {
		return dao.list(sst);
	}

}
