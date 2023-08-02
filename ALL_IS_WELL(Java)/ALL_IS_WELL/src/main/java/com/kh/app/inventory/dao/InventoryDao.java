package com.kh.app.inventory.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app.inventory.vo.InventoryVo;
import com.kh.app.page.vo.PageVo;

public interface InventoryDao {

	//�Խñ� ���				//board/list
	List<InventoryVo> list(SqlSessionTemplate sst , PageVo pv, Map<String, String> paramMap);
	

	//��ü �Խñ� ���� ��ȸ
	int getBoardCnt(SqlSessionTemplate sst);


	List<InventoryVo> storeList(SqlSessionTemplate sst, PageVo pv, Map<String, String> paramMap);
	
}
