package com.kh.app.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.app.board.dao.InquiryDao;
import com.kh.app.board.dao.NoticeDao;
import com.kh.app.board.vo.InquiryVo;
import com.kh.app.board.vo.NoticeReplyVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InquiryService {
	
	private final InquiryDao dao; 
	private final SqlSessionTemplate sst;; 
	
	
	public List<InquiryVo> inquiryList(PageVo pv) {
		return dao.inquiryList(sst, pv);
	}


	public int getListCnt() {
		return dao.getListCnt(sst);
	}


	public InquiryVo inquiryDetail(InquiryVo vo) {
		return dao.inquiryDetail(sst, vo);
	}


	public List<NoticeReplyVo> inquiryReply(NoticeReplyVo vo2) {
		return dao.inquiryReply(sst, vo2);
	}

}
