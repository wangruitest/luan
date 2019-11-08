package com.funo.mobile.model;

import java.io.Serializable;
import java.util.Date;

public class Mobile implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private String name;
  
  public void setId(Long id){
    this.id = id;
  }
  public Long getId(){
    return id;
  }
  public void setName(String name){
    this.name = name;
  }
  public String getName(){
    return name;
  }


}