package com.funo.report.charts;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

public class SingleChart extends Chart {

	private static final int TIME_COL = 2;
	
	private static final int TITLE_COL = 0;
	
	private static final int COUNT_COL = 1;
	
	private static final String LINK_COL = "LINK";
	/**
	 * 
	 * 	通过对数据集的观察，二维图标（包括饼图）的数据集
	 *  包括X轴和Y轴，需要加入查询要素：时间为过渡筛选条件，
	 *  <font color="red">在针对于存储过程需要提供<CODE>TITLE</CODE>
	 *  ,<CODE>TOURISTCOUNT</CODE>,<CODE>TIME</CODE> 等结果集字段
	 *  </font>
	 * <p>
	 * @param dbDataList:查询得最终结果列表
	 * @return
	 */
	@Override
	public  void createBody(List dbDataList,String time){
		List dataList =(List) dbDataList.get(1);
		List colList = (List) dbDataList.get(0);
		StringBuffer tbuff = new StringBuffer();
		for(int j=0;j<dataList.size();j++){
			Map map = (Map)dataList.get(j);
			if(StringUtils.isBlank(time)||
					(StringUtils.isNotBlank(time) && time.equals(map.get(colList.get(TIME_COL))))){//TIME列 
				tbuff.append("<set ");
				String title = (String)map.get(colList.get(TITLE_COL));//TITLE列
				String count = String.valueOf(map.get(colList.get(COUNT_COL)));//COUNT列
				DataSetStr data  =new DataSetStr(title,count);
				data.setHoverText(title+","+count);//设置鼠标上移提示的内容
				if(StringUtils.equals(LINK_COL,String.valueOf(colList.get(colList.size()-1)))){
					data.setLink(String.valueOf(map.get(colList.get(colList.size()-1))));
				}
				tbuff.append(data.getDataSetStr());
				tbuff.append("/>");
			}
		
		}
		this.body = tbuff.toString();
	}
	
}

