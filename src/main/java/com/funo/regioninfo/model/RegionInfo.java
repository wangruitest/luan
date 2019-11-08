package com.funo.regioninfo.model;

import java.io.Serializable;
import java.util.Date;

public class RegionInfo implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private Long regionId;
  private Long cityCode;
  private String regionName;
  private String longitude;
  private String latitude;
  private String address;
  private Long level;
  private String introduction;
  private String phone;
  private String openingTime;
  private String bestTime;
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
  public void setRegionName(String regionName){
    this.regionName = regionName;
  }
  public String getRegionName(){
    return regionName;
  }
  public void setLongitude(String longitude){
    this.longitude = longitude;
  }
  public String getLongitude(){
    return longitude;
  }
  public void setLatitude(String latitude){
    this.latitude = latitude;
  }
  public String getLatitude(){
    return latitude;
  }
  public void setAddress(String address){
    this.address = address;
  }
  public String getAddress(){
    return address;
  }
  public void setLevel(Long level){
    this.level = level;
  }
  public Long getLevel(){
    return level;
  }
  public void setIntroduction(String introduction){
    this.introduction = introduction;
  }
  public String getIntroduction(){
    return introduction;
  }
  public void setPhone(String phone){
    this.phone = phone;
  }
  public String getPhone(){
    return phone;
  }
  public void setOpeningTime(String openingTime){
    this.openingTime = openingTime;
  }
  public String getOpeningTime(){
    return openingTime;
  }
  public void setBestTime(String bestTime){
    this.bestTime = bestTime;
  }
  public String getBestTime(){
    return bestTime;
  }
  public void setEditTime(Date editTime){
    this.editTime = editTime;
  }
  public Date getEditTime(){
    return editTime;
  }

}