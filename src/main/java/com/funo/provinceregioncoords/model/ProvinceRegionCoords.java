package com.funo.provinceregioncoords.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


public class ProvinceRegionCoords implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private Long regionId;
	private Long coordsIndex;
	private String lat;
	private String lng;

	private String regionIdIn;
	private String regionName;
	private Integer inNum;
	
	private String typename;
	
	private Integer outNum;
	private Integer atNum;
	private Integer colorIndex;
	private Integer expediteValue;
	private Integer jamValue;
	private List<ProvinceRegionCoords> aRegionCoords;
	
	private Long cityCode;
	
	private String notes;
	private String updateuser;
	private Date updatetime;
	private String typeid;
	private Long isvalid;
	private String aradius;
	private String imgurl;
	private Long minStaytime;
	private String submitTime;
	private String unid;
	private String pm;
	private String wd;
	private String gxsj;
	private String pmUrl;
	private String wdUrl;

	public String getRegionIdIn() {
		return regionIdIn;
	}

	public void setRegionIdIn(String regionIdIn) {
		this.regionIdIn = regionIdIn;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
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

	public List<ProvinceRegionCoords> getaRegionCoords() {
		return aRegionCoords;
	}

	public void setaRegionCoords(List<ProvinceRegionCoords> aRegionCoords) {
		this.aRegionCoords = aRegionCoords;
	}


	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setRegionId(Long regionId) {
		this.regionId = regionId;
	}

	public Long getRegionId() {
		return regionId;
	}

	public void setCoordsIndex(Long coordsIndex) {
		this.coordsIndex = coordsIndex;
	}

	public Long getCoordsIndex() {
		return coordsIndex;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLat() {
		return lat;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getLng() {
		return lng;
	}

	public Long getCityCode() {
		return cityCode;
	}

	public void setCityCode(Long cityCode) {
		this.cityCode = cityCode;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getUpdateuser() {
		return updateuser;
	}

	public void setUpdateuser(String updateuser) {
		this.updateuser = updateuser;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public String getTypeid() {
		return typeid;
	}

	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}

	public Long getIsvalid() {
		return isvalid;
	}

	public void setIsvalid(Long isvalid) {
		this.isvalid = isvalid;
	}

	public String getAradius() {
		return aradius;
	}

	public void setAradius(String aradius) {
		this.aradius = aradius;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public Long getMinStaytime() {
		return minStaytime;
	}

	public void setMinStaytime(Long minStaytime) {
		this.minStaytime = minStaytime;
	}

	public String getSubmitTime() {
		return submitTime;
	}

	public void setSubmitTime(String submitTime) {
		this.submitTime = submitTime;
	}

	public String getUnid() {
		return unid;
	}

	public void setUnid(String unid) {
		this.unid = unid;
	}

	public String getPm() {
		return pm;
	}

	public void setPm(String pm) {
		this.pm = pm;
	}

	public String getWd() {
		return wd;
	}

	public void setWd(String wd) {
		this.wd = wd;
	}

	public String getGxsj() {
		return gxsj;
	}

	public void setGxsj(String gxsj) {
		this.gxsj = gxsj;
	}

	public String getPmUrl() {
		return pmUrl;
	}

	public void setPmUrl(String pmUrl) {
		this.pmUrl = pmUrl;
	}

	public String getWdUrl() {
		return wdUrl;
	}

	public void setWdUrl(String wdUrl) {
		this.wdUrl = wdUrl;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}
	
	

}