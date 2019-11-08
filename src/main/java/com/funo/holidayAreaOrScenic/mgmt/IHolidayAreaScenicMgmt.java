package com.funo.holidayAreaOrScenic.mgmt;

import java.util.List;
import java.util.Map;

import com.funo.holidayAreaOrScenic.model.HolidayAreaScenic;


public interface IHolidayAreaScenicMgmt {

	public String getKey();

	public HolidayAreaScenic createHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic);

	public HolidayAreaScenic modifyHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic);

	public void deleteHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic);

	public void batchDeleteHolidayAreaScenic(List<HolidayAreaScenic> holidayAreaScenicList);

	public HolidayAreaScenic getHolidayAreaScenicById(String unid);

	public List<HolidayAreaScenic> queryHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic);
	
	public Map<String, List<String>> queryAreaRegion(HolidayAreaScenic holidayAreaScenic);

}