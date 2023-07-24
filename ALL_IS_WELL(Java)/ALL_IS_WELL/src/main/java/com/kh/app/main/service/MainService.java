package com.kh.app.main.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.app.attendance.vo.AttendanceVo;
import com.kh.app.main.dao.MainDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainService {
	
	private final MainDao dao;
	private final SqlSessionTemplate sst;
	
	
	public int attend(AttendanceVo vo) {
		return dao.attend(sst, vo);
	}


	public int leave(AttendanceVo vo) {
		return dao.leave(sst, vo);
	}

}
