package com.kh.app.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.board.vo.SuggestVo;
import com.kh.app.page.vo.PageVo;

@Repository
public class SuggestDao {

	public List<SuggestVo> suggestList(SqlSessionTemplate sst, PageVo pv, Map<String, String> paramMap) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("suggest.suggestList", paramMap, rb);
	}

	public int getListCnt(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.selectOne("suggest.getListCnt", paramMap);
	}

	public SuggestVo suggestDetail(SqlSessionTemplate sst, SuggestVo vo) {
		return sst.selectOne("suggest.suggestDetail", vo);
	}

	public int suggestWrite(SqlSessionTemplate sst, SuggestVo vo) {
		return sst.insert("suggest.suggestWrite", vo);
	}

	public int suggestUpdate(SqlSessionTemplate sst, SuggestVo vo) {
		return sst.update("suggest.suggestUpdate", vo);
	}

}
