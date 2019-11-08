package com.funo.provincebusiness.model;

import java.io.Serializable;
import java.util.Date;

public class BusinessGw implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private Long businessid;
  private Long gwId;
  private Date createDate;
  private String createUser;
  private String gwName;
  private String gwSingname;
  private String remark;
  
  public void setId(Long id){
    this.id = id;
  }
  public Long getId(){
    return id;
  }
  public void setBusinessid(Long businessid){
    this.businessid = businessid;
  }
  public Long getBusinessid(){
    return businessid;
  }
  public void setGwId(Long gwId){
    this.gwId = gwId;
  }
  public Long getGwId(){
    return gwId;
  }
  public void setCreateDate(Date createDate){
    this.createDate = createDate;
  }
  public Date getCreateDate(){
    return createDate;
  }
  public void setCreateUser(String createUser){
    this.createUser = createUser;
  }
  public String getCreateUser(){
    return createUser;
  }
public String getGwName() {
	return gwName;
}
public void setGwName(String gwName) {
	this.gwName = gwName;
}
public String getGwSingname() {
	return gwSingname;
}
public void setGwSingname(String gwSingname) {
	this.gwSingname = gwSingname;
}
public String getRemark() {
	return remark;
}
public void setRemark(String remark) {
	this.remark = remark;
}


}