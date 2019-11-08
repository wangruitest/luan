package com.funo.regionCoords.model;

import java.util.List;

public class RegionPolygon {

	private Long regionId;
	private String regionIdIn;
	private String regionName;
	private String lat;
	private String lng;
	private Integer inNum;
	private Integer outNum;
	private Integer atNum;
	private Integer colorIndex;
	private Integer expediteValue;
	private Integer jamValue;
	private Double orderNumber;
	private List<RegionCoords> aRegionCoords;

	private String cityId;
	private Integer blueNum;
	private Integer yellowNum;
	private Integer orangeNum;
	private Integer redNum;
	private String date;

	public Long getRegionId() {
		return regionId;
	}

	public void setRegionId(Long regionId) {
		this.regionId = regionId;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public List<RegionCoords> getaRegionCoords() {
		return aRegionCoords;
	}

	public void setaRegionCoords(List<RegionCoords> aRegionCoords) {
		this.aRegionCoords = aRegionCoords;
	}

	public Integer getInNum() {
		return inNum;
	}

	public void setInNum(Integer inNum) {
		this.inNum = inNum;
	}

	public Integer getOutNum() {
		return outNum;
	}

	public void setOutNum(Integer outNum) {
		this.outNum = outNum;
	}

	public Integer getAtNum() {
		return atNum;
	}

	public void setAtNum(Integer atNum) {
		this.atNum = atNum;
	}

	public Integer getColorIndex() {
		return colorIndex;
	}

	public void setColorIndex(Integer colorIndex) {
		this.colorIndex = colorIndex;
	}

	public Integer getExpediteValue() {
		return expediteValue;
	}

	public void setExpediteValue(Integer expediteValue) {
		this.expediteValue = expediteValue;
	}

	public Integer getJamValue() {
		return jamValue;
	}

	public void setJamValue(Integer jamValue) {
		this.jamValue = jamValue;
	}

	public String getRegionIdIn() {
		return regionIdIn;
	}

	public void setRegionIdIn(String regionIdIn) {
		this.regionIdIn = regionIdIn;
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public Integer getBlueNum() {
		return blueNum;
	}

	public void setBlueNum(Integer blueNum) {
		this.blueNum = blueNum;
	}

	public Integer getYellowNum() {
		return yellowNum;
	}

	public void setYellowNum(Integer yellowNum) {
		this.yellowNum = yellowNum;
	}

	public Integer getOrangeNum() {
		return orangeNum;
	}

	public void setOrangeNum(Integer orangeNum) {
		this.orangeNum = orangeNum;
	}

	public Integer getRedNum() {
		return redNum;
	}

	public void setRedNum(Integer redNum) {
		this.redNum = redNum;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Double getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(Double orderNumber) {
		this.orderNumber = orderNumber;
	}

	
}
