//package com.kh.app.organization.chart.dao;
//
//import java.util.List;
//
//
//import org.apache.ibatis.session.RowBounds;
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.stereotype.Repository;
//
//import com.kh.app.member.vo.MemberVo;
//import com.kh.app.organization.vo.OrgVo;
//import com.kh.app.page.vo.PageVo;
//import com.kh.app.proceeding.dao.ProceedingDao;
//import com.kh.app.proceeding.vo.ProceedingVo;
//
//import lombok.RequiredArgsConstructor;
//
//@Repository
//@RequiredArgsConstructor
//public class OrgChartDoaImpl implements OrgChartDao{
//	
//	public List<OrgVo> list(SqlSessionTemplate sst, OrgVo vo) {
//		return sst.selectList("orgChart.getList" , vo);
//	}
//
//
//}
