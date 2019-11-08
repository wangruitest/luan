package com.funo.mobile.model;

public class ReportOne {

	private String cityId;
	private String count;
	private String date;
	private String year;
	private String type;//1景区2城市,3去年城市
	private String regionIds;
	private String userId;
	
	public String getCityId() {
		return cityId;
	}
	public void setCityId(String cityId) {
		this.cityId = cityId;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRegionIds() {
		return regionIds;
	}
	public void setRegionIds(String regionIds) {
		this.regionIds = regionIds;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
