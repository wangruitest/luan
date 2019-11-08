package com.funo.regionCoords.model;

import java.io.Serializable;

public class RegionCoords implements Serializable{

  private static final long serialVersionUID = 1L;
	
  private Long id;
  private Long regionId;
  private Long coordsIndex;
  private String lat;
  private String lng;
  private String regionIdIn;
  
  public void setId(Long id){
    this.id = id;
  }
  public Long getId(){
    return id;
  }
  public void setRegionId(Long regionId){
    this.regionId = regionId;
  }
  public Long getRegionId(){
    return regionId;
  }
  public void setCoordsIndex(Long coordsIndex){
    this.coordsIndex = coordsIndex;
  }
  public Long getCoordsIndex(){
    return coordsIndex;
  }
  public void setLat(String lat){
    this.lat = lat;
  }
  public String getLat(){
    return lat;
  }
  public void setLng(String lng){
    this.lng = lng;
  }
  public String getLng(){
    return lng;
  }
public String getRegionIdIn() {
	return regionIdIn;
}
public void setRegionIdIn(String regionIdIn) {
	this.regionIdIn = regionIdIn;
}


}