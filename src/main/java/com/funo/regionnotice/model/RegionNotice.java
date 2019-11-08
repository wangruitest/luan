package com.funo.regionnotice.model;

import java.io.Serializable;
import java.util.Date;

public class RegionNotice implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private Long regionId;
  private Long cityCode;
  private String notice;
  private Date issueTime;
  private Date editTime;
  
  public void setId(Long id){
    this.id = id;
  }
  public Long getId(){
    return id;
  }
  public void setRegionId(Long regionId){
    this.regionId = regionId;
  }
  public Long getRegionId(){
    return regionId;
  }
  public void setCityCode(Long cityCode){
    this.cityCode = cityCode;
  }
  public Long getCityCode(){
    return cityCode;
  }
  public void setNotice(String notice){
    this.notice = notice;
  }
  public String getNotice(){
    return notice;
  }
  public void setIssueTime(Date issueTime){
    this.issueTime = issueTime;
  }
  public Date getIssueTime(){
    return issueTime;
  }
  public void setEditTime(Date editTime){
    this.editTime = editTime;
  }
  public Date getEditTime(){
    return editTime;
  }


}