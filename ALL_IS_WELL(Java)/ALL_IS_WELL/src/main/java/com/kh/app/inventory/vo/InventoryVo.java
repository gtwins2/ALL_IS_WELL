package com.kh.app.inventory.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class InventoryVo {

	private String no;
	private String memberNo;
	private String itemName;
	private List<Integer> categoryNoArr;
	private List<Integer> countArr;
	private int CategoryNo;
	private int count;
	private String inventoryCount;
	private String approvalDocumentNo;
	private Date createDate;
	private String memberName;
	private String departmentName;
	private String sign;
	
}
