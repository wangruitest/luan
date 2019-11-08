package com.funo.mobile.model;

import java.util.Date;

public class MobileAlarm {

	  private Long id;
	  private Long scenicCode;
	  private String scenicName;
	  private Long warningLevel;
	  private String warningPhone;
	  private String warinngContent;
	  private Long warningValue;
	  private Date warningTime;
	  private String warningName;
	  private Long outProvinceCount;
	  private Long allCount;
	  private Long inProvinceCount;
	  private Date editTime;
	  
	  private String begTime;
	  private String endTime;
	  private Integer page;
	  private Integer pageSize;
	  private String regionIds;
	  
	  public void setId(Long id){
	    this.id = id;
	  }
	  public Long getId(){
	    return id;
	  }
	  public void setScenicCode(Long scenicCode){
	    this.scenicCode = scenicCode;
	  }
	  public Long getScenicCode(){
	    return scenicCode;
	  }
	  public void setScenicName(String scenicName){
	    this.scenicName = scenicName;
	  }
	  public String getScenicName(){
	    return scenicName;
	  }
	  public void setWarningLevel(Long warningLevel){
	    this.warningLevel = warningLevel;
	  }
	  public Long getWarningLevel(){
	    return warningLevel;
	  }
	  public void setWarningPhone(String warningPhone){
	    this.warningPhone = warningPhone;
	  }
	  public String getWarningPhone(){
	    return warningPhone;
	  }
	  public void setWarinngContent(String warinngContent){
	    this.warinngContent = warinngContent;
	  }
	  public String getWarinngContent(){
	    return warinngContent;
	  }
	  public void setWarningValue(Long warningValue){
	    this.warningValue = warningValue;
	  }
	  public Long getWarningValue(){
	    return warningValue;
	  }
	  public void setWarningTime(Date warningTime){
	    this.warningTime = warningTime;
	  }
	  public Date getWarningTime(){
	    return warningTime;
	  }
	  public void setWarningName(String warningName){
	    this.warningName = warningName;
	  }
	  public String getWarningName(){
	    return warningName;
	  }
	  public void setOutProvinceCount(Long outProvinceCount){
	    this.outProvinceCount = outProvinceCount;
	  }
	  public Long getOutProvinceCount(){
	    return outProvinceCount;
	  }
	  public void setAllCount(Long allCount){
	    this.allCount = allCount;
	  }
	  public Long getAllCount(){
	    return allCount;
	  }
	  public void setInProvinceCount(Long inProvinceCount){
	    this.inProvinceCount = inProvinceCount;
	  }
	  public Long getInProvinceCount(){
	    return inProvinceCount;
	  }
	  public void setEditTime(Date editTime){
	    this.editTime = editTime;
	  }
	  public Date getEditTime(){
	    return editTime;
	  }
	public String getBegTime() {
		return begTime;
	}
	public void setBegTime(String begTime) {
		this.begTime = begTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
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
	public String getRegionIds() {
		return regionIds;
	}
	public void setRegionIds(String regionIds) {
		this.regionIds = regionIds;
	}
	
}
