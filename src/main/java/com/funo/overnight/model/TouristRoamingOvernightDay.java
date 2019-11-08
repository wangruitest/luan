package com.funo.overnight.model;

import java.io.Serializable;
import java.util.Date;

public class TouristRoamingOvernightDay implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private Long count;
  private Long distinctCount;
  private Long areaCode;
  private Date statMonth;
  private Date statDay;
  private Date updatetime;
  private String cityCode;
  private Date submitTime;
  private String roamingcity;
  private String roamingprovince;
  private String visitorprovince;
  private String visitorcity;
  private String vistorcountry;
  private Long overnightcitycount;
  private Long dupovernightcitycount;
  
  public void setId(Long id){
    this.id = id;
  }
  public Long getId(){
    return id;
  }
  public void setCount(Long count){
    this.count = count;
  }
  public Long getCount(){
    return count;
  }
  public void setDistinctCount(Long distinctCount){
    this.distinctCount = distinctCount;
  }
  public Long getDistinctCount(){
    return distinctCount;
  }
  public void setAreaCode(Long areaCode){
    this.areaCode = areaCode;
  }
  public Long getAreaCode(){
    return areaCode;
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
  public void setUpdatetime(Date updatetime){
    this.updatetime = updatetime;
  }
  public Date getUpdatetime(){
    return updatetime;
  }
  public void setCityCode(String cityCode){
    this.cityCode = cityCode;
  }
  public String getCityCode(){
    return cityCode;
  }
  public void setSubmitTime(Date submitTime){
    this.submitTime = submitTime;
  }
  public Date getSubmitTime(){
    return submitTime;
  }
  public void setRoamingcity(String roamingcity){
    this.roamingcity = roamingcity;
  }
  public String getRoamingcity(){
    return roamingcity;
  }
  public void setRoamingprovince(String roamingprovince){
    this.roamingprovince = roamingprovince;
  }
  public String getRoamingprovince(){
    return roamingprovince;
  }
  public void setVisitorprovince(String visitorprovince){
    this.visitorprovince = visitorprovince;
  }
  public String getVisitorprovince(){
    return visitorprovince;
  }
  public void setVisitorcity(String visitorcity){
    this.visitorcity = visitorcity;
  }
  public String getVisitorcity(){
    return visitorcity;
  }
  public void setVistorcountry(String vistorcountry){
    this.vistorcountry = vistorcountry;
  }
  public String getVistorcountry(){
    return vistorcountry;
  }
  public void setOvernightcitycount(Long overnightcitycount){
    this.overnightcitycount = overnightcitycount;
  }
  public Long getOvernightcitycount(){
    return overnightcitycount;
  }
  public void setDupovernightcitycount(Long dupovernightcitycount){
    this.dupovernightcitycount = dupovernightcitycount;
  }
  public Long getDupovernightcitycount(){
    return dupovernightcitycount;
  }


}