package com.funo.regionrealtimesumadd.model;

import java.io.Serializable;
import java.util.Date;

public class RegionRealtimeSumAdd implements Serializable{

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
  private String areacode;
  private String regionname;
  private String touristtype;
  private String searchdate;
  private String rqtime;
  private String dates;
  
  private String holiday;
  private String unHoliday;
  private String showTb;
  
  
  public String getBegindate() {
	return begindate;
}
public void setBegindate(String begindate) {
	this.begindate = begindate;
}
public String getAreacode() {
	return areacode;
}
public void setAreacode(String areacode) {
	this.areacode = areacode;
}
public String getRegionname() {
	return regionname;
}
public void setRegionname(String regionname) {
	this.regionname = regionname;
}
public String getTouristtype() {
	return touristtype;
}
public void setTouristtype(String touristtype) {
	this.touristtype = touristtype;
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
public String getDates() {
	return dates;
}
public void setDates(String dates) {
	this.dates = dates;
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

  public String getShowTb() {
    return showTb;
  }

  public void setShowTb(String showTb) {
    this.showTb = showTb;
  }
}