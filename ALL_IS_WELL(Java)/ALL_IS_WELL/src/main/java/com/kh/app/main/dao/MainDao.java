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

	public int nineCount(SqlSessionTemplate sst) {
		return sst.selectOne("main.nineCount", sst);
	}
	
	public int eightCount(SqlSessionTemplate sst) {
		return sst.selectOne("main.eightCount", sst);
	}
	
	public int sevenCount(SqlSessionTemplate sst) {
		return sst.selectOne("main.sevenCount", sst);
	}
	
	public int sixCount(SqlSessionTemplate sst) {
		return sst.selectOne("main.sixCount", sst);
	}
	
	public int fiveCount(SqlSessionTemplate sst) {
		return sst.selectOne("main.fiveCount", sst);
	}

}
