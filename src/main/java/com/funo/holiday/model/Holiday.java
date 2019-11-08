package com.funo.holiday.model;

import java.io.Serializable;

public class Holiday implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String holidayName;
	private String firstDay;
	private String lastDay;
	private Integer holidayDays;
	
	//当前节假日所属年 
	private String beloneYear ;
	
	public String getBeloneYear() {
		return beloneYear;
	}
	public void setBeloneYear(String beloneYear) {
		this.beloneYear = beloneYear;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getHolidayName() {
		return holidayName;
	}
	public void setHolidayName(String holidayName) {
		this.holidayName = holidayName;
	}
	
	
	public String getFirstDay() {
		return firstDay;
	}
	public void setFirstDay(String firstDay) {
		this.firstDay = firstDay;
	}
	public String getLastDay() {
		return lastDay;
	}
	public void setLastDay(String lastDay) {
		this.lastDay = lastDay;
	}
	public Integer getHolidayDays() {
		return holidayDays;
	}
	public void setHolidayDays(Integer holidayDays) {
		this.holidayDays = holidayDays;
	}
	
	
	@Override
	public String toString() {
		return "Holiday [firstDay=" + firstDay + ", holidayDays=" + holidayDays
				+ ", holidayName=" + holidayName + ", id=" + id + ", lastDay="
				+ lastDay + "]";
	}
	
	
	

}
