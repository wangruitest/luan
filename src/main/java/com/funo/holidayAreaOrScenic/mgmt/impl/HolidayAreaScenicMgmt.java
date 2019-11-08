package com.funo.holidayAreaOrScenic.mgmt.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.holidayAreaOrScenic.adapt.IHolidayAreaScenicAdapt;
import com.funo.holidayAreaOrScenic.mgmt.IHolidayAreaScenicMgmt;
import com.funo.holidayAreaOrScenic.model.HolidayAreaScenic;

public class HolidayAreaScenicMgmt extends BaseMgmt implements IHolidayAreaScenicMgmt {

	private static final long serialVersionUID = 1L;
	private IHolidayAreaScenicAdapt holidayAreaScenicAdapt;
	
	public IHolidayAreaScenicAdapt getHolidayAreaScenicAdapt() {
		return holidayAreaScenicAdapt;
	}
	public void setHolidayAreaScenicAdapt(IHolidayAreaScenicAdapt holidayAreaScenicAdapt) {
		this.holidayAreaScenicAdapt = holidayAreaScenicAdapt;
	}

	public String getKey() {
		return holidayAreaScenicAdapt.getKey();
	}

	public HolidayAreaScenic createHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic) {
		holidayAreaScenicAdapt.createHolidayAreaScenic(holidayAreaScenic);
		return holidayAreaScenic;
	}

	public HolidayAreaScenic modifyHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic) {
		holidayAreaScenicAdapt.modifyHolidayAreaScenic(holidayAreaScenic);
		return holidayAreaScenic;
	}

	public void deleteHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic) {
		holidayAreaScenicAdapt.deleteHolidayAreaScenic(holidayAreaScenic);
	}

	public void batchDeleteHolidayAreaScenic(List<HolidayAreaScenic> holidayAreaScenicList) {
		holidayAreaScenicAdapt.batchDeleteHolidayAreaScenic(holidayAreaScenicList);
	}

	public HolidayAreaScenic getHolidayAreaScenicById(String holidayAreaScenicId) {
		return holidayAreaScenicAdapt.getHolidayAreaScenicById(holidayAreaScenicId);
	}

	public List<HolidayAreaScenic> queryHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic) {
		return holidayAreaScenicAdapt.queryHolidayAreaScenic(holidayAreaScenic);
	}
	@Override
	public Map<String, List<String>> queryAreaRegion(HolidayAreaScenic holidayAreaScenic) {
		// TODO Auto-generated method stub
		Map<String, List<String>> mapResult=new HashMap();
		List<String> xdata=new ArrayList<String>();
		List<String> ydata=new ArrayList<String>();
		
		Map<String, Object> mapTemp=holidayAreaScenicAdapt.queryAreaRegion(holidayAreaScenic);
		for (String key : mapTemp.keySet()) {
			xdata.add(key);
			ydata.add(mapTemp.get(key).toString());
		}
		mapResult.put("xdata", xdata);
		mapResult.put("ydata", ydata);
		return mapResult;
	}
	
}