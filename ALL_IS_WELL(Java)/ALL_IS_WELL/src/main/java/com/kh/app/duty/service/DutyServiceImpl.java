package com.kh.app.duty.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.duty.dao.DutyDao;
import com.kh.app.duty.vo.DutyVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class DutyServiceImpl implements DutyService{

	private final DutyDao dao;
	private final SqlSessionTemplate sst;
	
	@Override
	public int select(Object params) {
		return dao.select(sst , params);
	}

	@Override
	public List<DutyVo> list() {
		return dao.list(sst);
	}

	@Override
	public int put(DutyVo vo) {
		return dao.put(sst , vo);
	}

}
