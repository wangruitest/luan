package com.funo.noticecfg.model;

import java.io.Serializable;
import java.util.Date;

public class NoticeCfg implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private String newsTitle;
  private Date newsTime;
  private String newsContent;
  private String edituser;
  private String userid;
  private Date updatetime;
  private String dateStr;
  
  private Integer page;
  private Integer pageSize;
  
  
  public void setId(Long id){
    this.id = id;
  }
  public Long getId(){
    return id;
  }
  public void setNewsTitle(String newsTitle){
    this.newsTitle = newsTitle;
  }
  public String getNewsTitle(){
    return newsTitle;
  }
  public void setNewsTime(Date newsTime){
    this.newsTime = newsTime;
  }
  public Date getNewsTime(){
    return newsTime;
  }
  public void setNewsContent(String newsContent){
    this.newsContent = newsContent;
  }
  public String getNewsContent(){
    return newsContent;
  }
  public void setEdituser(String edituser){
    this.edituser = edituser;
  }
  public String getEdituser(){
    return edituser;
  }
  public void setUserid(String userid){
    this.userid = userid;
  }
  public String getUserid(){
    return userid;
  }
  public void setUpdatetime(Date updatetime){
    this.updatetime = updatetime;
  }
  public Date getUpdatetime(){
    return updatetime;
  }
public Integer getPage() {
	return page;
}
public void setPage(Integer page) {
	this.page = page;
}
public Integer getPageSize() {
	return pageSize;
}
public void setPageSize(Integer pageSize) {
	this.pageSize = pageSize;
}
public String getDateStr() {
	return dateStr;
}
public void setDateStr(String dateStr) {
	this.dateStr = dateStr;
}


}