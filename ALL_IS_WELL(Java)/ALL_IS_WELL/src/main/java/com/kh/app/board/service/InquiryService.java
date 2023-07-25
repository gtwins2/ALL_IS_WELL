package com.kh.app.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.app.board.dao.InquiryDao;
import com.kh.app.board.dao.NoticeDao;
import com.kh.app.board.vo.InquiryVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InquiryService {
	
	private final InquiryDao dao; 
	private final SqlSessionTemplate sst;; 
	
	
	public List<InquiryVo> inquiryList(InquiryVo vo) {
		return dao.inquiryList(sst, vo);
	}

}
