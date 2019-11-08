package com.funo.provincereceivetourist.mgmt;

import java.util.List;

import com.funo.provincereceivetourist.model.ProvinceReceiveTourist;


public interface IProvinceReceiveTouristMgmt {

	public String getKey();

	public ProvinceReceiveTourist createProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist);

	public ProvinceReceiveTourist modifyProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist);

	public void deleteProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist);

	public void batchDeleteProvinceReceiveTourist(List<ProvinceReceiveTourist> provinceReceiveTouristList);

	public ProvinceReceiveTourist getProvinceReceiveTouristById(String unid);

	public List<ProvinceReceiveTourist> queryProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist);
	
	public List<ProvinceReceiveTourist> queryTouristCityMonth(ProvinceReceiveTourist provinceReceiveTourist);
	
	//获取地市日月度人数
	public List<ProvinceReceiveTourist> queryMonthTourist(ProvinceReceiveTourist provinceReceiveTourist);
	
	////地市年接待游客总数
	public List<ProvinceReceiveTourist> queryCityYearTourist(ProvinceReceiveTourist provinceReceiveTourist);
	
	public List<ProvinceReceiveTourist> queryCityRegionYearTourist(ProvinceReceiveTourist provinceReceiveTourist);
	
	//获取省-日接待境外游客、省内游客、省外游客
	public List<ProvinceReceiveTourist> queryProvinceDayReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist);

	//获取各地市监控景区数量
	public List<ProvinceReceiveTourist> queryCityIdFromCityRegions(ProvinceReceiveTourist provinceReceiveTourist);

	//城市游客接待量年度统计(统计当前年和上一年数据)
	public List<ProvinceReceiveTourist> queryCityRegionReceiverByYear(ProvinceReceiveTourist provinceReceiveTourist);
	//省份游客接待量年度统计(统计当前年和上一年数据)
	public List<ProvinceReceiveTourist> selectByProvinceYearRegionReceiver(ProvinceReceiveTourist provinceReceiveTourist);

	
	
}