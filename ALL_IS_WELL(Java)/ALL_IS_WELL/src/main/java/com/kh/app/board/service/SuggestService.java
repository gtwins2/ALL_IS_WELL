package com.kh.app.board.service;

import java.util.List;

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
	
	public List<SuggestVo> suggestList(PageVo pv) {
		return dao.suggestList(sst, pv);
	}

	public int getListCnt() {
		return dao.getListCnt(sst);
	}

}
