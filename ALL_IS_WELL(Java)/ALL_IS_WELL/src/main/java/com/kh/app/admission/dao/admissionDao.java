package com.kh.app.admission.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.admission.vo.AdmissionVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.patient.vo.PatientVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
@Transactional
public class admissionDao {
	
	
	//방 갯수 세기
	public int getRoomCount(SqlSessionTemplate sst) {
		return sst.selectOne("admission.getRoomCount");
	}
	
	
	//입원실 방 목록 가져오기
	public List<AdmissionVo> getRoomList(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("admission.getRoomList", null, rb);
	}


	public List<AdmissionVo> getNumberOfPatients(SqlSessionTemplate sst) {
		return sst.selectList("admission.getNumberOfPatients");
	}


	public List<PatientVo> searchPatient(SqlSessionTemplate sst, String name) {
		return sst.selectList("admission.searchPatient", name);
	}


	public int registerPatient(SqlSessionTemplate sst, AdmissionVo vo) {
		return sst.insert("admission.registerPatient", vo);
	}




	public int insertInpatientList(SqlSessionTemplate sst, AdmissionVo vo) {
		return sst.insert("admission.insertInpatientList", vo);
	}
}
