package com.funo.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.funo.base.other.BusinessException;


public class DateUtils extends org.apache.commons.lang.time.DateUtils {
	public static String formatDate(Date date) {
		if(null==date)return "";
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return format.format(date);
	}
	
	/**
	 * 
	 * 描述：返回当前精确到小时的时间
	 * @return 
	 * @return：String
	 * @author 吴宝龙
	 * @date： 2016年2月15日 上午10:27:19
	 */
	public static String nowHourTime(){
		Calendar cal=Calendar.getInstance();
		int year= cal.get(Calendar.YEAR);
		int monthTemp= cal.get(Calendar.MONTH)+1;
		String month=monthTemp<10?"0"+monthTemp:String.valueOf(monthTemp);
		int dayTemp=cal.get(Calendar.DAY_OF_MONTH);
		String day=dayTemp<10?"0"+dayTemp:String.valueOf(dayTemp);
		int hourTemp=cal.get(Calendar.HOUR_OF_DAY);
		String hour=hourTemp<10?"0"+hourTemp:String.valueOf(hourTemp);
		
		String nowHour=year+"-"+month+"-"+day+" "+hour+":00:00";
		return nowHour;
	}
	
	/**
	 * 
	 * 描述：返回今天的0点时间
	 * @return 
	 * @return：String
	 * @author 吴宝龙
	 * @date： 2016年2月15日 上午10:27:05
	 */
	public static String todayHourTime(){
		Calendar cal=Calendar.getInstance();
		int year= cal.get(Calendar.YEAR);
		int monthTemp= cal.get(Calendar.MONTH)+1;
		String month=monthTemp<10?"0"+monthTemp:String.valueOf(monthTemp);
		int dayTemp=cal.get(Calendar.DAY_OF_MONTH);
		String day=dayTemp<10?"0"+dayTemp:String.valueOf(dayTemp);
		/*int hourTemp=cal.get(Calendar.HOUR_OF_DAY);
		String hour=hourTemp<10?"0"+hourTemp:String.valueOf(hourTemp);*/
		
		String nowHour=year+"-"+month+"-"+day+" "+"00:00:00";
		return nowHour;
	}

	public static String formatDate(Date date, String format) {
		if(null==date)return "";
		SimpleDateFormat dateFormat = new SimpleDateFormat(format);
		return dateFormat.format(date);
	}

	public static Date parseDate(String date) {
		SimpleDateFormat format;
		try {
			if (date.indexOf("/") > 0) {
				if (date.length() > 12)
					format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				else
					format = new SimpleDateFormat("yyyy/MM/dd");
				return format.parse(date);
			}else if(date.indexOf("-")>0){
				if (date.length() > 12)
					format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				else
					format = new SimpleDateFormat("yyyy-MM-dd");
				return format.parse(date);
			}else{
				if (date.length() > 8)
					format = new SimpleDateFormat("yyyyMMddHHmmss");
				else
					format = new SimpleDateFormat("yyyyMMdd");
				return format.parse(date);
			}
		} catch (ParseException e) {
			throw new BusinessException(e);
		}
	}

	public static Date parseDate(String date, String formatStr) {
		SimpleDateFormat format = new SimpleDateFormat(formatStr);
		try {
			return format.parse(date);
		} catch (ParseException e) {
			throw new BusinessException(e);
		}
	}

	public static Date getStartDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		try {
			return format.parse("1900/01/01 00:00:00");
		} catch (ParseException e) {
			return null;
		}
	}

	public static Date getEndDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		try {
			return format.parse("2100/01/01 00:00:00");
		} catch (ParseException e) {
			throw new BusinessException(e);
		}
	}

	public static Date getStartToday(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		try {
			return timeFormat.parse(dateFormat.format(date == null ? new Date() : date) + " 00:00:00");
		} catch (ParseException e) {
			throw new BusinessException(e);
		}
	}

	public static Date getEndToday(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		try {
			return timeFormat.parse(dateFormat.format(date == null ? new Date() : date) + " 23:59:59");
		} catch (ParseException e) {
			throw new BusinessException(e);
		}
	}
	public static String getCurrentDate(){
		SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd");
	    String currentDateTime = tempDate.format(new java.util.Date());
	    return currentDateTime;
	}
	public static String getCurrentDateNum(){
		SimpleDateFormat tempDate = new SimpleDateFormat("yyyyMMdd");
		String currentDateTime = tempDate.format(new java.util.Date());
		return currentDateTime;
	}
	public static String getCurrentDateTime(){
		SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDateTime = tempDate.format(new java.util.Date());
		return currentDateTime;
	}
	public static String getCurrentTime(){
		SimpleDateFormat tempDate = new SimpleDateFormat("HH:mm:ss");
		String currentDateTime = tempDate.format(new java.util.Date());
		return currentDateTime;
	}
	public static String getCurrentMillDateTime(){
		SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		String currentDateTime = tempDate.format(new java.util.Date());
		return currentDateTime;
	}
	public static String getCurrentMillDateTimeNum(){
		SimpleDateFormat tempDate = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String currentDateTime = tempDate.format(new java.util.Date());
		return currentDateTime;
	}
	public static String getCurrentLongMillDateTimeNum(){
		SimpleDateFormat tempDate = new SimpleDateFormat("yyyyMMddHHmmssnnnn");
		String currentDateTime = tempDate.format(new java.util.Date());
		return currentDateTime;
	}
	public static String getCurrentDateTimeNum(){
		SimpleDateFormat tempDate = new SimpleDateFormat("yyyyMMddHHmmss");
		String currentDateTime = tempDate.format(new java.util.Date());
		return currentDateTime;
	}
	public static String dateAppend(int addDayNum){
		Date d=new Date();   
	    SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd"); 
	    return df.format(new Date(d.getTime() + addDayNum * 24 * 60 * 60 * 1000));
	}
	
	public static String dateReduce(int addDayNum){
		Date d=new Date();   
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd"); 
		return df.format(new Date(d.getTime() - addDayNum * 24 * 60 * 60 * 1000));
	}
	
	/**
	 * <p>
	 *	<b>describe:获取XXX年的今天</b><br>
	 *	 <br>
	 * <b><i>notice:</i></b>
	 *	<ol>
	 *		<li></li>
	 *	</ol>
	 * </p>
	 * @param addYear  传-1 为去年 传1 为下一年
	 * @return
	 * @author Chen-JY
	 */
	public static String getLastYear(int addYear){  
         
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd"); 
        Calendar cal = Calendar.getInstance();  
        cal.setTime(new Date());  
        cal.add(Calendar.YEAR,addYear);  
        String dateTmp = df.format(cal.getTime());  
        return dateTmp;   
      }
}
