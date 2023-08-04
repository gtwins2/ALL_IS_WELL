package com.kh.app.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.app.board.dao.NoticeDao;
import com.kh.app.board.vo.NoticeReplyVo;
import com.kh.app.board.vo.NoticeVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeService {
	
	private final NoticeDao dao; 
	private final SqlSessionTemplate sst;; 
	
	public List<NoticeVo> noticeList(PageVo pv) {
		return dao.noticeList(sst, pv);
	}

	public NoticeVo noticeDetail(NoticeVo vo) {
		return dao.noticeDetail(sst, vo);
	}

	public int noticeWrite(NoticeVo vo) {
		return dao.noticeWrite(sst, vo);
	}

	public List<NoticeReplyVo> noticeReply(NoticeReplyVo vo2) {
		return dao.noticeReply(sst, vo2);
	}

	public int replyWrite(NoticeReplyVo vo) {
		return dao.replyWrite(sst, vo);
	}

	public int getNoticeListCnt() {
		return dao.getNoticeListCnt(sst);
	}

	public int noticeUpdate(NoticeVo vo) {
		return dao.noticeUpdate(sst, vo);
	}

	public int noticeReplyDelete(NoticeReplyVo vo) {
		return dao.noticeReplyDelete(sst, vo);
	}

	public int noticeReplyUpdate(NoticeReplyVo vo) {
		return dao.noticeReplyUpdate(sst, vo);
	}

	
}
