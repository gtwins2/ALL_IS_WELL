package com.kh.app.operation.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.member.vo.MemberVo;
import com.kh.app.operation.dao.OperationDao;
import com.kh.app.operation.vo.OperationVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
@RequiredArgsConstructor
public class OperationService {
	private final OperationDao dao;
	private final SqlSessionTemplate sst;
	
	//이름 검색
	public List<MemberVo> searchName(String name) {
		return dao.searchName(sst, name);
	}

	public int getRoomCount(Map<String, String> paramMap) {
		return dao.getRoomCount(sst, paramMap);
	}

	public List<OperationVo> getRoomList(PageVo pv, Map<String, String> paramMap) {
		return dao.getRoomList(sst, pv, paramMap);
	}

	public int registerOperation(OperationVo vo) {
		return dao.registerOperation(sst, vo);
	}

	public int registerParticipants(List<Integer> participantList) {
		return dao.registerParticipants(sst, participantList);
	}

	public String getPatientNo(String patientName) {
		return dao.getPatientNo(sst, patientName);
	}

	public int updateRoom(OperationVo vo) {
		return dao.updateRoom(sst, vo);
	}

	public int getScheduleListCount(Map<String, String> paramMap) {
		return dao.getScheduleListCount(sst, paramMap);
	}

	public List<OperationVo> getScheduleList(PageVo pv, Map<String, String> paramMap) {
		return dao.getScheduleList(sst, pv, paramMap);
	}

	public OperationVo goOperationDetail(String operationNo) {
		return dao.goOperationDetail(sst, operationNo);
	}

	public List<Integer> selectParticipants(String operationNo) {
        return dao.selectParticipants(sst, operationNo);
    }

	public int countParticipants(String operationNo) {
		return dao.countParticipants(sst, operationNo);
	}

	public List<MemberVo> getParticipantNames(List<Integer> participants) {
		return dao.getParticipantNames(sst, participants);
	}

	public int updateOperationDetail(OperationVo vo) {
		return dao.updateOperationDetail(sst, vo);
	}

	public int updateRoomStatus(String operatingRoomNo) {
		return dao.updateRoomStatus(sst, operatingRoomNo);
	}

	public List<MemberVo> getMemberList() {
		return dao.getMemberList(sst);
	}
	
	
	
	
	
}
