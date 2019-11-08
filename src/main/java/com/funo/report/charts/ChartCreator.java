package com.funo.report.charts;

public class ChartCreator {

	private ChartCreator(){};
	
	public static Chart createChart(String chartType){
		
		if(chartType.startsWith("MS")){
			return new MultiChart();
		}else{
			return new SingleChart();
		}
	}
}
