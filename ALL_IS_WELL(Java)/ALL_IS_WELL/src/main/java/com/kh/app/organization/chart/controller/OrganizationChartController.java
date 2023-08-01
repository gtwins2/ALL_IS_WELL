package com.kh.app.organization.chart.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.app.organization.chart.service.OrgChartService;
import com.kh.app.organization.vo.OrgVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class OrganizationChartController {
	
	private final OrgChartService service;
	
	@GetMapping("orgChart")
	public String orgChart() {
		return "orgChart/orgChart";
	}

	@GetMapping("orgChartAdmin")
	public String orgChartAdmin(Model model) {
		OrgVo vo = new OrgVo();
		
		List<OrgVo> voList  = service.list(vo);
		
		model.addAttribute(voList);
		
		return "orgChart/orgChartAdmin";
	}
}
