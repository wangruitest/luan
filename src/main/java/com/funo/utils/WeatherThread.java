package com.funo.utils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.funo.jqykjd.mgmt.IJqykjdMgmt;
import com.funo.jqykjd.model.Jqykjd;

public class WeatherThread extends Thread{

	private IJqykjdMgmt jqykjdMgmt;
	
	private static Map<String, String> PM25 = new HashMap<String, String>();//缓存PM25
	private static Map<String, String> WD  = new HashMap<String, String>();//缓存天气
	private static Long NOT_DATA = 20*1000L;//没有数据20秒刷一次
	private static Long ONE_TIMES = 60*60*1000L;//一小时刷新一次
	private void init(){
		this.jqykjdMgmt = SpringContextUtils.getBean(IJqykjdMgmt.class);
	}
	
	
	public WeatherThread(){
		init();
	}
	@Override
	public void run() {
		
		try {
			//循环获取天气信息
			while(true){
				
				List<Jqykjd> data = jqykjdMgmt.queryByWeather(new Jqykjd());
				if(data==null || data.size()==0){
					sleep(NOT_DATA);
					continue;
				}
				for(Jqykjd jqykjd : data){
					
					Jqykjd n = new Jqykjd();
					if(jqykjd.getWdUrl() != null && jqykjd.getWdUrl().indexOf("=") !=-1){
						String cacheName = getCacheName(jqykjd.getWdUrl());
						String wd = WD.get(cacheName);//相同城市的直接缓存获取
						if(wd !=null ){
							n.setWd(wd);
						}else{
							String[] weather = request(jqykjd.getWdUrl());//获取天气,PM2.5
							if(weather[0] != null ){
								
								n.setPm(weather[0]);
								n.setWd(weather[1]);
								WD.put(cacheName, weather[1]);
								PM25.put(cacheName, weather[0]);
								
								n.setId(jqykjd.getId());
								jqykjdMgmt.modifyJqykjd(n);
							}
							continue;
							
						}
						
						String pm = PM25.get(cacheName);
						n.setPm(pm);
						n.setId(jqykjd.getId());
						jqykjdMgmt.modifyJqykjd(n);
					}
				}
				PM25.clear();
				WD.clear();
				
				sleep(ONE_TIMES);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	/**
	 * 百度天气API
	 * @param urlAll
	 *            :请求接口
	 * @param httpArg
	 *            :参数
	 * @return 返回结果
	 */
	public static String[] request(String httpUrl) {
	    BufferedReader reader = null;
	    String result = null;
	    StringBuffer sbf = new StringBuffer();
	    String[] returnData = new String[2];
	    try {
	        URL url = new URL(httpUrl);
	        HttpURLConnection connection = (HttpURLConnection) url
	                .openConnection();
	        connection.setRequestMethod("GET");
	        connection.setRequestProperty("apikey",  "22af3fa844d4fd4fc5bd36ea0d181ae6");
	        connection.connect();
	        InputStream is = connection.getInputStream();
	        reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
	        String strRead = null;
	        while ((strRead = reader.readLine()) != null) {
	            sbf.append(strRead);
	            sbf.append("\r\n");
	        }
	        reader.close();
	        result = sbf.toString();
	        JSONObject jsonObject = JSONObject.fromString(result);
	        JSONArray jArray = jsonObject.getJSONArray("HeWeather data service 3.0");
	        JSONObject pm = jArray.getJSONObject(0).getJSONObject("aqi").getJSONObject("city");
			JSONObject tq = jArray.getJSONObject(0).getJSONObject("now");
			returnData[0] = pm.get("pm25").toString();
			returnData[1] = tq.get("tmp").toString();
	    } catch (Exception e) {
	        e.printStackTrace();
	        
	    }
	    
	    
	    return returnData;
	}
	
	/**
	 * <p>
	 *	<b>describe:用城市拼音做缓存</b><br>
	 *	 <br>
	 * <b><i>notice:</i></b>
	 *	<ol>
	 *		<li></li>
	 *	</ol>
	 * </p>
	 * @param url
	 * @return
	 * @author Chen-JY
	 */
	public static String getCacheName(String url){
		
		if(url.lastIndexOf("=") != -1){
			return url.substring(url.lastIndexOf("=")+1,url.length());
		}
		return null;
	}
	
}
