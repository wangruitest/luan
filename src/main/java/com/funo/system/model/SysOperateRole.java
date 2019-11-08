package com.funo.system.model;

import java.io.Serializable;

public class SysOperateRole implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private String unid;
  private String operateUnid;
  private String roleUnid;
  
  public void setUnid(String unid){
    this.unid = unid;
  }
  public String getUnid(){
    return unid;
  }
  public void setOperateUnid(String operateUnid){
    this.operateUnid = operateUnid;
  }
  public String getOperateUnid(){
    return operateUnid;
  }
  public void setRoleUnid(String roleUnid){
    this.roleUnid = roleUnid;
  }
  public String getRoleUnid(){
    return roleUnid;
  }


}