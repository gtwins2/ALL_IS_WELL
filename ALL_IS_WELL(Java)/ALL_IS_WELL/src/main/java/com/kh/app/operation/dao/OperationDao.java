package com.kh.app.operation.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.member.vo.MemberVo;
import com.kh.app.operation.vo.OperationVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class OperationDao {
	
	
	//멤버 검색
	public List<MemberVo> searchName(SqlSessionTemplate sst, String name) {
		return sst.selectList("operation.searchMember", name);
	}

	public int getRoomCount(SqlSessionTemplate sst) {
		return sst.selectOne("operation.getRoomCount");
	}

	public List<OperationVo> getRoomList(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("operation.getRoomList", null, rb);
	}

	public int registerOperation(SqlSessionTemplate sst, OperationVo vo) {
		return sst.insert("operation.registerOperation", vo);
	}

	public int registerParticipants(SqlSessionTemplate sst, List<Integer> participantList) {
		int rowsInserted = 0;

	    for (int x : participantList) {
	        int rowsAffected = sst.insert("operation.registerParticipants", x);
	        rowsInserted += rowsAffected;
	    }

	    return rowsInserted;
		
		
	}

	public String getPatientNo(SqlSessionTemplate sst, String patientName) {
		return sst.selectOne("operation.getPatientNo", patientName);
	}

	public int updateRoom(SqlSessionTemplate sst, OperationVo vo) {
		return sst.update("operation.updateRoom", vo);
	}

	public int getScheduleListCount(SqlSessionTemplate sst) {
		return sst.selectOne("operation.getScheduleListCount");
	}

	public List<OperationVo> getScheduleList(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("operation.getScheduleList", null, rb);
	}

	public OperationVo goOperationDetail(SqlSessionTemplate sst, String operationNo) {
		return sst.selectOne("operation.goOperationDetail", operationNo);
	}

	public List<Integer> selectParticipants(SqlSessionTemplate sst, String operationNo) {
	    return sst.selectList("operation.selectParticipants", operationNo);
	}

	public int countParticipants(SqlSessionTemplate sst, String operationNo) {
		return sst.selectOne("operation.countParticipants", operationNo);
	}

	public List<MemberVo> getParticipantNames(SqlSessionTemplate sst, List<Integer> participants) {
		
		
		List<MemberVo> voList = new ArrayList<>();
		
		for(int i = 0; i < participants.size(); i++) {
			MemberVo vo = sst.selectOne("operation.getParticipantNames", participants.get(i));
			
			voList.add(vo);
		}
		
		return voList;
		
		
	}

	public int updateOperationDetail(SqlSessionTemplate sst, OperationVo vo) {
		return sst.update("operation.updateOperationDetail", vo);
	}

	public int updateRoomStatus(SqlSessionTemplate sst, String operatingRoomNo) {
		return sst.update("operation.updateRoomStatus", operatingRoomNo);
	}
}
