package com.kh.app.inventory.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.inventory.dao.InventoryDao;
import com.kh.app.inventory.vo.InventoryVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.dao.ProceedingDao;
import com.kh.app.proceeding.vo.ProceedingVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class InventoryServiceImpl implements InventoryService {

	private final InventoryDao dao;
	private final SqlSessionTemplate sst;
	
	@Override
	public List<InventoryVo> list(PageVo pv , Map<String, String> paramMap) {
		return dao.list(sst, pv , paramMap);
	}

	@Override
	public int getBoardCnt() {
		return dao.getBoardCnt(sst);
	}
	
}
