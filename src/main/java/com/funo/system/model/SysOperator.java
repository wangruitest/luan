package com.funo.system.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SysOperator implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private String unid;
  private String name;
  private String loginName;
  private String password;
  private String oldPassword;
  private Long status;
  private String remark;
  private String orgUnid;
  private Long sex;
  private String mobileRole;
  private String idNumber;
  private String mobileNumber;
  private String telephoneNumber;
  private String fax;
  private String mail;
  private String sysUnid;
  private Long operatorType;
  private String eccode;
  private String loginuserid;
  private String parentUnid;
  private String cityid;
  private String countyCode;
  private String countyName;
  private SysOrganization org;
  private List<SysRole> roles;
  private List<SysOrganization> childOrgs;
  private List<SysMenu> menus;
  private Map<String,Object> otherParams=new HashMap<String, Object>();
  
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
  public void setLoginName(String loginName){
    this.loginName = loginName;
  }
  public String getLoginName(){
    return loginName;
  }
  public void setPassword(String password){
    this.password = password;
  }
  public String getPassword(){
    return password;
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
  public void setSex(Long sex){
    this.sex = sex;
  }
  public Long getSex(){
    return sex;
  }
  public void setIdNumber(String idNumber){
    this.idNumber = idNumber;
  }
  public String getIdNumber(){
    return idNumber;
  }
  public void setMobileNumber(String mobileNumber){
    this.mobileNumber = mobileNumber;
  }
  public String getMobileNumber(){
    return mobileNumber;
  }
  public void setTelephoneNumber(String telephoneNumber){
    this.telephoneNumber = telephoneNumber;
  }
  public String getTelephoneNumber(){
    return telephoneNumber;
  }
  public void setFax(String fax){
    this.fax = fax;
  }
  public String getFax(){
    return fax;
  }
  public void setMail(String mail){
    this.mail = mail;
  }
  public String getMail(){
    return mail;
  }
  public void setSysUnid(String sysUnid){
    this.sysUnid = sysUnid;
  }
  public String getSysUnid(){
    return sysUnid;
  }
   
  public String getCityid() {
	return cityid;
  }
  public void setCityid(String cityid) {
	this.cityid = cityid;
  }
  public String getParentUnid() {
		return parentUnid;
	}
	public void setParentUnid(String parentUnid) {
		this.parentUnid = parentUnid;
	}
	public String getLoginuserid() {
		return loginuserid;
	}
	public void setLoginuserid(String loginuserid) {
		this.loginuserid = loginuserid;
	}
	public List<SysRole> getRoles() {
		return roles;
	}
	public void setRoles(List<SysRole> roles) {
		this.roles = roles;
	}
	public List<SysMenu> getMenus() {
		return menus;
	}
	public void setMenus(List<SysMenu> menus) {
		this.menus = menus;
	}
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public SysOrganization getOrg() {
		return org;
	}
	public void setOrg(SysOrganization org) {
		this.org = org;
	}
	public List<SysOrganization> getChildOrgs() {
		return childOrgs;
	}
	public void setChildOrgs(List<SysOrganization> childOrgs) {
		this.childOrgs = childOrgs;
	}
	public Map<String, Object> getOtherParams() {
		if(null==otherParams)otherParams=new HashMap<String, Object>();
		return otherParams;
	}
	public void setOtherParams(Map<String, Object> otherParams) {
		this.otherParams = otherParams;
	}
	public Long getOperatorType() {
		return operatorType;
	}
	public void setOperatorType(Long operatorType) {
		this.operatorType = operatorType;
	}
	public String getEccode() {
		return eccode;
	}
	public void setEccode(String eccode) {
		this.eccode = eccode;
	}
	public String getMobileRole() {
		return mobileRole;
	}
	public void setMobileRole(String mobileRole) {
		this.mobileRole = mobileRole;
	}
	public String getCountyCode() {
		return countyCode;
	}
	public void setCountyCode(String countyCode) {
		this.countyCode = countyCode;
	}
	public String getCountyName() {
		return countyName;
	}
	public void setCountyName(String countyName) {
		this.countyName = countyName;
	}
	@Override
	public String toString() {
		return "SysOperator [unid=" + unid + ", name=" + name + ", loginName=" + loginName + ", password=" + password
				+ ", oldPassword=" + oldPassword + ", status=" + status + ", remark=" + remark + ", orgUnid=" + orgUnid
				+ ", sex=" + sex + ", mobileRole=" + mobileRole + ", idNumber=" + idNumber + ", mobileNumber="
				+ mobileNumber + ", telephoneNumber=" + telephoneNumber + ", fax=" + fax + ", mail=" + mail
				+ ", sysUnid=" + sysUnid + ", operatorType=" + operatorType + ", eccode=" + eccode + ", loginuserid="
				+ loginuserid + ", parentUnid=" + parentUnid + ", cityid=" + cityid + ", countyCode=" + countyCode
				+ ", countyName=" + countyName + ", org=" + org + ", roles=" + roles + ", childOrgs=" + childOrgs
				+ ", menus=" + menus + ", otherParams=" + otherParams + "]";
	}
	
	

}