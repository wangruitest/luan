package com.funo.utils;

public class PointModel {
	
	public double lat;
	
	public double lng;
	
	public PointModel() {
		
	}
	
	public PointModel(double lat, double lng) {
		this.lat = lat;
		this.lng = lng;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

}
