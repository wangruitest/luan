package com.funo.report.charts.header;

import org.apache.commons.lang.StringUtils;

public class ChartHeader {

	private String caption;
	
	private String subcaption;

	private String bgColor;
	
	private String decimalPrecision="0";
	
	private String showNames ="1";
	
	private String baseFont = "宋体";
	
	private String baseFontSize = "12";
	
	private String formatNumberScale="1";
	
	private String numberScaleValue="10000,10000";
	
	private String numberScaleUnit="万,亿";

	private final String header = "<graph ";
	
	private final String footer = " >";
	
	protected String headerBody;
	
	public String getNumberScaleUnit() {
		return numberScaleUnit;
	}

	public void setNumberScaleUnit(String numberScaleUnit) {
		this.numberScaleUnit = numberScaleUnit;
	}

	public String getNumberScaleValue() {
		return numberScaleValue;
	}

	public void setNumberScaleValue(String numberScaleValue) {
		this.numberScaleValue = numberScaleValue;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getSubcaption() {
		return subcaption;
	}

	public void setSubcaption(String subcaption) {
		this.subcaption = subcaption;
	}

	public String getBgColor() {
		return bgColor;
	}

	public void setBgColor(String bgColor) {
		this.bgColor = bgColor;
	}

	public String getHeaderBody(){
		return this.headerBody;
	}
	
	public String getHeader() {
		return header;
	}

	public String getFooter() {
		return footer;
	}

	public void setHeaderBody(String headerBody) {
		this.headerBody = headerBody;
	}
	

	public String getDecimalPrecision() {
		return decimalPrecision;
	}

	public void setDecimalPrecision(String decimalPrecision) {
		this.decimalPrecision = decimalPrecision;
	}

	public String getShowNames() {
		return showNames;
	}

	public void setShowNames(String showNames) {
		this.showNames = showNames;
	}

	public String getBaseFont() {
		return baseFont;
	}

	public void setBaseFont(String baseFont) {
		this.baseFont = baseFont;
	}

	public String getBaseFontSize() {
		return baseFontSize;
	}

	public void setBaseFontSize(String baseFontSize) {
		this.baseFontSize = baseFontSize;
	}

	public String getFormatNumberScale() {
		return formatNumberScale;
	}

	public void setFormatNumberScale(String formatNumberScale) {
		this.formatNumberScale = formatNumberScale;
	}

	public String getChartHeader(){
		return getHeader() + getHeaderBody()+getFooter();
	}
	

	public void createHeaderBody(){
		StringBuffer tBuff = new StringBuffer();
		tBuff.append(" caption= ' "+this.getCaption() +"' ");

		if(StringUtils.isNotBlank(bgColor)){
			tBuff.append("bgColor= '"+this.getBgColor()+"' ");
		}
		
		if(StringUtils.isNotBlank(subcaption)){
			tBuff.append("subcaption= '"+this.getSubcaption()+"' ");
		}
		
		if(StringUtils.isNotBlank(decimalPrecision)){
			tBuff.append("decimalPrecision= '"+this.getDecimalPrecision()+"' ");
		}
		
		if(StringUtils.isNotBlank(numberScaleUnit)){
			tBuff.append("numberScaleUnit= '"+this.getNumberScaleUnit()+"' ");
		}
		
		if(StringUtils.isNotBlank(numberScaleValue)){
			tBuff.append("numberScaleValue= '"+this.getNumberScaleValue()+"' ");
		}
		
		if(StringUtils.isNotBlank(showNames)){
			tBuff.append("showNames= '"+this.getShowNames()+"' ");
		}
		
		if(StringUtils.isNotBlank(baseFont)){
			tBuff.append("baseFont= '"+this.getBaseFont()+"' ");
		}
		
		if(StringUtils.isNotBlank(baseFontSize)){
			tBuff.append("baseFontSize= '"+this.getBaseFontSize()+"' ");
		}
		if(StringUtils.isNotBlank(formatNumberScale)){
			tBuff.append("formatNumberScale= '"+this.getFormatNumberScale()+"' ");
		}
		headerBody =tBuff.toString();
	}
}
