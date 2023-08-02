package com.kh.app.inventory.service;

import java.util.List;
import java.util.Map;

import com.kh.app.inventory.vo.InventoryVo;
import com.kh.app.page.vo.PageVo;
import com.kh.app.proceeding.vo.ProceedingVo;

public interface InventoryService {

	//inventory/list
	List<InventoryVo> list(PageVo pv, Map<String, String> paramMap);
	
	int getBoardCnt();

	List<InventoryVo> storeList(PageVo pv, Map<String, String> paramMap);
}
