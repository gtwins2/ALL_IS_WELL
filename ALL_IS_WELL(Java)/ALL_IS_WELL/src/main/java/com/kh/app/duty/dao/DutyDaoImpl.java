package com.kh.app.duty.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.duty.vo.DutyVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class DutyDaoImpl implements DutyDao{

	@Override
	public int select(SqlSessionTemplate sst, Object params) {
		return sst.insert("duty.insert" , params);
	}

	@Override
	public List<DutyVo> list(SqlSessionTemplate sst) {
		return sst.selectList("duty.getList");
	}

	@Override
	public int put(SqlSessionTemplate sst, DutyVo vo) {
		return sst.insert("duty.put" , vo);
	}

}
