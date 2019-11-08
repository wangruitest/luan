package com.funo.system.model;

import java.io.Serializable;

public class SysRoleMenu implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private String unid;
  private String roleUnid;
  private String menuUnid;
  
  public void setUnid(String unid){
    this.unid = unid;
  }
  public String getUnid(){
    return unid;
  }
  public void setRoleUnid(String roleUnid){
    this.roleUnid = roleUnid;
  }
  public String getRoleUnid(){
    return roleUnid;
  }
  public void setMenuUnid(String menuUnid){
    this.menuUnid = menuUnid;
  }
  public String getMenuUnid(){
    return menuUnid;
  }


}