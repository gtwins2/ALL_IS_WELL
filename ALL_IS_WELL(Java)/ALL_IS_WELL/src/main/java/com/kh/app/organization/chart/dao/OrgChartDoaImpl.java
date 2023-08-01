package com.kh.app.organization.chart.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app.organization.vo.OrgVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class OrgChartDoaImpl implements OrgChartDao{
	
	public List<OrgVo> list(SqlSessionTemplate sst, OrgVo vo) {
		return sst.selectList("orgChart.getList" , vo);
	}


}
