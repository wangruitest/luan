// ~ CopyRight © 2016 AHZY  SOFTWARE CO.LTD All Rights Reserved.
package com.funo.regionCoords.model;

/**
 * 描述：Weather
 * <br />@version:1.0.0
 * <br />@author 吴宝龙
 * <br />@email： wubaolongzy@ahmobile.com
 * <br />@date： 2016年2月1日 上午9:35:43
 * <br />CopyRight © 2016 AHZY All Rights Reserved.
 */
public class Weather {
	private String weatherDate;
	private String currentText;
	private String currentCode;
	private String currentTemperature;
	private String windDirection;
	private String windSpeed;
	private String windScale;
	private String pm25;

	public String getWeatherDate() {
		return weatherDate;
	}

	public void setWeatherDate(String weatherDate) {
		this.weatherDate = weatherDate;
	}

	public String getCurrentText() {
		return currentText;
	}

	public void setCurrentText(String currentText) {
		this.currentText = currentText;
	}

	public String getCurrentCode() {
		return currentCode;
	}

	public void setCurrentCode(String currentCode) {
		this.currentCode = currentCode;
	}

	public String getCurrentTemperature() {
		return currentTemperature;
	}

	public void setCurrentTemperature(String currentTemperature) {
		this.currentTemperature = currentTemperature;
	}

	public String getWindDirection() {
		return windDirection;
	}

	public void setWindDirection(String windDirection) {
		this.windDirection = windDirection;
	}

	public String getWindSpeed() {
		return windSpeed;
	}

	public void setWindSpeed(String windSpeed) {
		this.windSpeed = windSpeed;
	}

	public String getWindScale() {
		return windScale;
	}

	public void setWindScale(String windScale) {
		this.windScale = windScale;
	}

	public String getPm25() {
		return pm25;
	}

	public void setPm25(String pm25) {
		this.pm25 = pm25;
	}

	@Override
	public String toString() {
		return "Weather [weatherDate=" + weatherDate + ", currentText="
				+ currentText + ", currentCode=" + currentCode
				+ ", currentTemperature=" + currentTemperature
				+ ", windDirection=" + windDirection + ", windSpeed="
				+ windSpeed + ", windScale=" + windScale + ", pm25=" + pm25
				+ "]";
	}
}
