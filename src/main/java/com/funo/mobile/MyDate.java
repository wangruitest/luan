package com.funo.mobile;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class MyDate {

	/**
	 * <p>
	 *	<b>describe:获取insDate 年</b><br>
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
	public static String getLastYear(String insDate,int addYear){  
		Date d = new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd"); 
		try {
			d = df.parse(insDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        Calendar cal = Calendar.getInstance();  
        cal.setTime(d);  
        cal.add(Calendar.YEAR,addYear);  
        String dateTmp = df.format(cal.getTime());  
        return dateTmp;   
      }
	
	public static String dateReduce(int addDayNum){
		Date d=new Date();   
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd"); 
		return df.format(new Date(d.getTime() - addDayNum * 24 * 60 * 60 * 1000));
	}
	
	public static String getCurrentDate(){
		SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd");
	    String currentDateTime = tempDate.format(new java.util.Date());
	    return currentDateTime;
	}
	
	public static String peserces(double a ,double b ){
		java.text.DecimalFormat   df   =new   java.text.DecimalFormat("0.00");  
		
		return df.format(a/b*100)+"%";
		
	}
	
	public static String getCurrentHour(){
		SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd HH");
	    String currentDateTime = tempDate.format(new java.util.Date());
	    return currentDateTime;
	}
	
	/**
	 * <p>
	 *	<b>describe:</b><br>
	 *	 <br>
	 * <b><i>notice:0:近一个月、1:近三个月、2:近半年、3:近一年</i></b>
	 *	<ol>
	 *		<li></li>
	 *	</ol>
	 * </p>
	 * @param type
	 * @return
	 * @author Chen-JY
	 */
	public static String[] getTimes(String type){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		String[] res = new String[2];
		res[1] = sdf.format(new Date());
		if(type.equals("0")){
			int m = c.get(Calendar.MONTH);
			c.set(Calendar.MONTH, m-1);
			res[0] = sdf.format(c.getTime());
		}else if(type.equals("1")){
			int m = c.get(Calendar.MONTH);
			c.set(Calendar.MONTH, m-3);
			res[0] = sdf.format(c.getTime());
		}else if(type.equals("2")){
			int m = c.get(Calendar.MONTH);
			c.set(Calendar.MONTH, m-6);
			res[0] = sdf.format(c.getTime());
		}else{
			int y = c.get(Calendar.YEAR);
			c.set(Calendar.YEAR, y-1);
			res[0] = sdf.format(c.getTime());
		}
		
		return res;
		
	}
	
	public static void main(String[] args) {
		System.out.println(getTimes("2")[0]+":"+getTimes("2")[1]);
	}
}
