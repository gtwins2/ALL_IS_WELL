package com.kh.app.inventory.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.inventory.vo.InventoryVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.dao.ProceedingDaoImpl;
import com.kh.app.proceeding.vo.ProceedingVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class InventoryDaoImpl implements InventoryDao{@Override
	public List<InventoryVo> list(SqlSessionTemplate sst, PageVo pv, Map<String, String> paramMap) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("inventory.selectBoardList" , paramMap , rb);
	}

	@Override
	public int getBoardCnt(SqlSessionTemplate sst) {
		return sst.selectOne("inventory.getBoardCnt");
	}

	@Override
	public List<InventoryVo> storeList(SqlSessionTemplate sst, PageVo pv, Map<String, String> paramMap) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("inventory.selectStoreList" , paramMap , rb);
	}

	@Override
	public List<InventoryVo> getItemName(SqlSessionTemplate sst) {
		return sst.selectList("inventory.getItemName");
	}

	@Override
	public int postInsert(SqlSessionTemplate sst, InventoryVo vo) {
		return sst.update("inventory.postInsert" , vo);
	}

	
	
	
}
