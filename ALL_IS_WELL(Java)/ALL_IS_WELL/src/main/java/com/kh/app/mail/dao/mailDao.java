package com.kh.app.mail.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.mail.vo.MailVo;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.operation.vo.OperationVo;
import com.kh.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
@Transactional
public class mailDao {
	
	
	
	public List<MemberVo> searchEmail(SqlSessionTemplate sst, String name) {
		return sst.selectList("mail.searchEmail", name);
	}

	public List<MemberVo> getAllMembers(SqlSessionTemplate sst) {
		return sst.selectList("mail.getAllMembers");
	}

	public int registerEmail(SqlSessionTemplate sst, MailVo vo) {
		return sst.insert("mail.registerEmail", vo);
	}

	public int registerSenderMail(SqlSessionTemplate sst, MailVo vo) {
		return sst.insert("mail.registerSenderMail", vo);
	}

	public int registerReceiverMail(SqlSessionTemplate sst, MailVo vo) {
		return sst.insert("mail.registerReceiverMail", vo);
	}

	public int registerAttachment(SqlSessionTemplate sst, MailVo vo) {
		return sst.insert("mail.registerAttachment", vo);
	}

	public int getReceiveMailCount(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.selectOne("mail.getReceiveMailCount", paramMap);
	}

	public List<OperationVo> getReceiveMailList(SqlSessionTemplate sst, PageVo pv, Map<String, String> paramMap) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("mail.getReceiveMailList", paramMap, rb);
	}

	public int deleteReceiveMail(SqlSessionTemplate sst, String mailNo) {
		return sst.update("mail.deleteReceiveMail", mailNo);
	}

	public MailVo getMailDetail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("mail.getMailDetail", no);
	}

}
