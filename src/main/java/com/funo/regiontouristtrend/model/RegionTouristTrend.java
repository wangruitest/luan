package com.funo.regiontouristtrend.model;

import java.io.Serializable;
import java.util.Date;

public class RegionTouristTrend implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private String regionid;//景区名
  private String regionname;//景区名
  private String searchdate;//时间
  private String stourists;//数量
  
  
public String getRegionid() {
	return regionid;
}
public void setRegionid(String regionid) {
	this.regionid = regionid;
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

public String getStourists() {
	return stourists;
}
public void setStourists(String stourists) {
	this.stourists = stourists;
}

  
  


}