package com.funo.userbusinesscfg.model;

import java.io.Serializable;
import java.util.Date;

public class UserBusinessCfg implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private String userId;
  private Long businessId;
  private Date createDate;
  private String createUser;
  private String operatorname;
  
  public void setId(Long id){
    this.id = id;
  }
  public Long getId(){
    return id;
  }
  public void setUserId(String userId){
    this.userId = userId;
  }
  public String getUserId(){
    return userId;
  }
  public void setBusinessId(Long businessId){
    this.businessId = businessId;
  }
  public Long getBusinessId(){
    return businessId;
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
public String getOperatorname() {
	return operatorname;
}
public void setOperatorname(String operatorname) {
	this.operatorname = operatorname;
}
  


}