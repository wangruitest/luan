package com.funo.touristresource.model;

import java.io.Serializable;
import java.util.Date;

public class TouristResource implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private Long region;
  private Long fiveRegion;
  private Long fourRegion;
  private Long threeRegion;
  private Long grogshop;
  private Long fiveGrogshop;
  private Long fourGrogshop;
  private Long threeGrogshop;
  private Long travelAgency;
  private Long guide;
  private String provinceName;
  private String provinceCode;
  private Date createTime;
  private Date updateTime;
  private String updateUser;
  private String remark;
  
  private String cityCode;
  private String statDay;
  
  public String getProvinceCode() {
	return provinceCode;
}
public void setProvinceCode(String provinceCode) {
	this.provinceCode = provinceCode;
}
public void setId(Long id){
    this.id = id;
  }
  public Long getId(){
    return id;
  }
  public void setRegion(Long region){
    this.region = region;
  }
  public Long getRegion(){
    return region;
  }
  public void setFiveRegion(Long fiveRegion){
    this.fiveRegion = fiveRegion;
  }
  public Long getFiveRegion(){
    return fiveRegion;
  }
  public void setFourRegion(Long fourRegion){
    this.fourRegion = fourRegion;
  }
  public Long getFourRegion(){
    return fourRegion;
  }
  public void setThreeRegion(Long threeRegion){
    this.threeRegion = threeRegion;
  }
  public Long getThreeRegion(){
    return threeRegion;
  }
  public void setGrogshop(Long grogshop){
    this.grogshop = grogshop;
  }
  public Long getGrogshop(){
    return grogshop;
  }
  public void setFiveGrogshop(Long fiveGrogshop){
    this.fiveGrogshop = fiveGrogshop;
  }
  public Long getFiveGrogshop(){
    return fiveGrogshop;
  }
  public void setFourGrogshop(Long fourGrogshop){
    this.fourGrogshop = fourGrogshop;
  }
  public Long getFourGrogshop(){
    return fourGrogshop;
  }
  public void setThreeGrogshop(Long threeGrogshop){
    this.threeGrogshop = threeGrogshop;
  }
  public Long getThreeGrogshop(){
    return threeGrogshop;
  }
  public void setTravelAgency(Long travelAgency){
    this.travelAgency = travelAgency;
  }
  public Long getTravelAgency(){
    return travelAgency;
  }
  public void setGuide(Long guide){
    this.guide = guide;
  }
  public Long getGuide(){
    return guide;
  }
  public void setProvinceName(String provinceName){
    this.provinceName = provinceName;
  }
  public String getProvinceName(){
    return provinceName;
  }
  public void setCreateTime(Date createTime){
    this.createTime = createTime;
  }
  public Date getCreateTime(){
    return createTime;
  }
  public void setUpdateTime(Date updateTime){
    this.updateTime = updateTime;
  }
  public Date getUpdateTime(){
    return updateTime;
  }
  public void setUpdateUser(String updateUser){
    this.updateUser = updateUser;
  }
  public String getUpdateUser(){
    return updateUser;
  }
  public void setRemark(String remark){
    this.remark = remark;
  }
  public String getRemark(){
    return remark;
  }
public String getCityCode() {
	return cityCode;
}
public void setCityCode(String cityCode) {
	this.cityCode = cityCode;
}
public String getStatDay() {
	return statDay;
}
public void setStatDay(String statDay) {
	this.statDay = statDay;
}
  
  


}