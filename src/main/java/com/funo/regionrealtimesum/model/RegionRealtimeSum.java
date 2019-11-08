package com.funo.regionrealtimesum.model;

import java.io.Serializable;
import java.util.Date;

public class RegionRealtimeSum implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private Long regionId;
  private Long stayTourists;
  private Long inTourists;
  private Long outTourists;
  private Date statHour;
  private Date updatetime;
  private String cityCode;
  private Date submitTime;
  private Long type;
  private String begindate;
  private String regionname;
  private String searchdate;
  private String rqtime;
  private String localstourists;
  private String instourists;
  private String outstourists;
  private String stourists;
  private String outcountrytourists;
  private String holiday;
  private String unHoliday;
  
  private String touristsum;
  private String expeditevalue;
  private String jamvalue;
  private String showTb;
  
  
  public String getBegindate() {
	return begindate;
}
public void setBegindate(String begindate) {
	this.begindate = begindate;
}
public String getRegionname() {
	return regionname;
}
public void setRegionname(String regionname) {
	this.regionname = regionname;
}
public String getSearchdate() {
	return searchdate;
}
public void setSearchdate(String searchdate) {
	this.searchdate = searchdate;
}
public String getRqtime() {
	return rqtime;
}
public void setRqtime(String rqtime) {
	this.rqtime = rqtime;
}
public String getLocalstourists() {
	return localstourists;
}
public void setLocalstourists(String localstourists) {
	this.localstourists = localstourists;
}
public String getInstourists() {
	return instourists;
}
public void setInstourists(String instourists) {
	this.instourists = instourists;
}
public String getOutstourists() {
	return outstourists;
}
public void setOutstourists(String outstourists) {
	this.outstourists = outstourists;
}
public String getStourists() {
	return stourists;
}
public void setStourists(String stourists) {
	this.stourists = stourists;
}
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
  public void setStayTourists(Long stayTourists){
    this.stayTourists = stayTourists;
  }
  public Long getStayTourists(){
    return stayTourists;
  }
  public void setInTourists(Long inTourists){
    this.inTourists = inTourists;
  }
  public Long getInTourists(){
    return inTourists;
  }
  public void setOutTourists(Long outTourists){
    this.outTourists = outTourists;
  }
  public Long getOutTourists(){
    return outTourists;
  }
  public void setStatHour(Date statHour){
    this.statHour = statHour;
  }
  public Date getStatHour(){
    return statHour;
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
  public void setType(Long type){
    this.type = type;
  }
  public Long getType(){
    return type;
  }
public String getHoliday() {
	return holiday;
}
public void setHoliday(String holiday) {
	this.holiday = holiday;
}
public String getUnHoliday() {
	//此条件和holiday两个条件必须有其它一个，且默认为unHoliday有值
	if(null==this.holiday || this.holiday.equals("")){
		this.unHoliday="yes";
	}
	return unHoliday;
}
public void setUnHoliday(String unHoliday) {
	this.unHoliday = unHoliday;
}
public String getTouristsum() {
	return touristsum;
}
public void setTouristsum(String touristsum) {
	this.touristsum = touristsum;
}
public String getExpeditevalue() {
	return expeditevalue;
}
public void setExpeditevalue(String expeditevalue) {
	this.expeditevalue = expeditevalue;
}
public String getJamvalue() {
	return jamvalue;
}
public void setJamvalue(String jamvalue) {
	this.jamvalue = jamvalue;
}
public String getOutcountrytourists() {
	return outcountrytourists;
}
public void setOutcountrytourists(String outcountrytourists) {
	this.outcountrytourists = outcountrytourists;
}
public String getShowTb() {
	return showTb;
}
public void setShowTb(String showTb) {
	this.showTb = showTb;
}




}