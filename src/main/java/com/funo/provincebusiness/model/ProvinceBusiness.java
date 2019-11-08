package com.funo.provincebusiness.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

//import com.funo.gwCfg.model.GwCfg;
//import com.funo.oftenusedareacfg.model.OftenUsedAreaCfg;

public class ProvinceBusiness implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long businessid;
  private Long industryid;
  private Long isgroup;
  private String businessname;
  private String address;
  private String linkman;
  private String phone;
  private String businesscode;
  private Long depositAmount;
  private Long usedAmount;
  private Long lockedAmount;
  private Date edittime;
  private String edituser;
  private Date createtime;
  private String createuser;
  private String loginlogopath;
  private String framelogopath;
  private Long isspecial;
  private String cityCode;
//  private List<OftenUsedAreaCfg> oftenUsedAreaList;
  private List<BusinessGw> businessGwList;
//  private List<GwCfg> gwCfgList;
  private List<BusinessOftarea> businessOftareaList;
  
  public void setBusinessid(Long businessid){
    this.businessid = businessid;
  }
  public Long getBusinessid(){
    return businessid;
  }
  public void setIndustryid(Long industryid){
    this.industryid = industryid;
  }
  public Long getIndustryid(){
    return industryid;
  }
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
  public void setLoginlogopath(String loginlogopath){
    this.loginlogopath = loginlogopath;
  }
  public String getLoginlogopath(){
    return loginlogopath;
  }
  public void setFramelogopath(String framelogopath){
    this.framelogopath = framelogopath;
  }
  public String getFramelogopath(){
    return framelogopath;
  }
  public void setIsspecial(Long isspecial){
    this.isspecial = isspecial;
  }
  public Long getIsspecial(){
    return isspecial;
  }
  public void setCityCode(String cityCode){
    this.cityCode = cityCode;
  }
  public String getCityCode(){
    return cityCode;
  }
//public List<OftenUsedAreaCfg> getOftenUsedAreaList() {
//	return oftenUsedAreaList;
//}
//public void setOftenUsedAreaList(List<OftenUsedAreaCfg> oftenUsedAreaList) {
//	this.oftenUsedAreaList = oftenUsedAreaList;
//}
public List<BusinessGw> getBusinessGwList() {
	return businessGwList;
}
public void setBusinessGwList(List<BusinessGw> businessGwList) {
	this.businessGwList = businessGwList;
}
//public List<GwCfg> getGwCfgList() {
//	return gwCfgList;
//}
//public void setGwCfgList(List<GwCfg> gwCfgList) {
//	this.gwCfgList = gwCfgList;
//}
public List<BusinessOftarea> getBusinessOftareaList() {
	return businessOftareaList;
}
public void setBusinessOftareaList(List<BusinessOftarea> businessOftareaList) {
	this.businessOftareaList = businessOftareaList;
}

}