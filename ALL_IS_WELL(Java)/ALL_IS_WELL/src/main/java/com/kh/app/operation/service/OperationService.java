package com.kh.app.operation.service;

import java.util.List;

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

	public int getRoomCount() {
		return dao.getRoomCount(sst);
	}

	public List<OperationVo> getRoomList(PageVo pv) {
		return dao.getRoomList(sst, pv);
	}
	
	
	
	
	
}
