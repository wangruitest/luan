package com.funo.services;

import java.util.List;

public class TouristFromToAnhui {
	
	private Long count = null;
	private String countryId = null;
	private String countryName = null;
	private List<TouristInChina> list = null;
	
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public String getCountryId() {
		return countryId;
	}
	public void setCountryId(String countryId) {
		this.countryId = countryId;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public List<TouristInChina> getList() {
		return list;
	}
	public void setList(List<TouristInChina> list) {
		this.list = list;
	}
}
