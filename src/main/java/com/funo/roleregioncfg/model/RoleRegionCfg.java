package com.funo.roleregioncfg.model;

import java.io.Serializable;
import java.util.Date;

public class RoleRegionCfg implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private String sysRoleUnid;
  private Long regionCfgId;
  private Date createDate;
  private String createUser;
  private String cityid;
  private String userid;
  private String name;
  
  
  public void setSysRoleUnid(String sysRoleUnid){
    this.sysRoleUnid = sysRoleUnid;
  }
  public String getSysRoleUnid(){
    return sysRoleUnid;
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
public String getCityid() {
	return cityid;
}
public void setCityid(String cityid) {
	this.cityid = cityid;
}
public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}


  


}