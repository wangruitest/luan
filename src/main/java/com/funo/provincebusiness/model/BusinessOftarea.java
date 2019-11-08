package com.funo.provincebusiness.model;

import java.io.Serializable;

public class BusinessOftarea implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private Long businessid;
  private Long oftenUsedAreaId;
  private String oftenUsedAreaName;
  private Long areaCode;
  private String remark;
  
public void setId(Long id){
    this.id = id;
  }
  public Long getId(){
    return id;
  }
  public void setBusinessid(Long businessid){
    this.businessid = businessid;
  }
  public Long getBusinessid(){
    return businessid;
  }
  public void setOftenUsedAreaId(Long oftenUsedAreaId){
    this.oftenUsedAreaId = oftenUsedAreaId;
  }
  public Long getOftenUsedAreaId(){
    return oftenUsedAreaId;
  }
public String getOftenUsedAreaName() {
	return oftenUsedAreaName;
}
public void setOftenUsedAreaName(String oftenUsedAreaName) {
	this.oftenUsedAreaName = oftenUsedAreaName;
}
public Long getAreaCode() {
	return areaCode;
}
public void setAreaCode(Long areaCode) {
	this.areaCode = areaCode;
}
public String getRemark() {
	return remark;
}
public void setRemark(String remark) {
	this.remark = remark;
}
  

}