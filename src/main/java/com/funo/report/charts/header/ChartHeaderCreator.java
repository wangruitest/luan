package com.funo.report.charts.header;

import com.funo.report.charts.ReportConstants;

public class ChartHeaderCreator {

	/**
	 * <p>
	 * 	<b>功能：</b>创建具体图像的表头类型的工厂方法
	 * </p>
	 * @param type：传入图像的类型
	 * @return
	 */
	public static ChartHeader createHeader(String type){
		if(type.equals(ReportConstants.PIE3D_CHART) ||
				type.equals( ReportConstants.PIE2D_CHART)){
			return new  ChartPieHeader();
		}else if(type.equals(ReportConstants.COLUMN3D_CHART )
				||type.equals(ReportConstants.COLUMN2D_CHART)){
			return new ChartColumnHeader();
		}else if(type.equals(ReportConstants.LINE2D_CHART ))
		{
			return new ChartLineHeader();
		}else{
			return new ChartHeader();
		}
	}
	
}
