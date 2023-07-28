package com.kh.app.member.list.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.vo.ProceedingVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class MemberListDaoImpl implements MemberListDao{@Override
	
	public List<MemberVo> list(SqlSessionTemplate sst, PageVo pv, Map<String, String> paramMap) {
	RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
	return sst.selectList("member.selectMemberList" , paramMap , rb);
	}

	@Override
	public MemberVo getMemberByNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("member.getMemberByNo" , no);
	}

	@Override
	public int delete(SqlSessionTemplate sst, String no) {
		return sst.update("member.delete" , no);
	}

	@Override
	public int getBoardCnt(SqlSessionTemplate sst) {
		return sst.selectOne("member.getBoardCnt");
	}

}
