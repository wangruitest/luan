package com.funo.regionsummarybyday.model;

import java.io.Serializable;
import java.util.Date;

public class RegionSummaryByday implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private Long areaCode;
	private Long tourists;
	private Long distinctCounts;
	private Date updatetime;
	private String regionId;
	private String cityCode;
	private String submitTime;
	private Date statDay;


	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setAreaCode(Long areaCode) {
		this.areaCode = areaCode;
	}

	public Long getAreaCode() {
		return areaCode;
	}

	public void setTourists(Long tourists) {
		this.tourists = tourists;
	}

	public Long getTourists() {
		return tourists;
	}

	public void setDistinctCounts(Long distinctCounts) {
		this.distinctCounts = distinctCounts;
	}

	public Long getDistinctCounts() {
		return distinctCounts;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}

	public String getRegionId() {
		return regionId;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	public String getCityCode() {
		return cityCode;
	}

	public void setSubmitTime(String submitTime) {
		this.submitTime = submitTime;
	}

	public String getSubmitTime() {
		return submitTime;
	}

	public void setStatDay(Date statDay) {
		this.statDay = statDay;
	}

	public Date getStatDay() {
		return statDay;
	}
}