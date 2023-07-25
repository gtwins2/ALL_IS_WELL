package com.kh.app.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.board.vo.InquiryVo;

@Repository
public class InquiryDao {

	public List<InquiryVo> inquiryList(SqlSessionTemplate sst, InquiryVo vo) {
		return sst.selectList("inquiry.inquiryList", vo);
	}

}
