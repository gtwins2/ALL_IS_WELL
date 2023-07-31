package com.kh.app.board.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.board.vo.InquiryVo;
import com.kh.app.board.vo.NoticeReplyVo;
import com.kh.app.page.vo.PageVo;

@Repository
public class InquiryDao {

	public List<InquiryVo> inquiryList(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("inquiry.inquiryList", pv, rb);
	}

	public int getListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("inquiry.getListCnt");	
	}

	public InquiryVo inquiryDetail(SqlSessionTemplate sst, InquiryVo vo) {
		return sst.selectOne("inquiry.inquiryDetail", vo);
	}

	public List<NoticeReplyVo> inquiryReply(SqlSessionTemplate sst, NoticeReplyVo vo2) {
		return sst.selectList("inquiry.inquiryReply", vo2);
	}

}
