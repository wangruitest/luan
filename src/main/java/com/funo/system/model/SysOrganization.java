package com.funo.system.model;

import java.io.Serializable;
import java.util.Date;

public class SysOrganization implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private String unid;
  private String code;
  private String name;
  private String parentUnid;
  
  public void setUnid(String unid){
    this.unid = unid;
  }
  public String getUnid(){
    return unid;
  }
  public void setCode(String code){
    this.code = code;
  }
  public String getCode(){
    return code;
  }
  public void setName(String name){
    this.name = name;
  }
  public String getName(){
    return name;
  }
  public void setParentUnid(String parentUnid){
    this.parentUnid = parentUnid;
  }
  public String getParentUnid(){
    return parentUnid;
  }


}