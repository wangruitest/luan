package com.funo.report.charts;

import java.util.List;
import java.util.Map;

import com.funo.report.charts.header.ChartHeader;
/**
 * <p><b>描述:</b>针对图像报表的抽象：包括表头，表尾，表体三部<br/>
 * 	<font color="red">注意：为保存chart类的单一性，对于header，需要通过入侵式方式传入该类
 * 如：<code>chart.createHeader(header)</code>，传入后方可通过
 * <code>getChartXML()</code> 获取最终结果
 * </font>
 * </p>
 * 
 * @author shijiansheng
 * @date 2011-10-01
 */
public abstract  class Chart {
	
	private ChartHeader header;
	
	protected String body;
	
	//图像格式的结束标志
	private final String footer ="</graph>";
	
	/**
	 * <p>
	 * 	 <b>功能：</b> 获取图像的头部
	 * </p>
	 * @return
	 */
	public ChartHeader getHeader(){
		return header;
	}
	
	public abstract void createBody(List dataList,String time);
	
	public String getFooter(){
		return footer;
	}
	
	public void createHeader(ChartHeader header) {
		this.header = header;
	}

	/**
	 * <p><b>功能：</b>形成图像的最终的显示的XML数据
	 * <i>注意：针对getChartHeader可能因不同的继承结果抓取不同结果</i>
	 * </p>
	 * @return
	 */
	public  String getChartXML(){
		String chartXML = header.getChartHeader() + body + footer;
		return chartXML;
	}

}
