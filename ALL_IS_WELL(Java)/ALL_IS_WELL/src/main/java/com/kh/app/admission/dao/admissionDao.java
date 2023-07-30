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
	public int getRoomCount(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.selectOne("admission.getRoomCount", paramMap);
	}
	
	
	//입원실 방 목록 가져오기
	public List<AdmissionVo> getRoomList(SqlSessionTemplate sst, PageVo pv, Map<String, String> paramMap) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("admission.getRoomList", paramMap, rb);
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


	public List<AdmissionVo> getScheduleList(SqlSessionTemplate sst, PageVo pv, Map<String, String> paramMap) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("admission.getScheduleList", paramMap, rb);
	}


	public AdmissionVo goDetailAdmissionRecord(SqlSessionTemplate sst, String admissionRecordNo) {
		return sst.selectOne("admission.goDetailAdmissionRecord", admissionRecordNo);
	}


	public int updateAdmissionRecord(SqlSessionTemplate sst, AdmissionVo vo) {
		return sst.update("admission.updateAdmissionRecord", vo);
	}


	public int getScheduleCount(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.selectOne("admission.getScheduleCount", paramMap);
	}
}
