package com.kh.app.duty.service;

import java.util.List;

import com.kh.app.duty.vo.DutyVo;

public interface DutyService {

	int select(Object params);

	List<DutyVo> list();

	int put(DutyVo vo);

	
	
}
