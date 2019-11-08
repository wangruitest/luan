package com.funo.system.model;

import java.io.Serializable;
import java.util.List;

public class SysRole implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private String unid;
  private String name;
  private String sysUnid;
  private Long status;
  private String remark;
  private String orgUnid;
  private List<SysOperator> sysOperators;
  private List<SysMenu> sysMenus;
  private String parent_unid;
  private String param_sql;
  private String homepage;
  
  public void setUnid(String unid){
    this.unid = unid;
  }
  public String getUnid(){
    return unid;
  }
  public void setName(String name){
    this.name = name;
  }
  public String getName(){
    return name;
  }
  public void setSysUnid(String sysUnid){
    this.sysUnid = sysUnid;
  }
  public String getSysUnid(){
    return sysUnid;
  }
  public void setStatus(Long status){
    this.status = status;
  }
  public Long getStatus(){
    return status;
  }
  public void setRemark(String remark){
    this.remark = remark;
  }
  public String getRemark(){
    return remark;
  }
  public void setOrgUnid(String orgUnid){
    this.orgUnid = orgUnid;
  }
  public String getOrgUnid(){
    return orgUnid;
  }
	public List<SysOperator> getSysOperators() {
		return sysOperators;
	}
	public void setSysOperators(List<SysOperator> sysOperators) {
		this.sysOperators = sysOperators;
	}
	public List<SysMenu> getSysMenus() {
		return sysMenus;
	}
	public void setSysMenus(List<SysMenu> sysMenus) {
		this.sysMenus = sysMenus;
	}
	public String getParent_unid() {
		return parent_unid;
	}
	public void setParent_unid(String parent_unid) {
		this.parent_unid = parent_unid;
	}
	public String getParam_sql() {
		return param_sql;
	}
	public void setParam_sql(String param_sql) {
		this.param_sql = param_sql;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}


}