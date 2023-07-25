package com.kh.app.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.board.vo.SuggestVo;

@Repository
public class SuggestDao {

	public List<SuggestVo> suggestList(SqlSessionTemplate sst, SuggestVo vo) {
		return sst.selectList("suggest.suggestList", vo);
	}

}
