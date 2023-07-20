package com.kh.app.receipt.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.patient.vo.PatientVo;

@Repository
public class ReceiptDao {

	public List<PatientVo> list(SqlSessionTemplate sst) {
		return sst.selectList("receipt.selectList");
	}

	public List<PatientVo> search(SqlSessionTemplate sst, PatientVo vo) {
		return sst.selectList("receipt.selectSearchList", vo);
	}

}
