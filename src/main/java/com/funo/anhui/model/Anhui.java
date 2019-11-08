package com.funo.anhui.model;

import java.io.Serializable;
import java.util.Date;

public class Anhui implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long count;
  private String countryId;
  private String countryName;
  private String provinceId;
  private String provinceName;
  private Date statMonth;
  private Date statDay;
  private Date statTime;
  private String regionId;
  
  private String flag;
  
  
  public void setCount(Long count){
    this.count = count;
  }
  public Long getCount(){
    return count;
  }
  public void setCountryId(String countryId){
    this.countryId = countryId;
  }
  public String getCountryId(){
    return countryId;
  }
  public void setCountryName(String countryName){
    this.countryName = countryName;
  }
  public String getCountryName(){
    return countryName;
  }
  public void setProvinceId(String provinceId){
    this.provinceId = provinceId;
  }
  public String getProvinceId(){
    return provinceId;
  }
  public void setProvinceName(String provinceName){
    this.provinceName = provinceName;
  }
  public String getProvinceName(){
    return provinceName;
  }
  public void setStatMonth(Date statMonth){
    this.statMonth = statMonth;
  }
  public Date getStatMonth(){
    return statMonth;
  }
  public void setStatDay(Date statDay){
    this.statDay = statDay;
  }
  public Date getStatDay(){
    return statDay;
  }
public String getRegionId() {
	return regionId;
}
public void setRegionId(String regionId) {
	this.regionId = regionId;
}
public Date getStatTime() {
	return statTime;
}
public void setStatTime(Date statTime) {
	this.statTime = statTime;
}
public static long getSerialversionuid() {
	return serialVersionUID;
}
public String getFlag() {
	return flag;
}
public void setFlag(String flag) {
	this.flag = flag;
}


}