package com.kh.app.mail.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.admission.dao.admissionDao;
import com.kh.app.admission.service.AdmissionService;
import com.kh.app.mail.dao.mailDao;
import com.kh.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
@RequiredArgsConstructor
public class MailService {
	private final mailDao dao;
	private final SqlSessionTemplate sst;
	
	
	
	public List<MemberVo> searchEmail(String name) {
		return dao.searchEmail(sst, name);
	}



	public List<MemberVo> getAllMembers() {
		return dao.getAllMembers(sst);
	}
	
}
