package com.funo.touristroaming.model;

public class ShitaiRoaming {
	private String provinceName;
	private String passengerCount;
	private String touristsCount;
	private String overnightCount;
	private String touristsRate;
	private String overnightRate;
	private String statmonth;
	private String touristtype;

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public String getPassengerCount() {
		return passengerCount;
	}

	public void setPassengerCount(String passengerCount) {
		this.passengerCount = passengerCount;
	}

	public String getTouristsCount() {
		return touristsCount;
	}

	public void setTouristsCount(String touristsCount) {
		this.touristsCount = touristsCount;
	}

	public String getOvernightCount() {
		return overnightCount;
	}

	public void setOvernightCount(String overnightCount) {
		this.overnightCount = overnightCount;
	}

	public String getTouristsRate() {
		return touristsRate;
	}

	public void setTouristsRate(String touristsRate) {
		this.touristsRate = touristsRate;
	}

	public String getOvernightRate() {
		return overnightRate;
	}

	public void setOvernightRate(String overnightRate) {
		this.overnightRate = overnightRate;
	}

	

	public String getStatmonth() {
		return statmonth;
	}

	public void setStatmonth(String statmonth) {
		this.statmonth = statmonth;
	}

	public String getTouristtype() {
		return touristtype;
	}

	public void setTouristtype(String touristtype) {
		this.touristtype = touristtype;
	}

	@Override
	public String toString() {
		return "ShitaiRoaming [provinceName=" + provinceName + ", passengerCount=" + passengerCount + ", touristsCount="
				+ touristsCount + ", overnightCount=" + overnightCount + ", touristsRate=" + touristsRate
				+ ", overnightRate=" + overnightRate + ", statMonth=" + statmonth + ", touristtype=" + touristtype
				+ "]";
	}
	

}
