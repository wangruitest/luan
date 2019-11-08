package com.funo.jqykjd.model;

public class YdtjBt {

	private Long ykzs;
	private String provinceName;
	private String cityId;
	private String provinceId;//
	
	
	public String getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}
	public Long getYkzs() {
		return ykzs;
	}
	public void setYkzs(Long ykzs) {
		this.ykzs = ykzs;
	}
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public String getCityId() {
		return cityId;
	}
	public void setCityId(String cityId) {
		this.cityId = cityId;
	}
}
