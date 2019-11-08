package com.funo.provincereceivetourist.model;

import java.io.Serializable;
import java.util.Date;

public class ProvinceReceiveTourist implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private Long jwykrs;
  private Long wsykrs;
  private Long snmyrs;
  private Long ykzs;
  private Date updatetime;
  private Long cityid;
  private String statMonth;
  
  private String statDay;
  
  private String regionname;
  
  private int searchTime;
  
  private Long jkjq;
  
  private String provinceid;

public String getProvinceid() {
	return provinceid;
}
public void setProvinceid(String provinceid) {
	this.provinceid = provinceid;
}
public void setId(Long id){
    this.id = id;
  }
  public Long getId(){
    return id;
  }
  public void setJwykrs(Long jwykrs){
    this.jwykrs = jwykrs;
  }
  public Long getJwykrs(){
    return jwykrs;
  }
  public void setWsykrs(Long wsykrs){
    this.wsykrs = wsykrs;
  }
  public Long getWsykrs(){
    return wsykrs;
  }
  public void setSnmyrs(Long snmyrs){
    this.snmyrs = snmyrs;
  }
  public Long getSnmyrs(){
    return snmyrs;
  }
  public void setYkzs(Long ykzs){
    this.ykzs = ykzs;
  }
  public Long getYkzs(){
    return ykzs;
  }
  public void setUpdatetime(Date updatetime){
    this.updatetime = updatetime;
  }
  public Date getUpdatetime(){
    return updatetime;
  }
  public void setCityid(Long cityid){
    this.cityid = cityid;
  }
  public Long getCityid(){
    return cityid;
  }
  public String getStatMonth() {
	  return statMonth;
  }
  public void setStatMonth(String statMonth) {
	  this.statMonth = statMonth;
  }
public String getStatDay() {
	return statDay;
}
public void setStatDay(String statDay) {
	this.statDay = statDay;
}
public String getRegionname() {
	return regionname;
}
public void setRegionname(String regionname) {
	this.regionname = regionname;
}
public int getSearchTime() {
	return searchTime;
}
public void setSearchTime(int searchTime) {
	this.searchTime = searchTime;
}
public Long getJkjq() {
	return jkjq;
}
public void setJkjq(Long jkjq) {
	this.jkjq = jkjq;
}
@Override
public String toString() {
	return "ProvinceReceiveTourist [id=" + id + ", jwykrs=" + jwykrs
			+ ", wsykrs=" + wsykrs + ", snmyrs=" + snmyrs + ", ykzs=" + ykzs
			+ ", updatetime=" + updatetime + ", cityid=" + cityid
			+ ", statMonth=" + statMonth + ", statDay=" + statDay
			+ ", regionname=" + regionname + ", searchTime=" + searchTime
			+ ", jkjq=" + jkjq + "]";
}
  
  
  
  


}