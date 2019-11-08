package com.funo.basecommon.model;

import java.io.Serializable;
import java.util.Date;

public class Common implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private Long parentId;
  private String name;
  private String value;
  private String type;
  private Long isvalid;
  private Date updatetime;
  private String remark;
  
  public void setParentId(Long parentId){
    this.parentId = parentId;
  }
  public Long getParentId(){
    return parentId;
  }
  public void setName(String name){
    this.name = name;
  }
  public String getName(){
    return name;
  }
  public void setValue(String value){
    this.value = value;
  }
  public String getValue(){
    return value;
  }
  public void setType(String type){
    this.type = type;
  }
  public String getType(){
    return type;
  }
  public void setIsvalid(Long isvalid){
    this.isvalid = isvalid;
  }
  public Long getIsvalid(){
    return isvalid;
  }
  public void setUpdatetime(Date updatetime){
    this.updatetime = updatetime;
  }
  public Date getUpdatetime(){
    return updatetime;
  }
  public void setRemark(String remark){
    this.remark = remark;
  }
  public String getRemark(){
    return remark;
  }
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}


}