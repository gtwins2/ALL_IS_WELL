package com.kh.app.organization.chart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class OrganizationChartController {
	@GetMapping("orgChart")
	public String orgChart() {
		return "orgChart/orgChart";
	}
}
