package com.funo.holidayAreaOrScenic.model;

import java.io.Serializable;
import java.util.Date;

public class HolidayAreaScenicStatis implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private String holidayName;
  private Date holidayDate;
  private String visitorProvince;
  private String visitorCity;
  private Long count;
  private String code;
  private String areaScenic;
  private String mark;
  private String mark2;
  
  public void setId(Long id){
    this.id = id;
  }
  public Long getId(){
    return id;
  }
  public void setHolidayName(String holidayName){
    this.holidayName = holidayName;
  }
  public String getHolidayName(){
    return holidayName;
  }
  public void setHolidayDate(Date holidayDate){
    this.holidayDate = holidayDate;
  }
  public Date getHolidayDate(){
    return holidayDate;
  }
  public void setVisitorProvince(String visitorProvince){
    this.visitorProvince = visitorProvince;
  }
  public String getVisitorProvince(){
    return visitorProvince;
  }
  public void setVisitorCity(String visitorCity){
    this.visitorCity = visitorCity;
  }
  public String getVisitorCity(){
    return visitorCity;
  }
  public void setCount(Long count){
    this.count = count;
  }
  public Long getCount(){
    return count;
  }
  public void setCode(String code){
    this.code = code;
  }
  public String getCode(){
    return code;
  }
  public void setAreaScenic(String areaScenic){
    this.areaScenic = areaScenic;
  }
  public String getAreaScenic(){
    return areaScenic;
  }
  public void setMark(String mark){
    this.mark = mark;
  }
  public String getMark(){
    return mark;
  }
  public void setMark2(String mark2){
    this.mark2 = mark2;
  }
  public String getMark2(){
    return mark2;
  }


}