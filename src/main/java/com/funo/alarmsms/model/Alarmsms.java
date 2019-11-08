package com.funo.alarmsms.model;

import java.io.Serializable;
import java.util.Date;

public class Alarmsms implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private String idIn;
  private String phoneNum;
  private Long areaCode;
  private Date updatetime;
  private Long smstype;
  private String smscontent;
  private Date firstsmsdate;
  private Date lastsmsdate;
  private Long smscount;
  private Long smsresultcode;
  private String remark;
  private Long masid;
  private String smid;
  private Long type;
  
  public void setId(Long id){
    this.id = id;
  }
  public Long getId(){
    return id;
  }
  public void setPhoneNum(String phoneNum){
    this.phoneNum = phoneNum;
  }
  public String getPhoneNum(){
    return phoneNum;
  }
  public void setAreaCode(Long areaCode){
    this.areaCode = areaCode;
  }
  public Long getAreaCode(){
    return areaCode;
  }
  public void setUpdatetime(Date updatetime){
    this.updatetime = updatetime;
  }
  public Date getUpdatetime(){
    return updatetime;
  }
  public void setSmstype(Long smstype){
    this.smstype = smstype;
  }
  public Long getSmstype(){
    return smstype;
  }
  public void setSmscontent(String smscontent){
    this.smscontent = smscontent;
  }
  public String getSmscontent(){
    return smscontent;
  }
  public void setFirstsmsdate(Date firstsmsdate){
    this.firstsmsdate = firstsmsdate;
  }
  public Date getFirstsmsdate(){
    return firstsmsdate;
  }
  public void setLastsmsdate(Date lastsmsdate){
    this.lastsmsdate = lastsmsdate;
  }
  public Date getLastsmsdate(){
    return lastsmsdate;
  }
  public void setSmscount(Long smscount){
    this.smscount = smscount;
  }
  public Long getSmscount(){
    return smscount;
  }
  public void setSmsresultcode(Long smsresultcode){
    this.smsresultcode = smsresultcode;
  }
  public Long getSmsresultcode(){
    return smsresultcode;
  }
  public void setRemark(String remark){
    this.remark = remark;
  }
  public String getRemark(){
    return remark;
  }
  public void setMasid(Long masid){
    this.masid = masid;
  }
  public Long getMasid(){
    return masid;
  }
  public void setSmid(String smid){
    this.smid = smid;
  }
  public String getSmid(){
    return smid;
  }
  public void setType(Long type){
    this.type = type;
  }
  public Long getType(){
    return type;
  }
public String getIdIn() {
	return idIn;
}
public void setIdIn(String idIn) {
	this.idIn = idIn;
}


}