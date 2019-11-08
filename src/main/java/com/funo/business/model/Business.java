package com.funo.business.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.funo.userbusinesscfg.model.UserBusinessCfg;

public class Business implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long businessid;
  private Long industryid;
  private Long isgroup;
  private String industryname;
  private String businessname;
  private String address;
  private String linkman;
  private String phone;
  private String businesscode;
  private Long depositAmount;
  private Long usedAmount;
  private Long lockedAmount;
  private Long totalLastAmount;
  private Date edittime;
  private String edituser;
  private Date createtime;
  private String createuser;
  private Long status;
  private String smslabel;
  private String adminuser;
  private String ecaccessport;
  private Long cityCode;
  private String logoSrc;
  private String homepage;
  private List<UserBusinessCfg> userBusinessCfgList;
  public void setIsgroup(Long isgroup){
    this.isgroup = isgroup;
  }
  public Long getIsgroup(){
    return isgroup;
  }
  public void setBusinessname(String businessname){
    this.businessname = businessname;
  }
  public String getBusinessname(){
    return businessname;
  }
  public void setAddress(String address){
    this.address = address;
  }
  public String getAddress(){
    return address;
  }
  public void setLinkman(String linkman){
    this.linkman = linkman;
  }
  public String getLinkman(){
    return linkman;
  }
  public void setPhone(String phone){
    this.phone = phone;
  }
  public String getPhone(){
    return phone;
  }
  public void setBusinesscode(String businesscode){
    this.businesscode = businesscode;
  }
  public String getBusinesscode(){
    return businesscode;
  }
  public void setDepositAmount(Long depositAmount){
    this.depositAmount = depositAmount;
  }
  public Long getDepositAmount(){
    return depositAmount;
  }
  public void setUsedAmount(Long usedAmount){
    this.usedAmount = usedAmount;
  }
  public Long getUsedAmount(){
    return usedAmount;
  }
  public void setLockedAmount(Long lockedAmount){
    this.lockedAmount = lockedAmount;
  }
  public Long getLockedAmount(){
    return lockedAmount;
  }
  public void setEdittime(Date edittime){
    this.edittime = edittime;
  }
  public Date getEdittime(){
    return edittime;
  }
  public void setEdituser(String edituser){
    this.edituser = edituser;
  }
  public String getEdituser(){
    return edituser;
  }
  public void setCreatetime(Date createtime){
    this.createtime = createtime;
  }
  public Date getCreatetime(){
    return createtime;
  }
  public void setCreateuser(String createuser){
    this.createuser = createuser;
  }
  public String getCreateuser(){
    return createuser;
  }
public String getIndustryname() {
	return industryname;
}
public void setIndustryname(String industryname) {
	this.industryname = industryname;
}
public Long getTotalLastAmount() {
	return totalLastAmount;
}
public void setTotalLastAmount(Long totalLastAmount) {
	this.totalLastAmount = totalLastAmount;
}
public Long getIndustryid() {
	return industryid;
}
public void setIndustryid(Long industryid) {
	this.industryid = industryid;
}
public Long getBusinessid() {
	return businessid;
}
public void setBusinessid(Long businessid) {
	this.businessid = businessid;
}
public Long getStatus() {
	return status;
}
public void setStatus(Long status) {
	this.status = status;
}
public String getSmslabel() {
	return smslabel;
}
public void setSmslabel(String smslabel) {
	this.smslabel = smslabel;
}
public String getAdminuser() {
	return adminuser;
}
public void setAdminuser(String adminuser) {
	this.adminuser = adminuser;
}
public String getEcaccessport() {
	return ecaccessport;
}
public void setEcaccessport(String ecaccessport) {
	this.ecaccessport = ecaccessport;
}
public Long getCityCode() {
	return cityCode;
}
public void setCityCode(Long cityCode) {
	this.cityCode = cityCode;
}
public List<UserBusinessCfg> getUserBusinessCfgList() {
	return userBusinessCfgList;
}
public void setUserBusinessCfgList(List<UserBusinessCfg> userBusinessCfgList) {
	this.userBusinessCfgList = userBusinessCfgList;
}
public String getLogoSrc() {
	return logoSrc;
}
public void setLogoSrc(String logoSrc) {
	this.logoSrc = logoSrc;
}
public String getHomepage() {
	return homepage;
}
public void setHomepage(String homepage) {
	this.homepage = homepage;
}




}