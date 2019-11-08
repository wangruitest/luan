package com.funo.sysloginlog.model;

import java.io.Serializable;
import java.util.Date;

public class SysLoginLog implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private String unid;
  private String userUnid;
  private String loginName;
  private String name;
  private Long operatorType;
  private String ipAddress;
  private String browserInfo;
  private String loginTime;
  private Long loginType;
  private String loginText;
  private String failText;
  private Long sucOrFail;
  private String starttime;
  private String endtime;
  
  
  public String getStarttime() {
	return starttime;
}
public void setStarttime(String starttime) {
	this.starttime = starttime;
}
public String getEndtime() {
	return endtime;
}
public void setEndtime(String endtime) {
	this.endtime = endtime;
}
public void setUnid(String unid){
    this.unid = unid;
  }
  public String getUnid(){
    return unid;
  }
  public void setUserUnid(String userUnid){
    this.userUnid = userUnid;
  }
  public String getUserUnid(){
    return userUnid;
  }
  public void setLoginName(String loginName){
    this.loginName = loginName;
  }
  public String getLoginName(){
    return loginName;
  }
  public void setName(String name){
    this.name = name;
  }
  public String getName(){
    return name;
  }
  public void setOperatorType(Long operatorType){
    this.operatorType = operatorType;
  }
  public Long getOperatorType(){
    return operatorType;
  }
  public void setIpAddress(String ipAddress){
    this.ipAddress = ipAddress;
  }
  public String getIpAddress(){
    return ipAddress;
  }
  public void setBrowserInfo(String browserInfo){
    this.browserInfo = browserInfo;
  }
  public String getBrowserInfo(){
    return browserInfo;
  }
  public void setLoginTime(String loginTime){
    this.loginTime = loginTime;
  }
  public String getLoginTime(){
    return loginTime;
  }
  public void setLoginType(Long loginType){
    this.loginType = loginType;
  }
  public Long getLoginType(){
    return loginType;
  }
  public void setLoginText(String loginText){
    this.loginText = loginText;
  }
  public String getLoginText(){
    return loginText;
  }
  public void setFailText(String failText){
    this.failText = failText;
  }
  public String getFailText(){
    return failText;
  }
  public void setSucOrFail(Long sucOrFail){
    this.sucOrFail = sucOrFail;
  }
  public Long getSucOrFail(){
    return sucOrFail;
  }


}