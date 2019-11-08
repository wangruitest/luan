package com.funo.services;


/**
 * webservices接口返回数据
 * @author Administrator
 *
 */
public class TouristByScenicResponse {

	private Object lstInChina;
	private String msg;
	/**
	 * 0－成功，1－失败，2－异常
	 */
	private String result;
	private String scenicCode;
	private String searchDate;
	public Object getLstInChina() {
		return lstInChina;
	}
	public void setLstInChina(Object lstInChina) {
		this.lstInChina = lstInChina;
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
	public String getScenicCode() {
		return scenicCode;
	}
	public void setScenicCode(String scenicCode) {
		this.scenicCode = scenicCode;
	}
	public String getSearchDate() {
		return searchDate;
	}
	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}
}
