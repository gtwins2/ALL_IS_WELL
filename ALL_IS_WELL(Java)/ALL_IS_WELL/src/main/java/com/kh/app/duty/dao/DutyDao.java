package com.kh.app.duty.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app.duty.vo.DutyVo;

public interface DutyDao {

	int select(SqlSessionTemplate sst, Object params);

	List<DutyVo> list(SqlSessionTemplate sst);

	int put(SqlSessionTemplate sst, DutyVo vo);

}
