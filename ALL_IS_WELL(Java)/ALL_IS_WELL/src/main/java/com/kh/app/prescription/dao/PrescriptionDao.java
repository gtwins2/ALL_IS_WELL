package com.kh.app.prescription.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.patient.vo.PatientVo;

@Repository
public class PrescriptionDao {

	public List<PatientVo> list(SqlSessionTemplate sst) {
		return sst.selectList("prescription.selectList");
	}

}
