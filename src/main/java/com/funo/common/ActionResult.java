package com.funo.common;

import java.io.Serializable;
import java.util.List;

/**
 * Action结果对象
 * @author ChenXifu
 * @version 1.0
 * @createDate 2011-1-2下午10:43:28
 */
public class ActionResult implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 返回码:0-成功;
	 */
	public Integer resultCode = 0;

	public String resultMessage;
	/**
	 * 数据对象
	 */
	public Object returnObject;
	/**
	 * 列表对象
	 */
	private List<Object> returnList=null;

	public ActionResult() {
	}
	
	public ActionResult(Object obj) {
		returnObject = obj;
	}

	public ActionResult(Integer code, String mes) {
		resultCode = code;
		resultMessage = mes;
	}

	public ActionResult(Integer code, String mes, Object obj) {
		resultCode = code;
		resultMessage = mes;
		returnObject = obj;
	}

	public Integer getResultCode() {
		return resultCode;
	}

	public void setResultCode(Integer resultCode) {
		this.resultCode = resultCode;
	}

	public String getResultMessage() {
		return resultMessage;
	}

	public void setResultMessage(String resultMessage) {
		this.resultMessage = resultMessage;
	}

	public Object getReturnObject() {
		return returnObject;
	}

	public void setReturnObject(Object returnObject) {
		this.returnObject = returnObject;
	}

	public List<Object> getReturnList() {
		return returnList;
	}

	public void setReturnList(List<Object> returnList) {
		this.returnList = returnList;
	}

	

}
