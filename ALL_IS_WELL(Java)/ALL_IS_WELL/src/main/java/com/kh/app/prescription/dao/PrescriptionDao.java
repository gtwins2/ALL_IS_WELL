package com.kh.app.prescription.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.page.vo.PageVo;
import com.kh.app.patient.vo.PatientVo;
import com.kh.app.prescription.vo.PrescriptionVo;

@Repository
public class PrescriptionDao {

	public List<PatientVo> list(SqlSessionTemplate sst) {
		return sst.selectList("prescription.selectList");
	}

	public int write(SqlSessionTemplate sst, PrescriptionVo vo) {
		return sst.insert("prescription.write", vo);
	}

	public int insertPL(SqlSessionTemplate sst, PrescriptionVo vo) {
		return sst.insert("prescription.insertPL", vo);
	}

	public int getPrescriptionListCnt(SqlSessionTemplate sst, PrescriptionVo vo) {
		return sst.selectOne("prescription.getPrescriptionListCnt", vo);
	}

	public List<PatientVo> PrescriptionList(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("prescription.PrescriptionList", pv, rb);
	}

	public PrescriptionVo detail(SqlSessionTemplate sst, PrescriptionVo vo) {
		return sst.selectOne("prescription.detail", vo);
	}

}
