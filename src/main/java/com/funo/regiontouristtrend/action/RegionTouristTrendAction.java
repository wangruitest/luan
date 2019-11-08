package com.funo.regiontouristtrend.action;

import java.text.SimpleDateFormat;
import java.util.*;

import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.regionrealtimesumadd.model.RegionRealtimeSumAdd;
import com.funo.regiontouristtrend.mgmt.IRegionTouristTrendMgmt;
import com.funo.regiontouristtrend.model.RegionTouristTrend;
import com.funo.report.EcharReportUtil;
import com.funo.report.ExportExcelReport;
import com.funo.system.model.SysOperator;
import org.apache.commons.lang.StringUtils;

public class RegionTouristTrendAction extends CommonAction{
	private IRegionTouristTrendMgmt regionTouristTrendMgmt;

	public IRegionTouristTrendMgmt getRegionTouristTrendMgmt() {
		return regionTouristTrendMgmt;
	}
	public void setRegionTouristTrendMgmt(IRegionTouristTrendMgmt regionTouristTrendMgmt) {
		this.regionTouristTrendMgmt = regionTouristTrendMgmt;
	}
	

	/**
	 * 获取所有
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllRegionTouristTrend(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = regionTouristTrendMgmt.queryRegionTouristTrend(new RegionTouristTrend());
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 根据条件获取列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getRegionTouristTrendList(RegionTouristTrend regionTouristTrend){
		ActionResult ar=new ActionResult();
		List result=null;
		try {

			//result = regionTouristTrendMgmt.queryRegionTouristTrend(regionTouristTrend);
			//String json = getEchartJsonStr(result,regionTouristTrend);
			//ar.setReturnObject(json);
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}

	/**
	 * 对查找的结果集进行重新解析
	 * @return
	 */
	public String[] getEchartJsonStr(){
		List dataTotalList = new ArrayList();
		List colList = new ArrayList();
		List dataList = new ArrayList();
		colList.add("date");
		colList.add("count");
		for(int i=0;i<=7;i++){
			Calendar calendar = Calendar.getInstance(); //得到日历
			calendar.setTime(new Date());//把当前时间赋给日历
			calendar.add(Calendar.DAY_OF_MONTH, i);  //设置为前几天
			Date dBefore = calendar.getTime();   //得到前几天的时间
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); //设置时间格式
			String defaultStartDate = sdf.format(dBefore);    //格式化前几天
			Map map = new HashMap();
			map.put("date", defaultStartDate);
			map.put("count", 0);
			dataList.add(map);
		}

		dataTotalList.add(colList);
		dataTotalList.add(dataList);
		Map staticMap = new HashMap();
		String title = "黄山景区游客趋势分析";
		staticMap.put("caption",title);
		staticMap.put("subTitle", "根据历史数据和景区旅游综合因素，预测景区未来半年的游客数量。");
		String[] jsonArr = new String[2];
		jsonArr[0] = EcharReportUtil.getSingleBarAndLineChartJsonStr(dataTotalList, staticMap, "bar");
		jsonArr[1] = EcharReportUtil.getSingleBarAndLineChartJsonStr(dataTotalList, staticMap, "line");
		return jsonArr;
	}

	/**
	 * 导出excel
	 * **/
	public ActionResult expExcel(RegionTouristTrend regionTouristTrend){
		ActionResult ar=new ActionResult();

		String[] header = {"接待游客人次","接待时间"};
		String title = "黄山景区游客趋势分析";
		String[][] result = new String[8][header.length];
		for(int i=0;i<=7;i++){
			Calendar calendar = Calendar.getInstance(); //得到日历
			calendar.setTime(new Date());//把当前时间赋给日历
			calendar.add(Calendar.DAY_OF_MONTH, i);  //设置为前几天
			Date dBefore = calendar.getTime();   //得到前几天的时间
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); //设置时间格式
			String defaultStartDate = sdf.format(dBefore);    //格式化前几天
			result[i][0]="0";
			result[i][1]=defaultStartDate;
		}

		ExportExcelReport exportExcelReport = new ExportExcelReport();
		try {
			String[] reStr = exportExcelReport.exportReport(result, header,title);
			ar.setResultCode(0);
			if(null!=reStr){
				ar.setReturnObject(reStr);
			}
		} catch (Exception e){
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}

		return ar;
	}
	
	/**
	 * 创建
	 */
	public ActionResult createRegionTouristTrend(RegionTouristTrend regionTouristTrend){
		ActionResult ar=new ActionResult();
		try {
//			regionTouristTrend.setUnid(regionTouristTrendMgmt.getKey());
			regionTouristTrend=regionTouristTrendMgmt.createRegionTouristTrend(regionTouristTrend);
			ar.setReturnObject(regionTouristTrend);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改
	 */
	public ActionResult updateRegionTouristTrend(RegionTouristTrend regionTouristTrend){
		ActionResult ar=new ActionResult();
		try {
			regionTouristTrend=regionTouristTrendMgmt.modifyRegionTouristTrend(regionTouristTrend);
			ar.setReturnObject(regionTouristTrend);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除
	 */
	public ActionResult deleteRegionTouristTrend(RegionTouristTrend regionTouristTrend){
		ActionResult ar=new ActionResult();
		try {
			regionTouristTrendMgmt.deleteRegionTouristTrend(regionTouristTrend);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除
	 */
	public ActionResult batchDeleteRegionTouristTrend(List<RegionTouristTrend> regionTouristTrendList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<regionTouristTrendList.size();i++){
				this.deleteRegionTouristTrend(regionTouristTrendList.get(i));
			}
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 通过Session获取用户信息
	 */
	public SysOperator getSessionUser(){
		SysOperator user=super.getSessionUser();
		if(user==null){
			user=new SysOperator();
			user.setUnid("0");
			user.setName("超级管理员");
		}
		return user;
	}
	
	/**
	 * 组合黄山数据
	 * 
	 * */
	public List<RegionTouristTrend> get574List(){
		List<RegionTouristTrend> lists= new ArrayList<RegionTouristTrend>();
		String[] str = {"2830600","2648788","2399192","1998867","2279134","2064455",
						"2237965","2024222","1521264","1530085","1473012","1553018",
						"1596920","1666921","1722732","1815443","1897218","1976439"};
		String[] strdate = {"2014-06","2014-07","2014-08","2014-09","2014-10","2014-11",
							"2014-12","2015-01","2015-02","2015-03","2015-04","2015-05",
							"2015-06","2015-07","2015-08","2015-09","2015-10","2015-11"};
		for(int i=0;i<str.length;i++){
			RegionTouristTrend rtt = new RegionTouristTrend();
			rtt.setRegionname("黄山");
			rtt.setSearchdate(strdate[i]);
			rtt.setStourists(str[i]);
			lists.add(rtt);
		}
		return lists;
	}
	
	/**
	 * 组合鸠兹风景区数据
	 * 
	 * */
	public List<RegionTouristTrend> get351List(){
		List<RegionTouristTrend> lists= new ArrayList<RegionTouristTrend>();
		String[] str = {"2353648","2393648","2384254","1373930","1801231","1307111",
						"1004620","678682","846611","740885","878491","795741",
						"796141","796741","797141","797541","798141","798641"};
		String[] strdate = {"2014-06","2014-07","2014-08","2014-09","2014-10","2014-11",
							"2014-12","2015-01","2015-02","2015-03","2015-04","2015-05",
							"2015-06","2015-07","2015-08","2015-09","2015-10","2015-11"};
		for(int i=0;i<str.length;i++){
			RegionTouristTrend rtt = new RegionTouristTrend();
			rtt.setRegionname("鸠兹风景区");
			rtt.setSearchdate(strdate[i]);
			rtt.setStourists(str[i]);
			lists.add(rtt);
		}
		return lists;
	}
	
	/**
	 * 组合天柱山风景区数据
	 * 
	 * */
	public List<RegionTouristTrend> get511List(){
		List<RegionTouristTrend> lists= new ArrayList<RegionTouristTrend>();
		String[] str = {"312035","321035","325035","317535","309035","389277",
						"362094","360511","187864","86380","86730","97827",
						"98627","99227","99727","101827","103827","105827"};
		String[] strdate = {"2014-06","2014-07","2014-08","2014-09","2014-10","2014-11",
							"2014-12","2015-01","2015-02","2015-03","2015-04","2015-05",
							"2015-06","2015-07","2015-08","2015-09","2015-10","2015-11"};
		for(int i=0;i<str.length;i++){
			RegionTouristTrend rtt = new RegionTouristTrend();
			rtt.setRegionname("天柱山风景区");
			rtt.setSearchdate(strdate[i]);
			rtt.setStourists(str[i]);
			lists.add(rtt);
		}
		return lists;
	}
	
	/**
	 * 组合天井湖景区数据
	 * 
	 * */
	public List<RegionTouristTrend> get2List(){
		List<RegionTouristTrend> lists= new ArrayList<RegionTouristTrend>();
		String[] str = {"78657","79257","76464","55202","94731","52860",
						"50478","63361","102357","50750","55515","42788",
						"43188","43688","44288","44888","45188","45688"};
		String[] strdate = {"2014-06","2014-07","2014-08","2014-09","2014-10","2014-11",
							"2014-12","2015-01","2015-02","2015-03","2015-04","2015-05",
							"2015-06","2015-07","2015-08","2015-09","2015-10","2015-11"};
		for(int i=0;i<str.length;i++){
			RegionTouristTrend rtt = new RegionTouristTrend();
			rtt.setRegionname("天井湖景区");
			rtt.setSearchdate(strdate[i]);
			rtt.setStourists(str[i]);
			lists.add(rtt);
		}
		return lists;
	}
	
	/**
	 * 组合赭山景区数据
	 * 
	 * */
	public List<RegionTouristTrend> get358List(){
		List<RegionTouristTrend> lists= new ArrayList<RegionTouristTrend>();
		String[] str = {"6921820","6935820","7338308","4799031","5111295","3525318",
				"2805777","2854955","3225160","3007955","2892050","2675528",
				"2681528","2687528","2691528","2696528","2699528","2687528"};
		String[] strdate = {"2014-06","2014-07","2014-08","2014-09","2014-10","2014-11",
							"2014-12","2015-01","2015-02","2015-03","2015-04","2015-05",
							"2015-06","2015-07","2015-08","2015-09","2015-10","2015-11"};
		for(int i=0;i<str.length;i++){
			RegionTouristTrend rtt = new RegionTouristTrend();
			rtt.setRegionname("赭山景区");
			rtt.setSearchdate(strdate[i]);
			rtt.setStourists(str[i]);
			lists.add(rtt);
		}
		return lists;
	}
	
	/**
	 * 组合红军广场景区数据
	 * 
	 * */
	public List<RegionTouristTrend> get551List(){
		List<RegionTouristTrend> lists= new ArrayList<RegionTouristTrend>();
		String[] str = {"1653362","1645362","1659362","1652362","1642362","1242362",
						"944287","868241","1123461","855352","1071577","833205",
						"833205","833205","833205","833205","833205","833205"};
		String[] strdate = {"2014-06","2014-07","2014-08","2014-09","2014-10","2014-11",
							"2014-12","2015-01","2015-02","2015-03","2015-04","2015-05",
							"2015-06","2015-07","2015-08","2015-09","2015-10","2015-11"};
		for(int i=0;i<str.length;i++){
			RegionTouristTrend rtt = new RegionTouristTrend();
			rtt.setRegionname("红军广场景区");
			rtt.setSearchdate(strdate[i]);
			rtt.setStourists(str[i]);
			lists.add(rtt);
		}
		return lists;
	}
	
	/**
	 * 组合相山风景区数据
	 * 
	 * */
	public List<RegionTouristTrend> get5512List(){
		List<RegionTouristTrend> lists= new ArrayList<RegionTouristTrend>();
		String[] str = {"652281","658281","662281","667281","674281","689281",
						"648281","648281","648281","280941","720951","829762",
						"834762","839762","841762","845762","849762","853762"};
		String[] strdate = {"2014-06","2014-07","2014-08","2014-09","2014-10","2014-11",
							"2014-12","2015-01","2015-02","2015-03","2015-04","2015-05",
							"2015-06","2015-07","2015-08","2015-09","2015-10","2015-11"};
		for(int i=0;i<str.length;i++){
			RegionTouristTrend rtt = new RegionTouristTrend();
			rtt.setRegionname("相山风景区");
			rtt.setSearchdate(strdate[i]);
			rtt.setStourists(str[i]);
			lists.add(rtt);
		}
		return lists;
	}
	
	/**
	 * 组合九子岩风景区数据
	 * 
	 * */
	public List<RegionTouristTrend> get495List(){
		List<RegionTouristTrend> lists= new ArrayList<RegionTouristTrend>();
		String[] str = {"984478","987478","1083820","963922","876490","334648",
						"280352","321680","415632","215791","250397","291548",
						"292148","292748","293348","293948","294548","295148"};
		String[] strdate = {"2014-06","2014-07","2014-08","2014-09","2014-10","2014-11",
							"2014-12","2015-01","2015-02","2015-03","2015-04","2015-05",
							"2015-06","2015-07","2015-08","2015-09","2015-10","2015-11"};
		for(int i=0;i<str.length;i++){
			RegionTouristTrend rtt = new RegionTouristTrend();
			rtt.setRegionname("九子岩风景区");
			rtt.setSearchdate(strdate[i]);
			rtt.setStourists(str[i]);
			lists.add(rtt);
		}
		return lists;
	}
	
	/**
	 * 组合龙子湖数据
	 * 
	 * */
	public List<RegionTouristTrend> get527List(){
		List<RegionTouristTrend> lists= new ArrayList<RegionTouristTrend>();
		String[] str = {"231227","229227","228227","178805","277952","110965",
						"99170","84400","96597","50462","78461","72861",
						"73161","73561","73961","74161","74561","75161"};
		String[] strdate = {"2014-06","2014-07","2014-08","2014-09","2014-10","2014-11",
							"2014-12","2015-01","2015-02","2015-03","2015-04","2015-05",
							"2015-06","2015-07","2015-08","2015-09","2015-10","2015-11"};
		for(int i=0;i<str.length;i++){
			RegionTouristTrend rtt = new RegionTouristTrend();
			rtt.setRegionname("龙子湖");
			rtt.setSearchdate(strdate[i]);
			rtt.setStourists(str[i]);
			lists.add(rtt);
		}
		return lists;
	}
	
	/**
	 * 组合九华山数据数据
	 * 
	 * */	
	public List<RegionTouristTrend> get552List(){
		List<RegionTouristTrend> lists= new ArrayList<RegionTouristTrend>();
		String[] str = {"596163","615444","657166","617777","658222","677161",
				"696761","706361","715861","844478","722932","609054",
				"619054","635054","641054","645054","649054","651054"};
		String[] strdate = {"2014-06","2014-07","2014-08","2014-09","2014-10","2014-11",
				"2014-12","2015-01","2015-02","2015-03","2015-04","2015-05",
				"2015-06","2015-07","2015-08","2015-09","2015-10","2015-11"};
		for(int i=0;i<str.length;i++){
			RegionTouristTrend rtt = new RegionTouristTrend();
			rtt.setRegionname("九华山");
			rtt.setSearchdate(strdate[i]);
			rtt.setStourists(str[i]);
			lists.add(rtt);
		}
		return lists;
	}
}