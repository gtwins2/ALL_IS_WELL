package com.kh.app.main.controller;

import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.app.member.vo.MemberVo;

@Repository("calendarDao")
public class CalendarDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<Calendar> getCalendar(MemberVo loginMember) throws Exception {
		List<Calendar> calendar = null;
		calendar = sqlSession.selectList("Calendar.calendarList", loginMember);
		return calendar;
		
	}
}