package com.kh.app.main.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app.member.vo.MemberVo;

@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarDao calendardao;
	
	@Override
	public List<Calendar> getCalendar(MemberVo loginMember) throws Exception {
		return calendardao.getCalendar(loginMember);
	}
  }
