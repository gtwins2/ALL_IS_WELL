package com.kh.app.proceeding.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.vo.ProceedingVo;

public interface ProceedingDao {

	//�Խñ� ���				//board/list
	List<ProceedingVo> list(SqlSessionTemplate sst , PageVo pv);
	

	//�Խñ� �ۼ�				//board/write
	int write(SqlSessionTemplate sst , ProceedingVo vo);


	//�Խñ� ����ȸ(+��ȸ������)	//board/detail
	ProceedingVo detail(SqlSessionTemplate sst , String no);

	
	//�Խñ� ����				//board/edit
	int edit(SqlSessionTemplate sst , ProceedingVo vo);

	
	//�Խñ� ����				//board/delete
	int delete(SqlSessionTemplate sst , ProceedingVo vo);
	
	
	//��ȸ�� ����
	int increaseHit(SqlSessionTemplate sst , String no);

	
	//��ü �Խñ� ���� ��ȸ
	int getBoardCnt(SqlSessionTemplate sst);
	
}
