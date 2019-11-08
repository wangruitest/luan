package com.funo.touristroamingovernightin.model;

import java.io.Serializable;
import java.util.Date;

public class TouristRoamingOvernightIn implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private Long count;
	private Long distinctCount;
	private Long areaCode;
	private String statMonth;
	private Date updatetime;
	private String cityCode;
	private Date submitTime;

	private String searchstr;//查询来源地条件
	
	private String searchTitlestr;// 目的地查询条件

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setCount(Long count) {
		this.count = count;
	}

	public Long getCount() {
		return count;
	}

	public void setDistinctCount(Long distinctCount) {
		this.distinctCount = distinctCount;
	}

	public Long getDistinctCount() {
		return distinctCount;
	}

	public void setAreaCode(Long areaCode) {
		this.areaCode = areaCode;
	}

	public Long getAreaCode() {
		return areaCode;
	}

	public void setStatMonth(String statMonth) {
		this.statMonth = statMonth;
	}

	public String getStatMonth() {
		return statMonth;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	public String getCityCode() {
		return cityCode;
	}

	public void setSubmitTime(Date submitTime) {
		this.submitTime = submitTime;
	}

	public Date getSubmitTime() {
		return submitTime;
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
	
	

}