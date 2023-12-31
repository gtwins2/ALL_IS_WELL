package com.kh.app.board.service;

import java.util.List;
import java.util.Map;

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
	
	public List<NoticeVo> noticeList(PageVo pv, Map<String, String> paramMap) {
		return dao.noticeList(sst, pv, paramMap);
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

	public int getNoticeListCnt(Map<String, String> paramMap) {
		return dao.getNoticeListCnt(sst, paramMap);
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

	public int noticeFile(NoticeVo vo) {
		return dao.noticeFile(sst, vo);
	}

	public int fileUpdate(NoticeVo vo) {
		return dao.fileUpdate(sst, vo);
	}

	
}
