package com.funo.holiday.adapt;

import java.util.List;

import com.funo.holiday.model.Holiday;


public interface IHolidayAdapt {
	
    public String getKey();
	
	public Holiday createHoliday(Holiday holiday);
	
	public Holiday modifyHoliday(Holiday holiday);
	
	public void deleteHoliday(Holiday holiday); 
	
	public void batchDeleteHoliday(List<Holiday> holidayList); 
	
	public Holiday getHolidayById(String unid);
	
	public List<Holiday> queryHoliday(Holiday holiday);
	
	public List<Holiday> queryListByYear(Holiday holiday);
	
	public List<Holiday> queryListByName(Holiday holiday);
	
	public List<Holiday> queryAll(Holiday holiday);

}
