package com.funo.touristroaming.model;

import java.io.Serializable;

public class TouristRoaming implements Serializable{

  private static final long serialVersionUID = 1L;
	
  
    private String countyName;
    private String countyCode;
    private Long countyCount;
	private Long areaCount;
	private String areaName;
	private String statMonth;
	private String provinceName;
	private Long totalCount;
	private Long interCode;

	private String searchstr;// 来源地查询条件

	private String searchTitlestr;// 目的地查询条件
  

	public Long getInterCode() {
		return interCode;
	}

	public void setInterCode(Long interCode) {
		this.interCode = interCode;
	}

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public Long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}

	public Long getAreaCount() {
		return areaCount;
	}

	public void setAreaCount(Long areaCount) {
		this.areaCount = areaCount;
	}

	public String getAreaName() {
		return areaName;
	}

	public String getStatMonth() {
		return statMonth;
	}

	public void setStatMonth(String statMonth) {
		this.statMonth = statMonth;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getSearchstr() {
		return searchstr;
	}

	public void setSearchstr(String searchstr) {
		this.searchstr = searchstr;
	}

	public String getSearchTitlestr() {
		return searchTitlestr;
	}

	public void setSearchTitlestr(String searchTitlestr) {
		this.searchTitlestr = searchTitlestr;
	}

	public String getCountyName() {
		return countyName;
	}

	public void setCountyName(String countyName) {
		this.countyName = countyName;
	}

	public Long getCountyCount() {
		return countyCount;
	}

	public void setCountyCount(Long countyCount) {
		this.countyCount = countyCount;
	}

	public String getCountyCode() {
		return countyCode;
	}

	public void setCountyCode(String countyCode) {
		this.countyCode = countyCode;
	}




}