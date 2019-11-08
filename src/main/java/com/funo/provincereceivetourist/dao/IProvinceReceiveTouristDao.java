package com.funo.provincereceivetourist.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.provincereceivetourist.model.ProvinceReceiveTourist;

public interface IProvinceReceiveTouristDao extends CommonDao<ProvinceReceiveTourist> {
	
	public List<ProvinceReceiveTourist> queryByCityMonth(ProvinceReceiveTourist p);
	
	//获取月度人数
	public List<ProvinceReceiveTourist> queryByMonthTourist(ProvinceReceiveTourist p);
	
	public List<ProvinceReceiveTourist> queryByCityYearTourist(ProvinceReceiveTourist p);
	//获取地市年度景区热度排行
	public List<ProvinceReceiveTourist> queryByCityRegionYearTourist(ProvinceReceiveTourist p);
	
	//获取省-日接待境外游客、省内游客、省外游客
	public List<ProvinceReceiveTourist> queryByProvinceDayReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist);

	//获各地市监控景区数量
	public List<ProvinceReceiveTourist> queryByCityIdFromCityRegions(ProvinceReceiveTourist provinceReceiveTourist);
    
	//城市游客接待量年度统计(统计当前年和上一年数据)
	public List<ProvinceReceiveTourist> selectByCityYearRegionReceiver(ProvinceReceiveTourist provinceReceiveTourist);	    
	//省份游客接待量年度统计(统计当前年和上一年数据)
	public List<ProvinceReceiveTourist> selectByProvinceYearRegionReceiver(ProvinceReceiveTourist provinceReceiveTourist);	    

}