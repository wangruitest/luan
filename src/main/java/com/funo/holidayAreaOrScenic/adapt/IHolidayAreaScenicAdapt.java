package com.funo.holidayAreaOrScenic.adapt;

import java.util.List;
import java.util.Map;

import com.funo.holidayAreaOrScenic.model.HolidayAreaScenic;


public interface IHolidayAreaScenicAdapt {

	public String getKey();

	public HolidayAreaScenic createHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic);

	public HolidayAreaScenic modifyHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic);

	public void deleteHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic);

	public void batchDeleteHolidayAreaScenic(List<HolidayAreaScenic> holidayAreaScenicList);

	public HolidayAreaScenic getHolidayAreaScenicById(String unid);

	public List<HolidayAreaScenic> queryHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic);
	
	public Map<String, Object> queryAreaRegion(HolidayAreaScenic holidayAreaScenic);

}