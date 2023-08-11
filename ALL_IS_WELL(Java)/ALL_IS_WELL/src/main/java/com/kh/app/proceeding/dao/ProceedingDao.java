package com.kh.app.proceeding.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app.member.vo.MemberVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.vo.ProceedingVo;

public interface ProceedingDao {

	//�Խñ� ���				//board/list
	List<ProceedingVo> list(SqlSessionTemplate sst , PageVo pv, Map<String, String> paramMap);
	

	//��ü �Խñ� ���� ��ȸ
	int getBoardCnt(SqlSessionTemplate sst , Map<String, String> paramMap);
	
	//�Խñ� �ۼ�				//board/write
	int write(SqlSessionTemplate sst , ProceedingVo vo);

	//�Խñ� ����				//board/edit
	int edit(SqlSessionTemplate sst , ProceedingVo vo);

	
	//�Խñ� ����				//board/delete
	int delete(SqlSessionTemplate sst , String no);
	
	
	//��ȸ�� ����
	int increaseHit(SqlSessionTemplate sst , String no);

	


	ProceedingVo getProceedingByNo(SqlSessionTemplate sst , String no);
	
}
