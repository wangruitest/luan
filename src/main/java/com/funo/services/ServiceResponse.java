package com.funo.services;

import org.apache.commons.lang.StringUtils;

/**
 * webservices接口返回数据
 * @author Administrator
 *
 */
public class ServiceResponse {

	/**
	 * 0－成功，1－失败，2－异常
	 */
	private String resultCode;
	private Object returnObj;
	private String resultMsg;
	public String getResultCode() {
		if(StringUtils.isEmpty(resultCode)){
			resultCode="1";
		}
		return resultCode;
	}
	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}
	public Object getReturnObj() {
		return returnObj;
	}
	public void setReturnObj(Object returnObj) {
		this.returnObj = returnObj;
	}
	public String getResultMsg() {
		return resultMsg;
	}
	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}
	
}
