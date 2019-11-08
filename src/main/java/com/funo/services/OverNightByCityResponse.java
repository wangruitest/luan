package com.funo.services;

public class OverNightByCityResponse {
	
	private Object lstOverNight;
	private String msg;
	/**
	 * 0－成功，1－失败，2－异常
	 */
	private String result;
	private String cityCode;
	
	
	public Object getLstOverNight() {
		return lstOverNight;
	}
	public void setLstOverNight(Object lstOverNight) {
		this.lstOverNight = lstOverNight;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getCityCode() {
		return cityCode;
	}
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	
	
	

}
