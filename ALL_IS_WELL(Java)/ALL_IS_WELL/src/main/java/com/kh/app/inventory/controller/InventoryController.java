package com.kh.app.inventory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("inventory")
public class InventoryController {

	@GetMapping("storeList")
	public String storeList() {
		return "inventory/storeList";
	}

	@GetMapping("list")
	public String list() {
		return "inventory/list";
	}
	
}
