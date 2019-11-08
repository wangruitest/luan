package com.funo.alarmPhone.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class RegionAlarmPhone implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private String id;
  private Long regionId;
  private Long phone;
  private String name;
  private Long oldPhone;
  private String oldName;
  private Date editTime;
  private List<Region> regions;
  
  public void setId(String id){
    this.id = id;
  }
  public String getId(){
    return id;
  }
  public void setRegionId(Long regionId){
    this.regionId = regionId;
  }
  public Long getRegionId(){
    return regionId;
  }
  public void setPhone(Long phone){
    this.phone = phone;
  }
  public Long getPhone(){
    return phone;
  }
  public void setName(String name){
    this.name = name;
  }
  public String getName(){
    return name;
  }
  public void setEditTime(Date editTime){
    this.editTime = editTime;
  }
  public Date getEditTime(){
    return editTime;
  }

  public List<Region> getRegions() {
    return regions;
  }

  public void setRegions(List<Region> regions) {
    this.regions = regions;
  }

  public Long getOldPhone() {
    return oldPhone;
  }

  public void setOldPhone(Long oldPhone) {
    this.oldPhone = oldPhone;
  }

  public String getOldName() {
    return oldName;
  }

  public void setOldName(String oldName) {
    this.oldName = oldName;
  }
}