package com.funo.report.charts.header;

public class ChartPieHeader extends ChartHeader {
	
	protected String showPercentageValues="0";
	protected String pieFillAlpha = "70";
	
	public String getShowPercentageValues() {
		return showPercentageValues;
	}

	public void setShowPercentageValues(String showPercentageValues) {
		this.showPercentageValues = showPercentageValues;
	}

	public String getPieFillAlpha() {
		return pieFillAlpha;
	}

	public void setPieFillAlpha(String pieFillAlpha) {
		this.pieFillAlpha = pieFillAlpha;
	}
	
	@Override
	public void createHeaderBody(){
		super.createHeaderBody();
		headerBody = getHeaderBody()
		+ " showPercentageValues = '"+this.getShowPercentageValues()+"' " 
		+ "pieFillAlpha= '"+this.getPieFillAlpha()+"'";
	}
	
}
