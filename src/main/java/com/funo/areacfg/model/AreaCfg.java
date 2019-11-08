package com.funo.areacfg.model;

import java.io.Serializable;

public class AreaCfg implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private Long areaCode;
  private String areaName;
  private String provinces;
  private String remark;
  private String otherProvince;
  private String thisProvinceNotThisCity;
  private String thisCity;
  private String curCityCode;
  
  public void setId(Long id){
    this.id = id;
  }
  public Long getId(){
    return id;
  }
  public void setAreaCode(Long areaCode){
    this.areaCode = areaCode;
  }
  public Long getAreaCode(){
    return areaCode;
  }
  public void setAreaName(String areaName){
    this.areaName = areaName;
  }
  public String getAreaName(){
    return areaName;
  }
  public void setProvinces(String provinces){
    this.provinces = provinces;
  }
  public String getProvinces(){
    return provinces;
  }
  public void setRemark(String remark){
    this.remark = remark;
  }
  public String getRemark(){
    return remark;
  }
public String getOtherProvince() {
	return otherProvince;
}
public void setOtherProvince(String otherProvince) {
	this.otherProvince = otherProvince;
}
public String getThisProvinceNotThisCity() {
	return thisProvinceNotThisCity;
}
public void setThisProvinceNotThisCity(String thisProvinceNotThisCity) {
	this.thisProvinceNotThisCity = thisProvinceNotThisCity;
}
public String getThisCity() {
	return thisCity;
}
public void setThisCity(String thisCity) {
	this.thisCity = thisCity;
}
public String getCurCityCode() {
	return curCityCode;
}
public void setCurCityCode(String curCityCode) {
	this.curCityCode = curCityCode;
}


}