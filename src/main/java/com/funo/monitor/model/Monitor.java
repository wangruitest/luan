package com.funo.monitor.model;

import java.io.Serializable;

public class Monitor implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private String id;
  private String hostip;
  private String hostname;
  private Long cpuidle;
  private Long memtotal;
  private Long memfree;
  private String alldiskinfo;
  private String maxuseddisk;
  private String allioinfo;
  private String maxusedio;
  private String updatetime;
  private String updatetimeFrom;
  private String updatetimeEnd;
  private Long netkb;
  
  
  public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public void setHostip(String hostip){
    this.hostip = hostip;
  }
  public String getHostip(){
    return hostip;
  }
  public void setHostname(String hostname){
    this.hostname = hostname;
  }
  public String getHostname(){
    return hostname;
  }
  public void setCpuidle(Long cpuidle){
    this.cpuidle = cpuidle;
  }
  public Long getCpuidle(){
    return cpuidle;
  }
  public void setMemtotal(Long memtotal){
    this.memtotal = memtotal;
  }
  public Long getMemtotal(){
    return memtotal;
  }
  public void setMemfree(Long memfree){
    this.memfree = memfree;
  }
  public Long getMemfree(){
    return memfree;
  }
  public void setAlldiskinfo(String alldiskinfo){
    this.alldiskinfo = alldiskinfo;
  }
  public String getAlldiskinfo(){
    return alldiskinfo;
  }
  public void setMaxuseddisk(String maxuseddisk){
    this.maxuseddisk = maxuseddisk;
  }
  public String getMaxuseddisk(){
    return maxuseddisk;
  }
  public void setAllioinfo(String allioinfo){
    this.allioinfo = allioinfo;
  }
  public String getAllioinfo(){
    return allioinfo;
  }
  public void setMaxusedio(String maxusedio){
    this.maxusedio = maxusedio;
  }
  public String getMaxusedio(){
    return maxusedio;
  }
  public void setUpdatetime(String updatetime){
    this.updatetime = updatetime;
  }
  public String getUpdatetime(){
    return updatetime;
  }
  public void setNetkb(Long netkb){
    this.netkb = netkb;
  }
  public Long getNetkb(){
    return netkb;
  }
public String getUpdatetimeFrom() {
	return updatetimeFrom;
}
public void setUpdatetimeFrom(String updatetimeFrom) {
	this.updatetimeFrom = updatetimeFrom;
}
public String getUpdatetimeEnd() {
	return updatetimeEnd;
}
public void setUpdatetimeEnd(String updatetimeEnd) {
	this.updatetimeEnd = updatetimeEnd;
}

}