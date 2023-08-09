package com.kh.app.board.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.app.board.dao.InquiryDao;
import com.kh.app.board.dao.NoticeDao;
import com.kh.app.board.vo.InquiryVo;
import com.kh.app.board.vo.NoticeReplyVo;
import com.kh.app.board.vo.NoticeVo;
import com.kh.app.board.vo.SuggestVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InquiryService {
	
	private final InquiryDao dao; 
	private final SqlSessionTemplate sst;; 
	
	
	public List<InquiryVo> inquiryList(PageVo pv, Map<String, String> paramMap) {
		return dao.inquiryList(sst, pv, paramMap);
	}


	public int getListCnt(Map<String, String> paramMap) {
		return dao.getListCnt(sst, paramMap);
	}


	public InquiryVo inquiryDetail(InquiryVo vo) {
		return dao.inquiryDetail(sst, vo);
	}


	public List<InquiryVo> inquiryReply(NoticeReplyVo vo2) {
		return dao.inquiryReply(sst, vo2);
	}


	public int inquiryUpdate(InquiryVo vo) {
		return dao.inquiryUpdate(sst, vo);
	}


	public int inquiryWrite(InquiryVo vo) {
		return dao.inquiryWrite(sst, vo);
	}


	public int replyWrite(InquiryVo vo) {
		return dao.replyWrite(sst, vo);
	}


	public int inquiryReplyUpdate(InquiryVo vo) {
		return dao.inquiryReplyUpdate(sst, vo);
	}


	public int inquiryReplyDelete(InquiryVo vo) {
		return dao.inquiryReplyDelete(sst, vo);
	}



}
