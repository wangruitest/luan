package com.funo.alarmstarff.model;

import java.io.Serializable;
import java.util.Date;

public class Alarmstarff implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private String name;
  private String phoneNum;
  private String remark;
  private Long systemAlarmtype;
  private Long businessAlarmtype;
  private Long smstestAlarmtype;
  private Date updatetime;
 // private String unid;
  
  
  
  public Long getId() {
	return id;
  }
  public void setId(Long id) {
	this.id = id;
  }
  public void setName(String name){
    this.name = name;
  }
  public String getName(){
    return name;
  }
  public void setPhoneNum(String phoneNum){
    this.phoneNum = phoneNum;
  }
  public String getPhoneNum(){
    return phoneNum;
  }
  public void setRemark(String remark){
    this.remark = remark;
  }
  public String getRemark(){
    return remark;
  }
  public void setSystemAlarmtype(Long systemAlarmtype){
    this.systemAlarmtype = systemAlarmtype;
  }
  public Long getSystemAlarmtype(){
    return systemAlarmtype;
  }
  public void setBusinessAlarmtype(Long businessAlarmtype){
    this.businessAlarmtype = businessAlarmtype;
  }
  public Long getBusinessAlarmtype(){
    return businessAlarmtype;
  }
  public void setSmstestAlarmtype(Long smstestAlarmtype){
    this.smstestAlarmtype = smstestAlarmtype;
  }
  public Long getSmstestAlarmtype(){
    return smstestAlarmtype;
  }
  public void setUpdatetime(Date updatetime){
    this.updatetime = updatetime;
  }
  public Date getUpdatetime(){
    return updatetime;
  }
//  public void setUnid(String unid){
//    this.unid = unid;
//  }
//  public String getUnid(){
//    return unid;
//  }


}