package com.funo.touristroamingin.model;

import java.io.Serializable;

public class TouristRomaingIn2 implements Serializable{
	/**
	 * 属性名称：serialVersionUID <br/>
	 * 类型：long
	 */
	private static final long serialVersionUID = 1L;
	private String city;
	private String cityid;
	private String sumroam;
	private String destination;
	private String destinationName;
	private String searchCity;// 统计市
    private String searchDestination;// 目的地查询条件
	private String statmonth;
	private String type;
	
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCityid() {
		return cityid;
	}
	public void setCityid(String cityid) {
		this.cityid = cityid;
	}
	public String getSumroam() {
		return sumroam;
	}
	public void setSumroam(String sumroam) {
		this.sumroam = sumroam;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getDestinationName() {
		return destinationName;
	}
	public void setDestinationName(String destinationName) {
		this.destinationName = destinationName;
	}
	public String getSearchCity() {
		return searchCity;
	}
	public void setSearchCity(String searchCity) {
		this.searchCity = searchCity;
	}
	public String getSearchDestination() {
		return searchDestination;
	}
	public void setSearchDestination(String searchDestination) {
		this.searchDestination = searchDestination;
	}
	public String getStatmonth() {
		return statmonth;
	}
	public void setStatmonth(String statmonth) {
		this.statmonth = statmonth;
	}
	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "TouristRomaingIn2 [city=" + city + ", cityid=" + cityid + ", sumroam=" + sumroam + ", destination="
				+ destination + ", destinationName=" + destinationName + ", searchCity=" + searchCity
				+ ", searchDestination=" + searchDestination + ", statmonth=" + statmonth + "]";
	}
	
	

}
