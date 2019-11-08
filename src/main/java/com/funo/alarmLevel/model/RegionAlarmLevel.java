package com.funo.alarmLevel.model;

import java.io.Serializable;
import java.util.Date;

public class RegionAlarmLevel implements Serializable{

  private static final long serialVersionUID = 1L;

  private String id;
  private Long regionId;
  private String regionName;
  private Long level1Num;
  private Long level2Num;
  private Long level3Num;
  private Long level4Num;
  private Date editTime;
  private Long currentLevel;
  private String currentLevelName;
  
  public void setRegionId(Long regionId){
    this.regionId = regionId;
  }
  public Long getRegionId(){
    return regionId;
  }
  public void setLevel1Num(Long level1Num){
    this.level1Num = level1Num;
  }
  public Long getLevel1Num(){
    return level1Num;
  }
  public void setLevel2Num(Long level2Num){
    this.level2Num = level2Num;
  }
  public Long getLevel2Num(){
    return level2Num;
  }
  public void setLevel3Num(Long level3Num){
    this.level3Num = level3Num;
  }
  public Long getLevel3Num(){
    return level3Num;
  }
  public void setLevel4Num(Long level4Num){
    this.level4Num = level4Num;
  }
  public Long getLevel4Num(){
    return level4Num;
  }
  public void setEditTime(Date editTime){
    this.editTime = editTime;
  }
  public Date getEditTime(){
    return editTime;
  }
  public void setCurrentLevel(Long currentLevel){
    this.currentLevel = currentLevel;
  }
  public Long getCurrentLevel(){
    return currentLevel;
  }


  public String getRegionName() {
    return regionName;
  }

  public void setRegionName(String regionName) {
    this.regionName = regionName;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getCurrentLevelName() {
    return currentLevelName;
  }

  public void setCurrentLevelName(String currentLevelName) {
    this.currentLevelName = currentLevelName;
  }
}