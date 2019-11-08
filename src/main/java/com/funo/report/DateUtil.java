package com.funo.report;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


/**
 * �������dateUtil��
 * 
 * @author xxu
 * 
 */
public class DateUtil
{

	/**
	 * ��ݸ�ʱ���ַ�2009-01-01���õ���Ӧdate�Ͷ��� 
	 * @param dateString
	 * @return date
	 */
	public static Date getDateByString(String dateString)
	{
		String str = dateString;
		if(str.contains(" "))
		{
			str = str.split(" ")[0];
		}
		java.text.SimpleDateFormat sf = new java.text.SimpleDateFormat(
				"yyyy-MM-dd");

		java.util.Date stringToDate = null;
		try
		{
			stringToDate = sf.parse(str);
		} catch (ParseException e)
		{
			// TODO Auto-generated catch block
			//e.printStackTrace();
			Date d = new Date(dateString);
			Date date = new java.sql.Date(d.getTime());
			return date;
		}// ����yyyy-MM-dd��ʽ��date��

		Date date = new java.sql.Date(stringToDate.getTime());//

		return date;
	}
	
	public static Date getDateByString2(String dateString)
	{
		String str = dateString;
		if(str.contains(" "))
		{
			str = str.split(" ")[0];
		}
		java.text.SimpleDateFormat sf = new java.text.SimpleDateFormat(
				"yyyy-MM");

		java.util.Date stringToDate = null;
		try
		{
			stringToDate = sf.parse(str);
		} catch (ParseException e)
		{
			// TODO Auto-generated catch block
			//e.printStackTrace();
			Date d = new Date(dateString);
			Date date = new java.sql.Date(d.getTime());
			return date;
		}// ����yyyy-MM-dd��ʽ��date��

		Date date = new java.sql.Date(stringToDate.getTime());//

		return date;
	}
	
	/**
	   * ʱ���ʽת��yyyy-mm-dd-->yyyymmdd
	   * @param dateStr String
	   * @return String
	   */
	  public static String formatDateStr(String dateStr) {
	    String tmp1 = dateStr.substring(0, 4);
	    String tmp2 = dateStr.substring(5, 7);
	    String tmp3 = dateStr.substring(8, 10);
	    String tmp = tmp1 + tmp2 + tmp3;
	    return tmp;
	  }
	  
	  
	  public static String format(Date date, String pattern)
		{
			SimpleDateFormat matter = new SimpleDateFormat(pattern);
			return matter.format(date);
		}
	  
	  
	  /**        
	   * 得到几天前的时间        *         
	   * * @param d        
	   * * @param day        
	   * * @return        */       
	  public static Date getDateBefore(Date d, int day) { 
		  Calendar now = Calendar.getInstance();           
		  now.setTime(d);           
		  now.set(Calendar.DATE, now.get(Calendar.DATE) - day);            
		  return now.getTime();        
	}    
	  
	  
	  /**        
	   * 得到几天前的时间        *         
	   * * @param d        
	   * * @param day        
	   * * @return        */       
	  public static Date getMonthBefore(Date d, int month) { 
		  Calendar now = Calendar.getInstance();   
		  d = getDateByString2(format(d,"yyyy-MM"));
		  now.setTime(d);  
		  now.set(Calendar.MONTH, now.get(Calendar.MONTH) - month);            
		  return now.getTime();        
	} 
	  
	  /**        
	   * 得到几小时前的时间        *         
	   * * @param d        
	   * * @param day        
	   * * @return        */       
	  public static Date getHourBefore(Date d, int hour) { 
		  Calendar now = Calendar.getInstance();           
		  now.setTime(d);           
		  now.set(Calendar.HOUR, now.get(Calendar.HOUR) - hour);            
		  return now.getTime();        
	} 
	  
	  /**        
	   * 得到几天后的时间        *         
	   * * @param d        
	   * * @param day        
	   * * @return        */       
	  public static Date getMonthAfter(Date d, int month) { 
		  Calendar now = Calendar.getInstance();        
		  d = getDateByString2(format(d,"yyyy-MM"));
		  now.setTime(d);           
		  now.set(Calendar.MONTH, now.get(Calendar.MONTH) + month);            
		  return now.getTime();        
	}
	  
	  
	  /**        
	   * * 得到几天后的时间        *         
	   * * @param d        
	   * * @param day        
	   * * @return        */        
	  public static Date getHourAfter(Date d, int hour) {            
		  Calendar now = Calendar.getInstance();            
		  now.setTime(d);            
		  now.set(Calendar.HOUR, now.get(Calendar.HOUR) + hour);            
		  return now.getTime();        
	  } 
	  
	  /**        
	   * * 得到几小时后的时间        *         
	   * * @param d        
	   * * @param day        
	   * * @return        */        
	  public static Date getDateAfter(Date d, int day) {            
		  Calendar now = Calendar.getInstance();            
		  now.setTime(d);            
		  now.set(Calendar.DATE, now.get(Calendar.DATE) + day);            
		  return now.getTime();        
	  } 
	  
	  
	  /**
		 * 获取日期间间隔天数 
		 * 
		 * @param startDate
		 * @param endDate
		 * @return
		 */
		public static Long getDateIntervalDay(Date startDate, Date endDate) {
			Long sec = getDateIntervalSecond(startDate, endDate);
			Long day = sec / (24 * 3600);
			return day;
		}
		
		/**
		 * 获取日期间间隔月份 
		 * 
		 * @param startDate
		 * @param endDate
		 * @return
		 */
		public static Long getDateIntervalMonth(Date startDate, Date endDate) {
			Long mon = new Long("0");
			if (startDate != null) {
				Date begin, end;
				if (startDate.getTime() > endDate.getTime()) {
					begin = endDate;
					end = startDate;
				} else {
					begin = startDate;
					end = endDate;
				}
				mon = new Long(((end.getYear() - begin.getYear()) * 12 + (end.getMonth() - begin.getMonth())));
			}
			return mon;
		}
		
		/**
		 * 获取日期间间隔秒数 
		 * 
		 * @param startDate
		 * @param endDate
		 * @return
		 */
		public static Long getDateIntervalSecond(Date startDate, Date endDate) {
			Long sec = new Long("0");
			if (startDate != null) {
				sec = (Math.abs(startDate.getTime() - endDate.getTime())) / 1000;
			}
			return sec;
		}
		

		/**
		 * 获取日期间间隔小时 
		 * 
		 * @param startDate
		 * @param endDate
		 * @return
		 */
		public static Long getDateIntervalHour(Date startDate, Date endDate) {
			Long sec = getDateIntervalSecond(startDate, endDate);
			Long hour = sec / 3600;
			return hour;
		}

		
	
}
