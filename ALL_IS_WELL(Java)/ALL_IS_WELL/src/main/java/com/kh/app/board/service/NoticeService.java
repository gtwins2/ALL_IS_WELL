package com.kh.app.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.app.board.dao.NoticeDao;
import com.kh.app.board.vo.NoticeVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeService {
	
	private final NoticeDao dao; 
	private final SqlSessionTemplate sst;; 
	
	public List<NoticeVo> noticeList(NoticeVo vo) {
		return dao.noticeList(sst, vo);
	}

}
