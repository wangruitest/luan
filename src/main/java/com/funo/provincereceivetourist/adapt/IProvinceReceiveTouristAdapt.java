package com.funo.provincereceivetourist.adapt;

import java.util.List;

import com.funo.provincereceivetourist.model.ProvinceReceiveTourist;


public interface IProvinceReceiveTouristAdapt {

	public String getKey();

	public ProvinceReceiveTourist createProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist);

	public ProvinceReceiveTourist modifyProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist);

	public void deleteProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist);

	public void batchDeleteProvinceReceiveTourist(List<ProvinceReceiveTourist> provinceReceiveTouristList);

	public ProvinceReceiveTourist getProvinceReceiveTouristById(String unid);

	public List<ProvinceReceiveTourist> queryProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist);
	
	public List<ProvinceReceiveTourist> queryTouristCityMonth(ProvinceReceiveTourist provinceReceiveTourist);
	
	public List<ProvinceReceiveTourist> queryMonthTourist(ProvinceReceiveTourist provinceReceiveTourist);
	
	//地市年接待游客总数
	public List<ProvinceReceiveTourist> queryCityYearTourist(ProvinceReceiveTourist provinceReceiveTourist);
	//获取地市年度景区热度排行
	public List<ProvinceReceiveTourist> queryCityRegionYearTourist(ProvinceReceiveTourist provinceReceiveTourist);

	public List<ProvinceReceiveTourist> queryProvinceDayReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist);
	
	public List<ProvinceReceiveTourist> queryCityIdFromCityRegions(ProvinceReceiveTourist provinceReceiveTourist);
	
	//城市游客接待量年度统计(统计当前年和上一年数据)
	public List<ProvinceReceiveTourist> queryCityRegionReveiverTourist(ProvinceReceiveTourist provinceReceiveTourist);
	//城市游客接待量年度统计(统计当前年和上一年数据)
	public List<ProvinceReceiveTourist> selectByProvinceYearRegionReceiver(ProvinceReceiveTourist provinceReceiveTourist);
		
	
}