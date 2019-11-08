package com.funo.system.model;

import java.io.Serializable;

public class SysMenu implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private String unid;
  private String menuid;
  private String name;
  private String displayName;
  private String url;
  private String menuIcon;
  private String desktopIcon;
  private Long sortNum;
  private Long status;
  private String punid;
  private String dsTypes;
  
  public void setUnid(String unid){
    this.unid = unid;
  }
  public String getUnid(){
    return unid;
  }
  public void setMenuid(String menuid){
    this.menuid = menuid;
  }
  public String getMenuid(){
    return menuid;
  }
  public void setName(String name){
    this.name = name;
  }
  public String getName(){
    return name;
  }
  public void setUrl(String url){
    this.url = url;
  }
  public String getUrl(){
    return url;
  }
  public void setMenuIcon(String menuIcon){
    this.menuIcon = menuIcon;
  }
  public String getMenuIcon(){
    return menuIcon;
  }
  public void setDesktopIcon(String desktopIcon){
    this.desktopIcon = desktopIcon;
  }
  public String getDesktopIcon(){
    return desktopIcon;
  }
  public void setSortNum(Long sortNum){
    this.sortNum = sortNum;
  }
  public Long getSortNum(){
    return sortNum;
  }
  public void setStatus(Long status){
    this.status = status;
  }
  public Long getStatus(){
    return status;
  }
  public void setPunid(String punid){
    this.punid = punid;
  }
  public String getPunid(){
    return punid;
  }
	public String getDsTypes() {
		return dsTypes;
	}
	public void setDsTypes(String dsTypes) {
		this.dsTypes = dsTypes;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}


}