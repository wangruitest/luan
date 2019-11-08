package com.funo.services;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;

/**
 * webservices接口返回数据
 * @author Administrator
 *
 */
public class TouristFromToAnhuiResponse {

	private Object lstAllCountry;
	private String msg;
	/**
	 * 0－成功，1－失败，2－异常
	 */
	private String result;
	private String searchDate;
	
	public Object getLstAllCountry() {
		return lstAllCountry;
	}
	public void setLstAllCountry(Object lstAllCountry) {
		this.lstAllCountry = lstAllCountry;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getResult() {
		if(StringUtils.isEmpty(result)){
			result="1";
		}
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getSearchDate() {
		return searchDate;
	}
	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}
	
	public static void main(String[] args) {
		TouristFromToAnhuiResponse rsp = new TouristFromToAnhuiResponse();
		rsp.setResult("0");
		rsp.setMsg("数据返回成功！");
		rsp.setSearchDate("2015-08-19");
		
		TouristFromToAnhui usa = new TouristFromToAnhui();
		usa.setCount(0L);
		usa.setCountryId("I001");
		usa.setCountryName("美国/加拿大");
		usa.setList(null);
		
		TouristFromToAnhui xg = new TouristFromToAnhui();
		xg.setCount(0L);
		xg.setCountryId("I175");
		xg.setCountryName("香港");
		xg.setList(null);
		
		TouristFromToAnhui zg = new TouristFromToAnhui();
		zg.setCountryId("I999");
		zg.setCountryName("中国");
		TouristInChina bj = new TouristInChina();
		bj.setCount(11L);
		bj.setProvinceId("110000");
		bj.setProvinceName("北京市");
		TouristInChina tj = new TouristInChina();
		tj.setCount(11L);
		tj.setProvinceId("120000");
		tj.setProvinceName("天津市");
		List<TouristInChina> tics = new ArrayList<TouristInChina>();
		tics.add(bj);
		tics.add(tj);
		zg.setList(tics);
		
		List<TouristFromToAnhui> lstAllCountry = new ArrayList<TouristFromToAnhui>();
		lstAllCountry.add(usa);
		lstAllCountry.add(xg);
		lstAllCountry.add(zg);
		
		rsp.setLstAllCountry(lstAllCountry);
		
		JSONObject result=new JSONObject();
		result = JSONObject.fromObject(rsp); 
		String resultStr = result.toString();
		System.out.println(resultStr);
	}
	
}
