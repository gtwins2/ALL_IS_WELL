package com.kh.app.board.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.board.vo.SuggestVo;
import com.kh.app.page.vo.PageVo;

@Repository
public class SuggestDao {

	public List<SuggestVo> suggestList(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("suggest.suggestList", pv, rb);
	}

	public int getListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("suggest.getListCnt");
	}

}
