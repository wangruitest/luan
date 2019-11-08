package com.funo.report.charts.header;

public class ChartLineHeader extends ChartHeader {

	
	private String xAxisName;
	
	private String yAxisName;
	
	public String getxAxisName() {
		return xAxisName;
	}

	public void setxAxisName(String xAxisName) {
		this.xAxisName = xAxisName;
	}

	public String getyAxisName() {
		return yAxisName;
	}

	public void setyAxisName(String yAxisName) {
		this.yAxisName = yAxisName;
	}
	
	
	@Override
	public void createHeaderBody(){
		super.createHeaderBody();
		headerBody = getHeaderBody()+
		" xAxisName='"+this.getxAxisName()+
		"' yAxisName='"+this.getyAxisName() +"' ";
	}
}
