package com.kh.app.board.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.board.vo.NoticeReplyVo;
import com.kh.app.board.vo.NoticeVo;
import com.kh.app.page.vo.PageVo;

@Repository
public class NoticeDao {

	public List<NoticeVo> noticeList(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("notice.noticeList", pv, rb);
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

	public int getNoticeListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("notice.getNoticeListCnt");
	}

	public int noticeUpdate(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.insert("notice.noticeUpdate", vo);
	}

	public int noticeReplyDelete(SqlSessionTemplate sst, NoticeReplyVo vo) {
		return sst.update("notice.noticeReplyDelete", vo);
	}

	public int noticeReplyUpdate(SqlSessionTemplate sst, NoticeReplyVo vo) {
		return sst.update("notice.noticeReplyUpdate", vo);
	}

	public int noticeFile(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.insert("notice.noticeFile", vo);
	}

	public int fileUpdate(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.update("notice.fileUpdate", vo);
	}

}
