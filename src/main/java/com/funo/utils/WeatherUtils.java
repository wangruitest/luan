// ~ CopyRight © 2016 AHZY  SOFTWARE CO.LTD All Rights Reserved.
package com.funo.utils;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.xml.namespace.QName;

import net.sf.json.JSONObject;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.InputStreamRequestEntity;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;

import com.funo.regionCoords.model.Weather;
import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;

/**
 * 描述：天气、PM2.5帮助方法 <br />
 * @version:1.0.0 <br />
 * @author 吴宝龙 <br />
 * @email： wubaolongzy@ahmobile.com <br />
 * @date： 2016年1月29日 上午11:19:53 <br />
 * CopyRight © 2016 AHZY All Rights Reserved.
 */
public class WeatherUtils {
	
	private static Log log=LogFactory.getLog(WeatherUtils.class);

	public static void main(String[] args) {
		/*Weather str = WeatherUtils.returnWeatherByISPScenic("120003");

		System.out.println(str);*/
		
		/*Calendar cal=Calendar.getInstance();
		int year= cal.get(Calendar.YEAR);
		int monthTemp= cal.get(Calendar.MONTH)+1;
		String month=monthTemp<10?"0"+monthTemp:String.valueOf(monthTemp);
		int dayTemp=cal.get(Calendar.DAY_OF_MONTH);
		String day=dayTemp<10?"0"+dayTemp:String.valueOf(dayTemp);
		int hourTemp=cal.get(Calendar.HOUR_OF_DAY);
		String hour=hourTemp<10?"0"+hourTemp:String.valueOf(hourTemp);
		
		String nowHour=year+"-"+month+"-"+day+" "+hour+":00:00";
		System.out.println(nowHour);*/
		
		/*try {
			QName qname=new QName(WeatherUtils.namespace,WeatherUtils.methodByOwnScenic);
			Ahtadbservices_Service as=(Ahtadbservices_Service) Ahtadbservices_Service.create(new URL(WeatherUtils.url), qname);
			Ahtadbservices ah=as.getPort(Ahtadbservices.class);
			String str= ah.getTouristByScenic("119001");
			System.out.println(str);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		
		
	}
	
	private static String return302Result=null;

	/**
	 * 访问服务
	 * 
	 * @param wsdl
	 *            wsdl地址
	 * @param ns
	 *            命名空间
	 * @param method
	 *            方法名
	 * @param params
	 *            参数
	 * @return
	 * @throws Exception
	 */
	public synchronized static String accessService(String wsdl, String ns,
			String method, Map<String, String> params)
			throws Exception {
		// 拼接参数
		String param = getParam(params);
		String soapResponseData = "";
		// 拼接SOAP
		StringBuffer soapRequestData = new StringBuffer("");
		soapRequestData
				.append("<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">");
		soapRequestData.append("<soap:Body>");
		soapRequestData.append("<ns1:" + method + " xmlns:ns1=\"" + ns + "\">");
		soapRequestData.append(param);
		soapRequestData.append("</ns1:" + method + ">");
		soapRequestData.append("</soap:Body>" + "</soap:Envelope>");
		PostMethod postMethod = new PostMethod(wsdl);
		
		// 然后把Soap请求数据添加到PostMethod中
		byte[] b = null;
		InputStream is = null;
		try {
			b = soapRequestData.toString().getBytes("utf-8");
			is = new ByteArrayInputStream(b, 0, b.length);
			RequestEntity re = new InputStreamRequestEntity(is, b.length,
					"text/xml; charset=UTF-8");
			postMethod.setRequestEntity(re);
			HttpClient httpClient = new HttpClient();
			httpClient.setTimeout(10000);
			int status = httpClient.executeMethod(postMethod);
			System.out.println("status:" + status);
			if (status == 200) {
				soapResponseData = postMethod.getResponseBodyAsString();
				return302Result=soapResponseData;
			}else{
				soapResponseData=return302Result;
			}
		} catch (Exception e) {
			log.error("获取天气发生了错误："+e.getMessage());
			//e.printStackTrace();
			soapResponseData=return302Result;
		} finally {
			if (is != null) {
				is.close();
			}
		}
		return soapResponseData;
	}

	public static String getParam(Map<String, String> params) {
		String param = "";
		if (params != null) {
			Iterator<String> it = params.keySet().iterator();
			while (it.hasNext()) {
				String str = it.next();
				param += "<" + str + ">";
				param += params.get(str);
				param += "</" + str + ">";
			}
		}
		return param;
	}

	public static Weather getMesage(String soapAttachment) {
		Weather weather = new Weather();
		try {
			int start = soapAttachment.indexOf("<out>");
			int end = soapAttachment.indexOf("</out>");
			String temp = soapAttachment.substring(start + "<out>".length(), end);
			JSONObject json = JSONObject.fromString(temp);
			
			JSONObject jsonIn = json.getJSONObject("data");
			if (jsonIn != null) {
				//weather =
				weather.setCurrentCode(isNullReturnEmpty(jsonIn.getString("current_code")));
				weather.setCurrentTemperature(isNullReturnEmpty(jsonIn.getString("current_temperature")));
				weather.setCurrentText(isNullReturnEmpty(jsonIn.getString("current_text")));
				weather.setPm25(isNullReturnEmpty(jsonIn.getString("pm25")));
				weather.setWeatherDate(isNullReturnEmpty(jsonIn.getString("weather_date")));
				weather.setWindDirection(isNullReturnEmpty(jsonIn.getString("wind_direction")));
				weather.setWindScale(isNullReturnEmpty(jsonIn.getString("wind_scale")));
				weather.setWindSpeed(isNullReturnEmpty(jsonIn.getString("wind_speed")));
			}
		} catch (Exception e) {
			// TODO: handle exception
			weather.setCurrentCode("");
			weather.setCurrentTemperature("");
			weather.setCurrentText("");
			weather.setPm25("");
			weather.setWeatherDate("");
			weather.setWindDirection("");
			weather.setWindScale("");
			weather.setWindSpeed("");
		}
		log.warn("返回天气信息："+weather);
		return weather;
	}
	
	private static String isNullReturnEmpty(String str){
		
		return str==null?"":str;
	}

	private static String url = "http://db.ahta.com.cn/api/server.php?wsdl";
	private static String namespace = "http://db.ahta.com.cn/api/";
	private static String methodByCity = "getWeatherByCity";
	private static String methodByOwnScenic = "getWeatherByScenic";
	private static String methodByISPScenic = "getWeatherByISP";

	/**
	 * 
	 * 描述：根据城市编码获取城市天气信息
	 * @param cityCode
	 * @return 
	 * @return：Weather
	 * @author 吴宝龙
	 * @date： 2016年1月29日 下午4:07:59
	 */
	public static Weather returnWeatherByCity(String cityCode) {

		Map<String, String> param = new HashMap<String, String>();
		param.put("citycode", cityCode);
		String response = null;
		try {
			response = accessService(url, namespace, methodByCity, param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Weather weather= getMesage(response);
		return weather;
	}

	/**
	 * 
	 * 描述：根据对方景区编码获取景区天气信息
	 * @param scenicCode
	 * @return 
	 * @return：Weather
	 * @author 吴宝龙
	 * @date： 2016年1月29日 下午4:08:17
	 */
	public static Weather returnWeatherByOwnScenic(String scenicCode) {

		Map<String, String> param = new HashMap<String, String>();
		param.put("sceniccode", scenicCode);
		String response = null;
		try {
			response = accessService(url, namespace, methodByOwnScenic, param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Weather weather= getMesage(response);
		return weather;
	}
	
	/**
	 * 
	 * 描述：根据移动景区编码获取景区天气信息
	 * @param scenicCode
	 * @return 
	 * @return：Weather
	 * @author 吴宝龙
	 * @date： 2016年1月29日 下午4:08:38
	 */
	public static Weather returnWeatherByISPScenic(String scenicCode) {

		Map<String, String> param = new HashMap<String, String>();
		param.put("sceniccode", scenicCode);
		String response = null;
		try {
			response = accessService(url, namespace, methodByISPScenic, param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Weather weather= getMesage(response);
		return weather;
	}

}

 

	

