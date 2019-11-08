package com.funo.holidayAreaOrScenic.dao;

import java.util.Map;

import com.funo.base.dao.CommonDao;
import com.funo.holidayAreaOrScenic.model.*;

public interface IHolidayAreaScenicDao extends CommonDao<HolidayAreaScenic> {

	
	Map<String, Object> areaRegion(HolidayAreaScenic holidayAreaScenic);
}