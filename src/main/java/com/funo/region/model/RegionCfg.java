
package com.funo.region.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RegionCfg implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private String unid;
  private Long id;
  private String regionName;
  private String notes;
  private String updateuser;
  private Date updatetime;
  private String typeid;
  private Long isvalid;
  private String lat;
  private String lng;
  private String aradius;
  private String expediteValue;
  private String jamValue;
  private String imgurl;
  private Long minStaytime;
  private String typename;
  private String cityCode;
  private String countyCode;
  private String cityName;
  private String countyName;
  private String iskey;
  private String submitTime;
  private Long sendareaId;
  
  private String LoginUserId;
  private Long businessid;
  
  private String businessidStr;

  private Long aLevel;
  private Double orderNumber;
   
  public String getBusinessidStr() {
	return businessidStr;
}
public void setBusinessidStr(String businessidStr) {
	this.businessidStr = businessidStr;
}
public Long getBusinessid() {
	return businessid;
}
public void setBusinessid(Long businessid) {
	this.businessid = businessid;
}
public void setRegionName(String regionName){
    this.regionName = regionName;
  }
  public String getRegionName(){
    return regionName;
  }
  public void setNotes(String notes){
    this.notes = notes;
  }
  public String getNotes(){
    return notes;
  }
  public void setUpdateuser(String updateuser){
    this.updateuser = updateuser;
  }
  public String getUpdateuser(){
    return updateuser;
  }
  public void setUpdatetime(Date updatetime){
    this.updatetime = updatetime;
  }
  public Date getUpdatetime(){
    return updatetime;
  }
  public void setTypeid(String typeid){
    this.typeid = typeid;
  }
  public String getTypeid(){
    return typeid;
  }
  public void setIsvalid(Long isvalid){
    this.isvalid = isvalid;
  }
  public Long getIsvalid(){
    return isvalid;
  }
  public void setLat(String lat){
    this.lat = lat;
  }
  public String getLat(){
    return lat;
  }
  public void setLng(String lng){
    this.lng = lng;
  }
  public String getLng(){
    return lng;
  }
  public void setAradius(String aradius){
    this.aradius = aradius;
  }
  public String getAradius(){
    return aradius;
  }
  public void setExpediteValue(String expediteValue){
    this.expediteValue = expediteValue;
  }
  public String getExpediteValue(){
    return expediteValue;
  }
  public void setJamValue(String jamValue){
    this.jamValue = jamValue;
  }
  public String getJamValue(){
    return jamValue;
  }
  public void setImgurl(String imgurl){
    this.imgurl = imgurl;
  }
  public String getImgurl(){
    return imgurl;
  }
  public void setMinStaytime(Long minStaytime){
    this.minStaytime = minStaytime;
  }
  public Long getMinStaytime(){
    return minStaytime;
  }
public String getTypename() {
	return typename;
}
public void setTypename(String typename) {
	this.typename = typename;
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getUnid() {
	return unid;
}
public void setUnid(String unid) {
	this.unid = unid;
}
public String getCityCode() {
	return cityCode;
}
public void setCityCode(String cityCode) {
	this.cityCode = cityCode;
}

public String getCountyCode() {
	return countyCode;
}
public void setCountyCode(String countyCode) {
	this.countyCode = countyCode;
}
public String getSubmitTime() {
	return submitTime;
}
public void setSubmitTime(String submitTime) {
	this.submitTime = submitTime;
}
public String getCityName() {
	return cityName;
}
public void setCityName(String cityName) {
	this.cityName = cityName;
}


public String getCountyName() {
	return countyName;
}
public void setCountyName(String countyName) {
	this.countyName = countyName;
}
public String getLoginUserId() {
	return LoginUserId;
}
public void setLoginUserId(String loginUserId) {
	LoginUserId = loginUserId;
}
public Long getSendareaId() {
	return sendareaId;
}
public void setSendareaId(Long sendareaId) {
	this.sendareaId = sendareaId;
}


  public Long getaLevel() {
    return aLevel;
  }

  public void setaLevel(Long aLevel) {
    this.aLevel = aLevel;
  }
  
public Double getOrderNumber() {
	return orderNumber;
}
public void setOrderNumber(Double orderNumber) {
	this.orderNumber = orderNumber;
}




public String getIskey() {
	return iskey;
}
public void setIskey(String iskey) {
	this.iskey = iskey;
}
@Override
public String toString() {
	return "RegionCfg [unid=" + unid + ", id=" + id + ", regionName="
			+ regionName + ", notes=" + notes + ", updateuser=" + updateuser
			+ ", updatetime=" + updatetime + ", typeid=" + typeid
			+ ", isvalid=" + isvalid + ", lat=" + lat + ", lng=" + lng
			+ ", aradius=" + aradius + ", expediteValue=" + expediteValue
			+ ", jamValue=" + jamValue + ", imgurl=" + imgurl
			+ ", minStaytime=" + minStaytime + ", typename=" + typename
			+ ", cityCode=" + cityCode + ", cityName=" + cityName
			+ ", submitTime=" + submitTime + ", sendareaId=" + sendareaId
			+ ", LoginUserId=" + LoginUserId + ", businessid=" + businessid
			+ ", businessidStr=" + businessidStr + ", aLevel=" + aLevel + ", orderNumber=" + orderNumber +"]";
}
}