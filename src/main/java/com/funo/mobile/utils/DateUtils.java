package com.funo.mobile.utils;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.commons.lang.StringUtils;

public class DateUtils {

	public static Timestamp getNowTimeStamp(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.sql.Timestamp time = java.sql.Timestamp.valueOf(sdf
				.format(new Date())); // 时间格式
		return time;
	}
	
	
	public static Time getNowTime(){
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		
		return Time.valueOf(sdf.format(new Date()));
	}
	
	/**
	 * 获取执行小时前的时间
	 * @param bf_hour
	 * @return
	 */
	public static Time getBeforeTime(int bfHour,int bfMinute,int bfSecond){
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		Calendar c = Calendar.getInstance();
		int hour = c.get(Calendar.HOUR);
		c.set(Calendar.HOUR, hour-bfHour);//一个小时前
		int minute = c.get(Calendar.MINUTE);
		c.set(Calendar.MINUTE, minute-bfMinute);
		int second = c.get(Calendar.SECOND);
		c.set(Calendar.SECOND, second-bfSecond);
		
		
		Time time = Time.valueOf(sdf.format(c.getTime())); // 时间格式
		return time;
	}
	
	
	/**
	 * <p>
	 *	<b>describe:</b><br>
	 *	根据时间差取得完整是时间和日期 <br>
	 * <b><i>notice:</i></b>
	 *	<ol>
	 *		<li></li>
	 *	</ol>
	 * </p>
	 * @param bHour
	 * @param bMinute
	 * @param bSecond
	 * @return
	 * @author shijiansheng
	 */
	public static Timestamp getBeforeTimeStamp(int bHour,int bMinute,int bSecond){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar c = Calendar.getInstance();
		int hour = c.get(Calendar.HOUR);
		c.set(Calendar.HOUR, hour-bHour);//一个小时前
		int minute = c.get(Calendar.MINUTE);
		c.set(Calendar.MINUTE, minute-bMinute);
		int second = c.get(Calendar.SECOND);
		c.set(Calendar.SECOND, second-bSecond);
		
		Timestamp time = Timestamp.valueOf(sdf.format(c.getTime())); // 时间格式\
		
		return time;
	}
	
	/**
	 * <p>
	 *	<b>describe:</b><br>
	 *	 获取指定的年月日时分秒单位的时间差<br>
	 * <b><i>notice:</i></b>
	 *	<ol>
	 *		<li></li>
	 *	</ol>
	 * </p>
	 * @param diff
	 * @param type
	 * @return
	 * @author shijiansheng
	 */
	public static Timestamp getBeforeTime(int diff,String type){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar c = Calendar.getInstance();
		//年
		if(StringUtils.equals(type, "year")){
			int y = c.get(Calendar.YEAR);
			c.set(Calendar.YEAR, y - diff);
		//月
		}else if(StringUtils.equals(type, "month")){
			int m = c.get(Calendar.MONTH);
			c.set(Calendar.MONTH, m - diff);
		//日	
		}else if(StringUtils.equals(type, "date")){
			int d = c.get(Calendar.DATE);
			c.set(Calendar.DATE, d-diff);
		//时	
		}else if(StringUtils.equals(type, "hour")){
			int hour = c.get(Calendar.HOUR);
			c.set(Calendar.HOUR, hour-diff);
		//分	
		}else if(StringUtils.equals(type, "minute")){
			int minute = c.get(Calendar.MINUTE);
			c.set(Calendar.MINUTE, minute-diff);
		//秒	
		}else if(StringUtils.equals(type, "second")){
			int second = c.get(Calendar.SECOND);
			c.set(Calendar.SECOND, second-diff);
		}
		
		Timestamp time = Timestamp.valueOf(sdf.format(c.getTime()));
		
		return time;
	}
	
	public static void beforeOneHourToNowDate() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, calendar.get(Calendar.HOUR_OF_DAY) - 72);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println("一个小时前的时间：" + df.format(calendar.getTime()));
		System.out.println("当前的时间：" + df.format(new Date()));
	} 
	
	/**
	 * 获取当前的日期为几日
	 * @return
	 */
	public static int getCurrDate(){
		Calendar c = Calendar.getInstance();
		return c.get(Calendar.DATE);
	}
	
	/**
	 * 获取当前的年月
	 * @return
	 */
	public static String getCurrYearMonth(){
		DateFormat df =new SimpleDateFormat("yyyy-MM");
		String str = df.format(new Date());
		return str;
	}
	
	/**
	 * 减去当前分钟
	 * @param time
	 * @param minute
	 * @return
	 */
	public static Time subMinute(Time time,int minute){

		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		
		Calendar c = Calendar.getInstance();
		c.setTime(time);
		int nowMinute = c.get(Calendar.MINUTE);
		c.set(Calendar.MINUTE, nowMinute-minute);
		
		return Time.valueOf(sdf.format(c.getTime()));
	}
	
	
	/**
	 * 加当前分钟
	 * @param time
	 * @param minute
	 * @return
	 */
	public static Time addMinute(Time time,int minute){
		
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		
		Calendar c = Calendar.getInstance();
		c.setTime(time);
		int muinute = c.get(Calendar.MINUTE);
		c.set(Calendar.MINUTE, muinute+minute);
		
		return Time.valueOf(sdf.format(c.getTime()));
	}
	
	/**
	 * 转换为日期
	 * @param dateStr
	 * @param formatter
	 * @return
	 */
	public static Date toDate(String dateStr,String formatter){
		SimpleDateFormat sdf = new SimpleDateFormat(formatter);
		Date date = null;
		try {
			date = sdf.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	public static String formatterDate(Date date ,String formatter){
		SimpleDateFormat sdf = new SimpleDateFormat(formatter);
		return sdf.format(date);
	}
	
	/**
	 * 日期 减去制定的日期
	 * @param date
	 * @param d ： 日期
	 * @return
	 */
	public static Date subDate(Date date ,int d){
		
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int day = c.get(Calendar.DATE);
		c.set(Calendar.DATE, day-d);
		
		return c.getTime();
		
	}
	
	/**
	 * 获取一周前的日期
	 * @param date
	 * @return
	 */
	public static Date getBeforeWeekDay(Date date){
		return subDate(date, 7);
	}
	
	/**
	 * @param date
	 * @return
	 */
	public static boolean  isWeekendDay(String dateStr){
		Date date =  toDate(dateStr, "yyyy-MM-dd");
		Calendar c = new GregorianCalendar();
		c.setTime(date);
		int week = c.get(Calendar.DAY_OF_WEEK);
		
		if(week==7 || week == 1){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 获取时间的小时分钟
	 * */
	public static String getTimeHour(Time time){
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		Calendar c = Calendar.getInstance();
		c.setTime(time);
		return String.valueOf(sdf.format(c.getTime()));
	}
	

	/**
	 * 日期单位的增加
	 */
	public static int diffMonth(Date beginTime,Date endTime){
		Calendar bCalendar = new GregorianCalendar();
		bCalendar.setTime(beginTime);
		
		Calendar eCalendar = new GregorianCalendar();
		eCalendar.setTime(endTime);
		
		int months = (eCalendar.get(Calendar.YEAR) -bCalendar.get(Calendar.YEAR)) * 12  
                 + (eCalendar.get(Calendar.MONTH) - bCalendar.get(Calendar.MONTH));  
		 
		 return months;
	}
		
	
	public static Date timeStampParseDate(Timestamp ts){
		return new Date(ts.getTime()); 
	}
	
	public static String getMonthLastDay(Date date){
	    Calendar ca = Calendar.getInstance();    
	    if(date!= null)
	    				ca.setTime(date);
        ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));  
        
        
        int lastDay = ca.getActualMaximum(Calendar.DAY_OF_MONTH);
        
        return lastDay<10 ? "0"+lastDay : String.valueOf(lastDay);
	}
	

	/**
	 * 取得指定的月份差的月
	 * @param date
	 * @param diff
	 * @param formatter
	 * @return
	 */
	public static String getDiffMonth(Date date,int diff,String formatter){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		if(StringUtils.isNotBlank(formatter)){
			 sdf = new SimpleDateFormat(formatter);
		}
		
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int m = c.get(Calendar.MONTH);
		c.set(Calendar.MONTH, m - diff);
		
		return sdf.format(c.getTime());
		
	}
	
	
	public static void main(String[] args){
//		Time appEtime = Time.valueOf("13:00:00");
//		System.out.println(DateUtils.getTimeHour(appEtime));
//		Time appStime = Time.valueOf("09:00:00");
//		Time tempTime = appStime;
//		
//		do{
//			System.out.println(tempTime);
//			tempTime = DateUtils.addMinute(tempTime, 30);
//		}while((tempTime.before(appEtime))|| tempTime.equals(appEtime));
		
//		System.out.println(DateUtils.toDate("2013-01-08", "yyyy-MM-dd"));
		
//		Date date =getBeforeWeekDay(DateUtils.toDate("2013-01-15", "yyyy-MM-dd"));
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		System.out.println(sdf.format(date));
		
//		System.out.println(isWeekDay(DateUtils.toDate("2013-01-11", "yyyy-MM-dd")));
//		beforeOneHourToNowDate();
//		System.out.println(getBeforeDayTime(72, 0, 0));
		
//		System.out.println(subDate(new Date(), 1));
		
//		System.out.println(getBeforeTime(1,"date"));
		
//		Date date = DateUtils.toDate("2014-01-23 16:41:00", "yyyy-MM-dd HH:mm:ss");
//	System.out.println(	diffMonth(date,DateUtils.getNowTimeStamp()));
//	
//	System.out.println(getMonthLastDay(null));
	
		DateUtils.getBeforeTime(1, "month");
		String time = DateUtils.getDiffMonth(new Date(), 1,"yyyy-MM")+"-"+DateUtils.getMonthLastDay(DateUtils.getBeforeTime(1, "month"));
		System.out.println(time);
	}
	
}
