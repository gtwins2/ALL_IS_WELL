package com.kh.app.receipt.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.page.vo.PageVo;
import com.kh.app.patient.vo.PatientVo;
import com.kh.app.receipt.vo.ReceiptVo;

@Repository
public class ReceiptDao {

	public List<PatientVo> list(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("receipt.selectList", pv, rb);
	}

	public List<PatientVo> search(SqlSessionTemplate sst, PatientVo vo) {
		return sst.selectList("receipt.selectSearchList", vo);
	}

	public int regist(SqlSessionTemplate sst, PatientVo vo) {
		return sst.insert("receipt.regist", vo);
	}

	public int registContent(SqlSessionTemplate sst, ReceiptVo vo) {
		return sst.insert("receipt.registContent", vo);
	}

	public int getPatientListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("receipt.getListCnt");
	}

	public List<PatientVo> selectOneList(SqlSessionTemplate sst, PatientVo vo) {
		return sst.selectOne("receipt.selectOneList", vo);
	}

}
