package com.funo.report.charts;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.collections.map.MultiValueMap;


public class MultiChart extends Chart {

	/**
	 * <p><b>功能：</b> 生成图表的body部分 <br/>
	 * 	<i>注意：整合之前需要进行数据集的筛选</i>
	 * </p>
	 */
	@Override
	public void createBody(List list, String time) {
		List tList = this.getMuliData((List)list.get(0),(List)list.get(1));
		//生成body部分
		this.body = this.createCatagory((List)tList.get(0))
			+this.createDateset((Map)tList.get(1));
	}

	/**
	 * <p><b>功能：</b>通过MultiValueMap 生成数据集</p>
	 * @param colList：列名集合
	 * @param dataList：数据集合
	 * @return：返回数据集为时间集 和 展示的数据集
	 */
	private static List getMuliData(List colList,List dataList){
	  Map<String,Object> tMap = MultiValueMap.decorate(new LinkedHashMap()); 
	  List time_List = new ArrayList();
	  for(int j=0;j<dataList.size();j++){
	    Map map =(Map) dataList.get(j); //数据记录
		for(int i=0;i<colList.size();i++){
			String colName = (String)colList.get(i);
			if(i==0)  time_List.add(map.get(colName)); //第一列为时间列，加入时间集合中
			else tMap.put(colName, map.get(colName)); //其他为数据加入数据集
		}
	  }
	  List rList = new ArrayList();
	  rList.add(time_List);
	  rList.add(tMap);
	  return rList;
	}
	
	/**
	 * <p>功能:生成聚集图的合集</p>
	 * @param colList
	 * @return
	 */
	private String createCatagory(List colList){
		StringBuffer tbuff = new StringBuffer();
		tbuff.append("<categories >");
		for(int i=0;i<colList.size();i++){
			tbuff.append("   <category name= '"+colList.get(i)+"'/>");
		}
		tbuff.append("</categories>");
		return tbuff.toString();
	}
	
	/**
	 * <p>功能：生成数据集合</p>
	 * @param dataMap
	 * @return
	 */
	private String  createDateset(Map dataMap){
		Map<String,Object>  tMap = new LinkedHashMap<String, Object>();
		tMap.putAll(dataMap);
		StringBuffer tbuff = new StringBuffer();
		Iterator iter = tMap.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next().toString();
			tbuff.append("<dataset seriesName='"+key+"'>");
			Collection values = (Collection)tMap.get(key);
			Iterator valuesIterator = values.iterator( );
			 while( valuesIterator.hasNext() ) {
				 String value = valuesIterator.next().toString();
				 tbuff.append(" <set value ='"+value+"' hoverText='"+key+","+value+"'/>");
			 }
			tbuff.append("</dataset>");
		}
		return tbuff.toString();
	}
}
