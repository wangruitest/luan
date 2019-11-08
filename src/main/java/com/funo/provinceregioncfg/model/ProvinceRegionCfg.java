package com.funo.provinceregioncfg.model;

import java.io.Serializable;
import java.util.Date;

public class ProvinceRegionCfg implements Serializable{

  private static final long serialVersionUID = 1L;
	
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
  private String cityCode;
  private String submitTime;
  private String unid;
  private String pm;
  private String wd;
  private String gxsj;
  private String pmUrl;
  private String wdUrl;
  
  private String typename;
  
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
  public void setCityCode(String cityCode){
    this.cityCode = cityCode;
  }
  public String getCityCode(){
    return cityCode;
  }
  public void setSubmitTime(String submitTime){
    this.submitTime = submitTime;
  }
  public String getSubmitTime(){
    return submitTime;
  }
  public void setUnid(String unid){
    this.unid = unid;
  }
  public String getUnid(){
    return unid;
  }
  public void setPm(String pm){
    this.pm = pm;
  }
  public String getPm(){
    return pm;
  }
  public void setWd(String wd){
    this.wd = wd;
  }
  public String getWd(){
    return wd;
  }
  public void setGxsj(String gxsj){
    this.gxsj = gxsj;
  }
  public String getGxsj(){
    return gxsj;
  }
  public void setPmUrl(String pmUrl){
    this.pmUrl = pmUrl;
  }
  public String getPmUrl(){
    return pmUrl;
  }
  public void setWdUrl(String wdUrl){
    this.wdUrl = wdUrl;
  }
  public String getWdUrl(){
    return wdUrl;
  }
public String getTypename() {
	return typename;
}
public void setTypename(String typename) {
	this.typename = typename;
}

  

}