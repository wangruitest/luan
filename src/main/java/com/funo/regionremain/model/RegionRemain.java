package com.funo.regionremain.model;

import java.io.Serializable;
import java.util.Date;

public class RegionRemain implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private Long areaCode;
  private Long zertoonehCount;
  private Long onetotwohCount;
  private Long twotosixhCount;
  private Long sixhtodayCount;
  private Long daytotwodCount;
  private Long moretwodCount;
  private Date updatetime;
  private String regionId;
  private String cityCode;
  private String submitTime;
  private Date statMonth;
  private String touristtype;
  private String ybegintime;
  private String yendtime;
  private String qbegintime;
  private String qendtime;
  private String qquarterbegin;
  private String qquarterend;
  private String mbegintime;
  private String mendtime;
  private String searchtype;
  private String stattime;
  private String qbeginmonth;
  
  
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
  public void setZertoonehCount(Long zertoonehCount){
    this.zertoonehCount = zertoonehCount;
  }
  public Long getZertoonehCount(){
    return zertoonehCount;
  }
  public void setOnetotwohCount(Long onetotwohCount){
    this.onetotwohCount = onetotwohCount;
  }
  public Long getOnetotwohCount(){
    return onetotwohCount;
  }
  public void setTwotosixhCount(Long twotosixhCount){
    this.twotosixhCount = twotosixhCount;
  }
  public Long getTwotosixhCount(){
    return twotosixhCount;
  }
  public void setSixhtodayCount(Long sixhtodayCount){
    this.sixhtodayCount = sixhtodayCount;
  }
  public Long getSixhtodayCount(){
    return sixhtodayCount;
  }
  public void setDaytotwodCount(Long daytotwodCount){
    this.daytotwodCount = daytotwodCount;
  }
  public Long getDaytotwodCount(){
    return daytotwodCount;
  }
  public void setMoretwodCount(Long moretwodCount){
    this.moretwodCount = moretwodCount;
  }
  public Long getMoretwodCount(){
    return moretwodCount;
  }
  public void setUpdatetime(Date updatetime){
    this.updatetime = updatetime;
  }
  public Date getUpdatetime(){
    return updatetime;
  }
  public void setRegionId(String regionId){
    this.regionId = regionId;
  }
  public String getRegionId(){
    return regionId;
  }
  public void setCityCode(String cityCode){
    this.cityCode = cityCode;
  }
  public String getCityCode(){
    return cityCode;
  }
  public void setSubmitTime(String submitTime){
    this.submitTime = submitTime;
  }
  public String getSubmitTime(){
    return submitTime;
  }
  public void setStatMonth(Date statMonth){
    this.statMonth = statMonth;
  }
  public Date getStatMonth(){
    return statMonth;
  }
public String getTouristtype() {
	return touristtype;
}
public void setTouristtype(String touristtype) {
	this.touristtype = touristtype;
}
public String getYbegintime() {
	return ybegintime;
}
public void setYbegintime(String ybegintime) {
	this.ybegintime = ybegintime;
}
public String getYendtime() {
	return yendtime;
}
public void setYendtime(String yendtime) {
	this.yendtime = yendtime;
}
public String getQbegintime() {
	return qbegintime;
}
public void setQbegintime(String qbegintime) {
	this.qbegintime = qbegintime;
}
public String getQendtime() {
	return qendtime;
}
public void setQendtime(String qendtime) {
	this.qendtime = qendtime;
}
public String getQquarterbegin() {
	return qquarterbegin;
}
public void setQquarterbegin(String qquarterbegin) {
	this.qquarterbegin = qquarterbegin;
}
public String getQquarterend() {
	return qquarterend;
}
public void setQquarterend(String qquarterend) {
	this.qquarterend = qquarterend;
}
public String getMbegintime() {
	return mbegintime;
}
public void setMbegintime(String mbegintime) {
	this.mbegintime = mbegintime;
}
public String getMendtime() {
	return mendtime;
}
public void setMendtime(String mendtime) {
	this.mendtime = mendtime;
}
public String getSearchtype() {
	return searchtype;
}
public void setSearchtype(String searchtype) {
	this.searchtype = searchtype;
}
public String getStattime() {
	return stattime;
}
public void setStattime(String stattime) {
	this.stattime = stattime;
}
public String getQbeginmonth() {
	return qbeginmonth;
}
public void setQbeginmonth(String qbeginmonth) {
	this.qbeginmonth = qbeginmonth;
}



  
  


}