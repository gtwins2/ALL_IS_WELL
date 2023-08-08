package com.kh.app.main.controller;

import java.util.Calendar;
import java.util.List;

import com.kh.app.member.vo.MemberVo;

public interface CalendarService {

	List<Calendar> getCalendar(MemberVo loginMember) throws Exception;

	List<Calendar> getCalendar();

}
