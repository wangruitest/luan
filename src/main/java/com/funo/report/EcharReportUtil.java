package com.funo.report;


import com.funo.report.echarts.EChart;
import com.funo.report.echarts.header.*;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by chenfeiquan on 15/10/18.
 * 对数据进行分装，生成Echarts所需要的json格式数据
 */
public class EcharReportUtil {
    private static final int TIME_COL = 2;

    private static final int TITLE_COL = 0;

    private static final int COUNT_COL = 1;

    public static String[] getSpilitChartJsonStr(List list,Map paramsMap,
                                                                 String[] timeArr,Map staticMap,String chartType){
        String[] dataStrArr = new String[timeArr.length];
        Map dataMap = getSplitData(list,timeArr);
        String titleText = (String)staticMap.get("caption");
        String searchType = (String)paramsMap.get("searchType");
        String searchTypeName = "";
        if(searchType.equals("y")){
            searchTypeName="年";
        }else if(searchType.equals("m")){
            searchTypeName="月";
        }else if(searchType.equals("d")){
            searchTypeName="日";
        }else if(searchType.equals("q")){
            searchTypeName="季度";
        }
        for(int i=0;i<timeArr.length;i++){
            List dataList = (List)dataMap.get(timeArr[i]);
            //对标题进行重新封装
            String newTitleText = timeArr[i]+searchTypeName+titleText;
            staticMap.remove("caption");
            staticMap.put("caption",newTitleText);
            String jsonStr = "";
            if(StringUtils.isNotBlank(chartType)
                    &&StringUtils.contains(chartType.toLowerCase(),"pie")){
                jsonStr = getSinglePieChartJsonStr(dataList,staticMap);
            }else if(StringUtils.isNotBlank(chartType)
                    &&StringUtils.contains(chartType.toLowerCase(),"column")){
                jsonStr = getSingleBarAndLineChartJsonStr(dataList,staticMap,"bar");
            }else{
                jsonStr = getSingleBarAndLineChartJsonStr(dataList,staticMap,"line");
            }
            dataStrArr[i] = jsonStr;
        }
        staticMap.remove("caption");
        staticMap.put("caption",titleText);
        return dataStrArr;
    }

    /**
     * 获取简单的曲线图与柱状图的json格式数据
     * @param list 数据
     * @param staticMap 主要传递标题与副标题值
     * @param chartType 区别曲线图与柱状图
     * @return
     */
    public static String getSingleBarAndLineChartJsonStr(List list,Map staticMap,String chartType){
        //设置标题
        String titleText = (String)staticMap.get("caption");
        String subTitleText = (String)staticMap.get("subTitle");
        String xname = (String)staticMap.get("xname");
        String yname = (String)staticMap.get("yname");
        Title title = new Title();
        title.setText(titleText);
        title.setSubtext(subTitleText);
        title.setX("center");
        title.setPadding(15);

        Tooltip tooltip = new Tooltip();
        tooltip.setTrigger("axis");

        List dataList =(List) list.get(1);
        List colList = (List) list.get(0);

        List xList = new ArrayList();
        List yList = new ArrayList();
        List dateList = new ArrayList();

        for(int i=0;i<dataList.size();i++){
            Map map = (Map)dataList.get(i);
            xList.add(map.get(colList.get(TITLE_COL)));
            yList.add(map.get(colList.get(COUNT_COL)));
        }

        YAxis yAxis = new YAxis();
        yAxis.setType("value");
        yAxis.setName(yname);

        XAxis xAxis = new XAxis();
        xAxis.setType("category");
        xAxis.setData(xList);
        xAxis.setName(xname);

        Series series = new Series();
        series.setType(chartType);
        series.setData(yList);
        series.setName(titleText);
        List seriesList = new ArrayList();
        seriesList.add(series);

        List xAxisList = new ArrayList();
        xAxisList.add(xAxis);

        List yAxisList = new ArrayList();
        yAxisList.add(yAxis);

        EChart eChart = new EChart();
        eChart.setTitle(title);
        eChart.setSeries(seriesList);
        eChart.setTooltip(tooltip);
        eChart.setCalculable(true);
        eChart.setxAxis(xAxisList);
        eChart.setyAxis(yAxisList);

        JSONObject jsonObject = JSONObject.fromObject(eChart);

        return jsonObject.toString();
    }


    /**
     * 生成简单的饼状图所对应的json格式数据
     * @param list
     * @param staticMap
     * @return
     */
    public static String getSinglePieChartJsonStr(List list,Map staticMap){
        //设置标题
        String titleText = (String)staticMap.get("caption");
        String subTitleText = (String)staticMap.get("subTitle");
        Title title = new Title();
        title.setText(titleText);
        title.setSubtext(subTitleText);
        title.setX("center");
        title.setPadding(15);

        Tooltip tooltip = new Tooltip();
        tooltip.setTrigger("item");

        List dataList =(List) list.get(1);
        List colList = (List) list.get(0);

        List xList = new ArrayList();
        List yList = new ArrayList();
        List pieDataList = new ArrayList();

        for(int i=0;i<dataList.size();i++){
            Map map = (Map)dataList.get(i);
            PieData pieData  = new PieData();
            pieData.setName(map.get(colList.get(TITLE_COL)).toString());
            pieData.setValue(map.get(colList.get(COUNT_COL)).toString());
            pieDataList.add(pieData);
            xList.add(map.get(colList.get(TITLE_COL)));
        }

        Series series = new Series();
        series.setType("pie");
        series.setData(yList);
        series.setRadius("55%");
        List centerList= new ArrayList();
        centerList.add("50%");
        centerList.add("50%");
        series.setCenter(centerList);
        series.setData(pieDataList);
        List seriesList = new ArrayList();
        seriesList.add(series);

        Legend legend = new Legend();
        legend.setX("left");
        legend.setOrient("vertical");
        legend.setData(xList);

        EChart eChart = new EChart();
        eChart.setTitle(title);
        eChart.setSeries(seriesList);
        eChart.setTooltip(tooltip);
        eChart.setCalculable(true);

        JSONObject jsonObject = JSONObject.fromObject(eChart);

        return jsonObject.toString();
    }

    /**
     * 获取复杂的柱状图与曲线图json数据
     * @param list
     * @param staticMap
     * @param chartType
     * @return
     */
    public static String getMSBarAndLineChartJson(List list,Map staticMap,String chartType){
        //设置标题
        String titleText = (String)staticMap.get("caption");
        String subTitleText = (String)staticMap.get("subTitle");
        String xname = (String)staticMap.get("xname");
        String yname = (String)staticMap.get("yname");
        Title title = new Title();
        title.setText(titleText);
        title.setSubtext(subTitleText);
        title.setX("center");
        title.setPadding(15);

        Tooltip tooltip = new Tooltip();
        tooltip.setTrigger("axis");

        List dataList =(List) list.get(1);
        List colList = (List) list.get(0);

        List xList = new ArrayList();
        List seriesList = new ArrayList();

        for(int i=0;i<colList.size();i++){
            List data= new ArrayList();
            for(int k=0;k<dataList.size();k++){
                Map map = (Map)dataList.get(k);
                if(i==0){
                    xList.add(map.get(colList.get(i)));
                }else{
                    data.add(map.get(colList.get(i)));
                }
            }
            if(i!=0){
                Series series = new Series();
                series.setType(chartType);
                series.setData(data);
                series.setName(colList.get(i).toString());
                seriesList.add(series);
            }
        }
        List legendList = colList.subList(1,colList.size());
        Legend legend = new Legend();
        legend.setData(legendList);
        legend.setX("center");
        legend.setY("bottom");
        legend.setOrient("horizontal");

        YAxis yAxis = new YAxis();
        yAxis.setType("value");
        yAxis.setName(yname);

        XAxis xAxis = new XAxis();
        xAxis.setType("category");
        xAxis.setData(xList);
        xAxis.setName(xname);

        List xAxisList = new ArrayList();
        xAxisList.add(xAxis);

        List yAxisList = new ArrayList();
        yAxisList.add(yAxis);

        EChart eChart = new EChart();
        eChart.setTitle(title);
        eChart.setSeries(seriesList);
        eChart.setTooltip(tooltip);
        eChart.setCalculable(true);
        eChart.setxAxis(xAxisList);
        eChart.setyAxis(yAxisList);
        eChart.setLegend(legend);

        JSONObject jsonObject = JSONObject.fromObject(eChart);

        return jsonObject.toString();
    }

    public static String[] getSingleChartJson(List list,Map paramsMap,
                                     String[] timeArr,Map staticMap,String chartType) {
        String[] dataResult = null;
        String result = null;
        String noSplit = (String)staticMap.get("noSplit");
        if(StringUtils.isBlank(noSplit)){
            dataResult = getSpilitChartJsonStr(list, paramsMap, timeArr, staticMap, chartType);
        }else{
            dataResult = new String[1];
            if(StringUtils.isNotBlank(chartType)
                    &&StringUtils.contains(chartType.toLowerCase(),"pie")){
                result = getSinglePieChartJsonStr(list,staticMap);
            }else if(StringUtils.isNotBlank(chartType)
                    &&StringUtils.contains(chartType.toLowerCase(),"column")){
                result = getSingleBarAndLineChartJsonStr(list,staticMap,"bar");
            }else{
                result = getSingleBarAndLineChartJsonStr(list,staticMap,"line");
            }
            dataResult[0] = result;
        }
        return dataResult;
    }

    public static String[] getMSChartJson(List list,Map paramsMap,
                                            String[] timeArr,Map staticMap,String chartType){
        String[] result = new String[1];
        if(StringUtils.isNotBlank(chartType)
                &&StringUtils.contains(chartType.toLowerCase(),"column")){
            result[0] = getMSBarAndLineChartJson(list,staticMap, "bar");
        }else{
            result[0] = getMSBarAndLineChartJson(list,staticMap,"line");
        }
        return result;
    }

    /**
     * 对数据进行重新分装
     * @param list
     * @param timeArr
     * @return
     */
    public static Map getSplitData(List list,String[] timeArr){
       Map map =new HashMap();
        List dataList =(List) list.get(1);
        List colList = (List) list.get(0);
        for(int k=0;k<timeArr.length;k++){
            List datasList = new ArrayList();
            datasList.add(colList);
            List timeList = new ArrayList();
            for(int i=0;i<dataList.size();i++){
                Map dataMap = (Map)dataList.get(i);
                if(dataMap.get(colList.get(TIME_COL)).equals(timeArr[k])){
                    timeList.add(dataMap);
                }
            }
            datasList.add(timeList);
            map.put(timeArr[k],datasList);
        }
        return map;
    }

}
