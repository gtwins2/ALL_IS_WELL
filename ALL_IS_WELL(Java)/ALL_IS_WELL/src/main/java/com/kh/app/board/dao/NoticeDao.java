package com.kh.app.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.board.vo.NoticeVo;

@Repository
public class NoticeDao {

	public List<NoticeVo> noticeList(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.selectList("notice.noticeList", vo);
	}

}
