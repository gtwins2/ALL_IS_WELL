package com.kh.app.main.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.attendance.vo.AttendanceVo;
import com.kh.app.page.vo.PageVo;

@Repository
public class MainDao {

	public int attend(SqlSessionTemplate sst, AttendanceVo vo) {
		return sst.insert("main.attend", vo);
		
	}

	public int leave(SqlSessionTemplate sst, AttendanceVo vo) {
		return sst.update("main.leave", vo);
	}

	public int mCount(SqlSessionTemplate sst) {
		return sst.selectOne("main.mCount");
	}

	public int fCount(SqlSessionTemplate sst) {
		return sst.selectOne("main.fCount");
	}

}
