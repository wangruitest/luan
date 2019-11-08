package com.funo.utils;

import java.util.ArrayList;

public class MapAreaModel {
	
	private Integer areaid = 0;
	
	private ArrayList<PointModel> pointList = new ArrayList<PointModel>();
	
	public MapAreaModel() {
		
	}
	
	public MapAreaModel(Integer areaid, ArrayList<PointModel> pointList) {
		this.areaid = areaid;
		this.pointList = pointList;
	}

	public Integer getAreaid() {
		return areaid;
	}

	public void setAreaid(Integer areaid) {
		this.areaid = areaid;
	}

	@Override
	public String toString() {
		return areaid.toString();
	}

	public ArrayList<PointModel> getPointList() {
		return pointList;
	}

	public void setPointList(ArrayList<PointModel> pointList) {
		this.pointList = pointList;
	}

}

