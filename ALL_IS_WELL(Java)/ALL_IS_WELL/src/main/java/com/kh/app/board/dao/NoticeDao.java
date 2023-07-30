package com.kh.app.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.board.vo.NoticeReplyVo;
import com.kh.app.board.vo.NoticeVo;

@Repository
public class NoticeDao {

	public List<NoticeVo> noticeList(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.selectList("notice.noticeList", vo);
	}

	public NoticeVo noticeDetail(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.selectOne("notice.noticeDetail", vo);
	}

	public int noticeWrite(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.insert("notice.noticeWrite", vo);
	}

	public List<NoticeReplyVo> noticeReply(SqlSessionTemplate sst, NoticeReplyVo vo2) {
		return sst.selectList("notice.noticeReply", vo2);
	}

	public int replyWrite(SqlSessionTemplate sst, NoticeReplyVo vo) {
		return sst.insert("notice.replyWrite", vo);
	}

}
