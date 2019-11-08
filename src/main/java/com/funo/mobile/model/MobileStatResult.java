package com.funo.mobile.model;

import java.io.Serializable;

public class MobileStatResult implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private Long provinceIn;
	private Long provinceOut;

	
	private double convRate;
	private String areaCode;
	private String areaName;
	private Long countToCity;
	private Long countToScenic;
	
	private Long regionId;
    private String touristsum;
//    private String regionname;
    
    
    private String avgTime;
    private String title;
    
	private String lng;
	private String lat;
	
	private String ahLng;
	private String ahLat;
	
	private Long jamValue;
	private Long inStayTourists;
	private Long outStayTourists;
	private String regionName;
	
	
	private Long day1Sum;
	private Long day2Sum;
	private Long day3Sum;
	private Long day4Sum;
	private Long day5Sum;
	private Long dayMoreSum;
	
	private Long onetotwohCount;
	private Long twotosixhCount;
	private Long sixhtodayCount;
	private Long daytotwodCount;
    private Long moretwodCount;
	
    
    private Long level1Num;
    private Long level2Num;
    private Long level3Num;
    private Long level4Num;
    
    
	public Long getProvinceIn() {
		return provinceIn;
	}

	public void setProvinceIn(Long provinceIn) {
		this.provinceIn = provinceIn;
	}

	public Long getProvinceOut() {
		return provinceOut;
	}

	public void setProvinceOut(Long provinceOut) {
		this.provinceOut = provinceOut;
	}

	public double getConvRate() {
		return convRate;
	}

	public void setConvRate(double convRate) {
		this.convRate = convRate;
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public Long getCountToCity() {
		return countToCity;
	}

	public void setCountToCity(Long countToCity) {
		this.countToCity = countToCity;
	}

	public Long getCountToScenic() {
		return countToScenic;
	}

	public void setCountToScenic(Long countToScenic) {
		this.countToScenic = countToScenic;
	}

	public Long getRegionId() {
		return regionId;
	}

	public void setRegionId(Long regionId) {
		this.regionId = regionId;
	}

	public String getTouristsum() {
		return touristsum;
	}

	public void setTouristsum(String touristsum) {
		this.touristsum = touristsum;
	}


	public String getAvgTime() {
		return avgTime;
	}

	public void setAvgTime(String avgTime) {
		this.avgTime = avgTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public Long getJamValue() {
		return jamValue;
	}

	public void setJamValue(Long jamValue) {
		this.jamValue = jamValue;
	}

	public Long getInStayTourists() {
		return inStayTourists;
	}

	public void setInStayTourists(Long inStayTourists) {
		this.inStayTourists = inStayTourists;
	}

	public Long getOutStayTourists() {
		return outStayTourists;
	}

	public void setOutStayTourists(Long outStayTourists) {
		this.outStayTourists = outStayTourists;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public Long getDay1Sum() {
		return day1Sum;
	}

	public void setDay1Sum(Long day1Sum) {
		this.day1Sum = day1Sum;
	}

	public Long getDay2Sum() {
		return day2Sum;
	}

	public void setDay2Sum(Long day2Sum) {
		this.day2Sum = day2Sum;
	}

	public Long getDay3Sum() {
		return day3Sum;
	}

	public void setDay3Sum(Long day3Sum) {
		this.day3Sum = day3Sum;
	}

	public Long getDay4Sum() {
		return day4Sum;
	}

	public void setDay4Sum(Long day4Sum) {
		this.day4Sum = day4Sum;
	}
	
	public Long getDay5Sum() {
		return day5Sum;
	}

	public void setDay5Sum(Long day5Sum) {
		this.day5Sum = day5Sum;
	}

	public Long getDayMoreSum() {
		return dayMoreSum;
	}

	public void setDayMoreSum(Long dayMoreSum) {
		this.dayMoreSum = dayMoreSum;
	}

	public Long getOnetotwohCount() {
		return onetotwohCount;
	}

	public void setOnetotwohCount(Long onetotwohCount) {
		this.onetotwohCount = onetotwohCount;
	}

	public Long getTwotosixhCount() {
		return twotosixhCount;
	}

	public void setTwotosixhCount(Long twotosixhCount) {
		this.twotosixhCount = twotosixhCount;
	}

	public Long getSixhtodayCount() {
		return sixhtodayCount;
	}

	public void setSixhtodayCount(Long sixhtodayCount) {
		this.sixhtodayCount = sixhtodayCount;
	}

	public Long getDaytotwodCount() {
		return daytotwodCount;
	}

	public void setDaytotwodCount(Long daytotwodCount) {
		this.daytotwodCount = daytotwodCount;
	}

	public Long getMoretwodCount() {
		return moretwodCount;
	}

	public void setMoretwodCount(Long moretwodCount) {
		this.moretwodCount = moretwodCount;
	}

	public String getAhLng() {
		return ahLng;
	}

	public void setAhLng(String ahLng) {
		this.ahLng = ahLng;
	}

	public String getAhLat() {
		return ahLat;
	}

	public void setAhLat(String ahLat) {
		this.ahLat = ahLat;
	}

	public Long getLevel1Num() {
		return level1Num;
	}

	public void setLevel1Num(Long level1Num) {
		this.level1Num = level1Num;
	}

	public Long getLevel2Num() {
		return level2Num;
	}

	public void setLevel2Num(Long level2Num) {
		this.level2Num = level2Num;
	}

	public Long getLevel3Num() {
		return level3Num;
	}

	public void setLevel3Num(Long level3Num) {
		this.level3Num = level3Num;
	}

	public Long getLevel4Num() {
		return level4Num;
	}

	public void setLevel4Num(Long level4Num) {
		this.level4Num = level4Num;
	}

	
}
