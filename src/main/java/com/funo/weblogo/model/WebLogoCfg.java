package com.funo.weblogo.model;

import java.io.Serializable;

public class WebLogoCfg implements Serializable {

	private static final long serialVersionUID = 1L;

	private String logoCfgId; // id
	private String webCfgFlag; // 网站标志
	private String logoCfgFlag; // logo标志
	private String active; // 激活状态
	private String ext1;// 拓展
	private String ext2;//接口标志字段
	private String ext3;//区县标志字段
	private String cityCode;
	public String getLogoCfgId() {
		return logoCfgId;
	}

	public void setLogoCfgId(String logoCfgId) {
		this.logoCfgId = logoCfgId;
	}

	public String getWebCfgFlag() {
		return webCfgFlag;
	}

	public void setWebCfgFlag(String webCfgFlag) {
		this.webCfgFlag = webCfgFlag;
	}

	public String getLogoCfgFlag() {
		return logoCfgFlag;
	}

	public void setLogoCfgFlag(String logoCfgFlag) {
		this.logoCfgFlag = logoCfgFlag;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getExt1() {
		return ext1;
	}

	public void setExt1(String ext1) {
		this.ext1 = ext1;
	}

	public String getExt2() {
		return ext2;
	}

	public void setExt2(String ext2) {
		this.ext2 = ext2;
	}

	public String getExt3() {
		return ext3;
	}

	public void setExt3(String ext3) {
		this.ext3 = ext3;
	}
	
	

	public String getCityCode() {
		return cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	@Override
	public String toString() {
		return "WebLogoCfg [logoCfgId=" + logoCfgId + ", webCfgFlag=" + webCfgFlag + ", logoCfgFlag=" + logoCfgFlag
				+ ", active=" + active + ", ext1=" + ext1 + ", ext2=" + ext2 + ", ext3=" + ext3 + "]";
	}

}