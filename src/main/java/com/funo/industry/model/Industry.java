package com.funo.industry.model;

import java.io.Serializable;

public class Industry implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long industryid;
  private String typename;
  
  public void setTypename(String typename){
    this.typename = typename;
  }
  public String getTypename(){
    return typename;
  }
public Long getIndustryid() {
	return industryid;
}
public void setIndustryid(Long industryid) {
	this.industryid = industryid;
}


}