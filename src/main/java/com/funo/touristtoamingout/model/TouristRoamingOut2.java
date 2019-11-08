package com.funo.touristtoamingout.model;

import java.io.Serializable;
import java.util.Date;

public class TouristRoamingOut2 implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String provinces;
	private String provinceid;
	private String sumroam;
	private String destination;
	private String destinationName;
	
	private String searchProvince;// 统计省份

	private String searchDestination;// 目的地查询条件
	private String statmonth;
	private String type;
	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getProvinceid() {
		return provinceid;
	}
	public void setProvinceid(String provinceid) {
		this.provinceid = provinceid;
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
	public String getSearchProvince() {
		return searchProvince;
	}
	public void setSearchProvince(String searchProvince) {
		this.searchProvince = searchProvince;
	}
	public String getProvinces() {
		return provinces;
	}
	public void setProvinces(String provinces) {
		this.provinces = provinces;
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
	@Override
	public String toString() {
		return "TouristRoamingOut2 [provinces=" + provinces + ", provinceid=" + provinceid + ", sumroam=" + sumroam
				+ ", destination=" + destination + ", destinationName=" + destinationName + ", searchProvince="
				+ searchProvince + ", searchDestination=" + searchDestination + ", statmonth=" + statmonth + ", type="
				+ type + "]";
	}
	
	
}