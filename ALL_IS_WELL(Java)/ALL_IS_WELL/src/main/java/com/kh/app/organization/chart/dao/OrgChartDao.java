package com.kh.app.organization.chart.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app.organization.vo.OrgVo;

public interface OrgChartDao {

	//orgChart/list
	List<OrgVo> list(SqlSessionTemplate sst , OrgVo vo);
	
}
