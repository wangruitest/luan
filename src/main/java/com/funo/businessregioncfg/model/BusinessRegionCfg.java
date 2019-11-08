package com.funo.businessregioncfg.model;

import java.io.Serializable;
import java.util.Date;

public class BusinessRegionCfg implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long businessid;
  private Long regionCfgId;
  private Date createDate;
  private String createUser;
  private String cityid;
  private String name;
  private String businessidStr;
  
  
  public String getBusinessidStr() {
	return businessidStr;
}
public void setBusinessidStr(String businessidStr) {
	this.businessidStr = businessidStr;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public void setBusinessid(Long businessid){
    this.businessid = businessid;
  }
  public Long getBusinessid(){
    return businessid;
  }
  public void setRegionCfgId(Long regionCfgId){
    this.regionCfgId = regionCfgId;
  }
  public Long getRegionCfgId(){
    return regionCfgId;
  }
  public void setCreateDate(Date createDate){
    this.createDate = createDate;
  }
  public Date getCreateDate(){
    return createDate;
  }
  public void setCreateUser(String createUser){
    this.createUser = createUser;
  }
  public String getCreateUser(){
    return createUser;
  }
  public void setCityid(String cityid){
    this.cityid = cityid;
  }
  public String getCityid(){
    return cityid;
  }


}