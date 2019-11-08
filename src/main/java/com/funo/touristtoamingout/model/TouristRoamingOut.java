package com.funo.touristtoamingout.model;

import java.io.Serializable;
import java.util.Date;

public class TouristRoamingOut implements Serializable{

	private static final long serialVersionUID = 1L;

	private String provinces;

	private Long sumroam;// 总数

	private String statmonth;

	private Long hfroam;// 合肥市
	private Long whroam;// 芜湖市
	private Long bbroam;// 蚌埠市
	private Long hnroam;// 淮南市
	private Long masroam;// 马鞍山市
	private Long hbroam;// 淮北市
	private Long tlroam;// 铜陵市
	private Long aqroam;// 安庆市
	private Long hsroam;// 黄山市
	private Long chuzroam;// 滁州市
	private Long fyroam;// 阜阳市
	private Long szroam;// 宿州市
	private Long laroam;// 六安市
	private Long hzroam;// 亳州市
	private Long chizroam;// 池州市
	private Long xcroam;// 宣城市

	private String searchProvince;// 统计省份

	private String searchTitlestr;// 目的地查询条件
  
	public String getProvinces() {
		return provinces;
	}

	public void setProvinces(String provinces) {
		this.provinces = provinces;
	}

	public void setSumroam(Long sumroam) {
		this.sumroam = sumroam;
	}

	public Long getSumroam() {
		return sumroam;
	}

	public String getStatmonth() {
		return statmonth;
	}

	public void setStatmonth(String statmonth) {
		this.statmonth = statmonth;
	}

	public Long getHfroam() {
		return hfroam;
	}

	public void setHfroam(Long hfroam) {
		this.hfroam = hfroam;
	}

	public Long getWhroam() {
		return whroam;
	}

	public void setWhroam(Long whroam) {
		this.whroam = whroam;
	}

	public Long getBbroam() {
		return bbroam;
	}

	public void setBbroam(Long bbroam) {
		this.bbroam = bbroam;
	}

	public Long getHnroam() {
		return hnroam;
	}

	public void setHnroam(Long hnroam) {
		this.hnroam = hnroam;
	}

	public Long getMasroam() {
		return masroam;
	}

	public void setMasroam(Long masroam) {
		this.masroam = masroam;
	}

	public Long getHbroam() {
		return hbroam;
	}

	public void setHbroam(Long hbroam) {
		this.hbroam = hbroam;
	}

	public Long getTlroam() {
		return tlroam;
	}

	public void setTlroam(Long tlroam) {
		this.tlroam = tlroam;
	}

	public Long getAqroam() {
		return aqroam;
	}

	public void setAqroam(Long aqroam) {
		this.aqroam = aqroam;
	}

	public Long getHsroam() {
		return hsroam;
	}

	public void setHsroam(Long hsroam) {
		this.hsroam = hsroam;
	}

	public Long getChuzroam() {
		return chuzroam;
	}

	public void setChuzroam(Long chuzroam) {
		this.chuzroam = chuzroam;
	}

	public Long getFyroam() {
		return fyroam;
	}

	public void setFyroam(Long fyroam) {
		this.fyroam = fyroam;
	}

	public Long getSzroam() {
		return szroam;
	}

	public void setSzroam(Long szroam) {
		this.szroam = szroam;
	}

	public Long getLaroam() {
		return laroam;
	}

	public void setLaroam(Long laroam) {
		this.laroam = laroam;
	}

	public Long getHzroam() {
		return hzroam;
	}

	public void setHzroam(Long hzroam) {
		this.hzroam = hzroam;
	}

	public Long getChizroam() {
		return chizroam;
	}

	public void setChizroam(Long chizroam) {
		this.chizroam = chizroam;
	}

	public Long getXcroam() {
		return xcroam;
	}

	public void setXcroam(Long xcroam) {
		this.xcroam = xcroam;
	}

	public String getSearchProvince() {
		return searchProvince;
	}

	public void setSearchProvince(String searchProvince) {
		this.searchProvince = searchProvince;
	}

	public String getSearchTitlestr() {
		return searchTitlestr;
	}

	public void setSearchTitlestr(String searchTitlestr) {
		this.searchTitlestr = searchTitlestr;
	}
  
	


}