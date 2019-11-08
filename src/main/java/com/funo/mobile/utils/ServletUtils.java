package com.funo.mobile.utils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.funo.mobile.MobileConstants;

public class ServletUtils {

	/**
	 * <p>
	 *	<b>describe:</b><br>
	 *	 <br>
	 * <b><i>notice:</i></b>
	 *	<ol>
	 *		<li></li>
	 *	</ol>
	 * </p>
	 * @param jsonStr
	 * @param request
	 * @param response
	 * @param params
	 * @throws Exception
	 * @author shijiansheng
	 */
	public static  void outputJson(String jsonStr, HttpServletRequest request,HttpServletResponse response,String header) throws Exception {
		response.setContentType(StringUtils.isBlank(header)?"text/html; charset=UTF-8":header); // 数据源为json时
		request.setCharacterEncoding("utf-8");

		// 这里动态获取XML或json格式的字符串（格式如下）
		response.getWriter().write(jsonStr); // 返回XML数据源
		response.getWriter().flush();
		response.getWriter().close();
	}
	
	
	/**
	 *  指定日期转换<br>
	 *  为防止跨域月份的日期，统一采用整月份转换
	 * @param type
	 * @return
	 */
	public static String parseBeginTime(String type){
		Timestamp ts = null;
		if(StringUtils.equals(type, "0")){
			//当前年月
			 ts =  DateUtils.getNowTimeStamp();//DateUtils.getBeforeTime(0, "month");
		}else if(StringUtils.equals(type,"1")){  
			 ts =  DateUtils.getBeforeTime(3, "month");
		}else if(StringUtils.equals(type, "2")){
		    ts =  DateUtils.getBeforeTime(6, "month");
		}else if(StringUtils.equals(type, "3")){
		    ts =  DateUtils.getBeforeTime(12, "month");
		}
		
		Calendar c  = Calendar.getInstance();
		c.setTime(ts);
		
		DateFormat df =new SimpleDateFormat("yyyy-MM");
		String str = df.format(c.getTime());
		
		return  str; //c.get(Calendar.YEAR)+"-"+(c.get(Calendar.MONTH)+1);
	}
	
	
	/**
	 * 对于查询为近一个月（3.8 游客驻留时间统计接口、3.9 游客旅游天数统计接口）的报表特殊处理
	 * @param time
	 * @return
	 */
	public static String parseSpecBeginTime(String time){
		String startTime = null;
		if(StringUtils.isNotBlank(time) &&StringUtils.equals(time, "0")){
			Timestamp ts =  DateUtils.getBeforeTime(1, "month");
			Calendar c  = Calendar.getInstance();
			c.setTime(ts);
			DateFormat df =new SimpleDateFormat("yyyy-MM");
			startTime  = df.format(c.getTime());
		}else{
			startTime = ServletUtils.parseBeginTime(time);
		}
		
		return startTime;
	}
	
	/**
	 * 相除转换为百分表示串
	 */
	public static String parsePercent(DecimalFormat df,Long count ,Long sum){
		String precentStr = "0";
		if(df == null)  df =  new DecimalFormat("0.00");
		if(sum != 0L){
			precentStr = df.format( ((double)count/sum)*100);
		}
		
		return precentStr+"%";
	}
	
	
	public static String parseCityId(String cityId){
		return StringUtils.equals("cityId", MobileConstants.PROVINCE_CODE)? null : cityId; 
	}
	
	public static String parseScenicCode(String regionId){
		return StringUtils.equals("regionId", MobileConstants.PROVINCE_CODE)? null : regionId; 
	}
	
}
