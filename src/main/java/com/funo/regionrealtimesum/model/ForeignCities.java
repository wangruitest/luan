package com.funo.regionrealtimesum.model;

import java.io.Serializable;

public class ForeignCities implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String sumtourists;
	
	private String city;
	
	private String regionId;
	
	private String regionName;
	
	private String time;
	
	private String searchType;
	
	private String beginTime;
	
	private String endTime;
	
	private String qBegin;
	
	private String qEnd;
	
	private String cityid;
	
	private String provinces_code;

	public String getSumtourists() {
		return sumtourists;
	}

	public void setSumtourists(String sumtourists) {
		this.sumtourists = sumtourists;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getRegionId() {
		return regionId;
	}

	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getqBegin() {
		return qBegin;
	}

	public void setqBegin(String qBegin) {
		this.qBegin = qBegin;
	}

	public String getqEnd() {
		return qEnd;
	}

	public void setqEnd(String qEnd) {
		this.qEnd = qEnd;
	}

	public String getCityid() {
		return cityid;
	}

	public void setCityid(String cityid) {
		this.cityid = cityid;
	}

	public String getProvinces_code() {
		return provinces_code;
	}

	public void setProvinces_code(String provinces_code) {
		this.provinces_code = provinces_code;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
}
