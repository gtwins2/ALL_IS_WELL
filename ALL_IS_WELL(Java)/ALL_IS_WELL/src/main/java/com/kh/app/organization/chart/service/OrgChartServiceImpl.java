
 package com.kh.app.organization.chart.service;
 
 import java.util.List;
 
 
 import org.mybatis.spring.SqlSessionTemplate; 
 import org.springframework.stereotype.Service; 
 import org.springframework.transaction.annotation.Transactional;
 
import com.kh.app.organization.chart.dao.OrgChartDao;
import com.kh.app.organization.vo.OrgVo; 
 
 import lombok.RequiredArgsConstructor;
 
 @Service
 
 @Transactional
 
 @RequiredArgsConstructor 
 public class OrgChartServiceImpl implements
 OrgChartService{
 
 private final OrgChartDao dao; private final SqlSessionTemplate sst;
 
 @Override 
 public List<OrgVo> list(OrgVo vo) {
	 return dao.list(sst, vo); 
	 }
 
 
 
 
 }
