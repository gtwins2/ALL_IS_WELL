package com.kh.app.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.board.vo.InquiryVo;
import com.kh.app.board.vo.NoticeReplyVo;
import com.kh.app.board.vo.SuggestVo;
import com.kh.app.page.vo.PageVo;

@Repository
public class InquiryDao {

	public List<InquiryVo> inquiryList(SqlSessionTemplate sst, PageVo pv, Map<String, String> paramMap) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("inquiry.inquiryList", paramMap, rb);
	}

	public int getListCnt(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.selectOne("inquiry.getListCnt", paramMap);	
	}

	public InquiryVo inquiryDetail(SqlSessionTemplate sst, InquiryVo vo) {
		return sst.selectOne("inquiry.inquiryDetail", vo);
	}

	public List<InquiryVo> inquiryReply(SqlSessionTemplate sst, NoticeReplyVo vo2) {
		return sst.selectList("inquiry.inquiryReply", vo2);
	}

	public int inquiryUpdate(SqlSessionTemplate sst, InquiryVo vo) {
		return sst.update("inquiry.inquiryUpdate", vo);
	}

	public int inquiryWrite(SqlSessionTemplate sst, InquiryVo vo) {
		return sst.insert("inquiry.inquiryWrite", vo);
	}

	public int replyWrite(SqlSessionTemplate sst, InquiryVo vo) {
		return sst.insert("inquiry.replyWrite", vo);
	}

	public int inquiryReplyUpdate(SqlSessionTemplate sst, InquiryVo vo) {
		return sst.update("inquiry.inquiryReplyUpdate", vo);
	}

	public int inquiryReplyDelete(SqlSessionTemplate sst, InquiryVo vo) {
		return sst.update("inquiry.inquiryReplyDelete", vo);
	}


}
