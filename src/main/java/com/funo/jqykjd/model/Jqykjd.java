package com.funo.jqykjd.model;

import java.io.Serializable;
import java.util.Date;

public class Jqykjd implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private String regionName;
  private String expediteValue;
  private String jamValue;
  private String cityCode;
  private String pm;
  private String wd;
  private String gxsj;
  private String pmUrl;
  private String wdUrl;
  private String inNum;
  private String type;
  private Integer page;
  private Integer pageSize;

  //
  
  public void setId(Long id){
    this.id = id;
  }
  public Long getId(){
    return id;
  }
  public void setRegionName(String regionName){
    this.regionName = regionName;
  }
  public String getRegionName(){
    return regionName;
  }
public String getExpediteValue() {
	return expediteValue;
}
public void setExpediteValue(String expediteValue) {
	this.expediteValue = expediteValue;
}
public String getJamValue() {
	return jamValue;
}
public void setJamValue(String jamValue) {
	this.jamValue = jamValue;
}
public String getCityCode() {
	return cityCode;
}
public void setCityCode(String cityCode) {
	this.cityCode = cityCode;
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
public String getInNum() {
	return inNum;
}
public void setInNum(String inNum) {
	this.inNum = inNum;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public Integer getPage() {
	return page;
}
public void setPage(Integer page) {
	this.page = page;
}
public Integer getPageSize() {
	return pageSize;
}
public void setPageSize(Integer pageSize) {
	this.pageSize = pageSize;
}
  

}