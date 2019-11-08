package com.funo.regiontype.model;

import java.io.Serializable;

public class RegionTypeCfg implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private String typename;
  private String notes;
  private String cityCode;
  private String submitTime;
  
  public void setId(Long id){
    this.id = id;
  }
  public Long getId(){
    return id;
  }
  public void setTypename(String typename){
    this.typename = typename;
  }
  public String getTypename(){
    return typename;
  }
  public void setNotes(String notes){
    this.notes = notes;
  }
  public String getNotes(){
    return notes;
  }
public String getCityCode() {
	return cityCode;
}
public void setCityCode(String cityCode) {
	this.cityCode = cityCode;
}
public String getSubmitTime() {
	return submitTime;
}
public void setSubmitTime(String submitTime) {
	this.submitTime = submitTime;
}


}