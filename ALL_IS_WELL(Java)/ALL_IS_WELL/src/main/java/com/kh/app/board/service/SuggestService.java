package com.kh.app.board.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.app.board.dao.NoticeDao;
import com.kh.app.board.dao.SuggestDao;
import com.kh.app.board.vo.SuggestVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SuggestService {
	
	private final SuggestDao dao; 
	private final SqlSessionTemplate sst;; 
	
	public List<SuggestVo> suggestList(PageVo pv, Map<String, String> paramMap) {
		return dao.suggestList(sst, pv, paramMap);
	}

	public int getListCnt(Map<String, String> paramMap) {
		return dao.getListCnt(sst, paramMap);
	}

	public SuggestVo suggestDetail(SuggestVo vo) {
		return dao.suggestDetail(sst, vo);
	}

	public int suggestWrite(SuggestVo vo) {
		return dao.suggestWrite(sst, vo);
	}

	public int suggestUpdate(SuggestVo vo) {
		return dao.suggestUpdate(sst, vo);
	}

}
