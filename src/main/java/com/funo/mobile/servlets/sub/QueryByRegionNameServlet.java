package com.funo.mobile.servlets.sub;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.funo.mobile.MobileConstants;
import com.funo.mobile.mgmt.IMobileStatMgmt;
import com.funo.mobile.mgmt.impl.MobileStatMgmt;
import com.funo.mobile.model.MobileStat;
import com.funo.mobile.model.MobileStatResult;
import com.funo.mobile.servlets.BaseServlet;
import com.funo.mobile.utils.DateUtils;
import com.funo.utils.SpringContextUtils;

/**
 * 6.1	景区地图打点(不传key参数)<br>
 * 6.2	景点搜索 (需要传key参数)
 * @author shijiansheng
 *
 */
public class QueryByRegionNameServlet extends BaseServlet {

	@Override
	public Map<String, Object> process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String userId = request.getParameter("userId");
		String key = request.getParameter("key");//景区名称
		
		String statDate = DateUtils.formatterDate(new Date(), "yyyy-MM-dd HH");
		String showTime = DateUtils.formatterDate(new Date(), "yyyy-MM-dd HH:mm:ss");
//		String statDate =  "2015-04-15 21";//DateUtils.formatterDate(new Date(), "yyyy-MM-dd HH");
		
		MobileStat ms = new MobileStat();
		ms.setRegionName(key);
		ms.setStatDate(statDate);
		ms.setUserId(userId);

		//查询结果
		IMobileStatMgmt mobileStatMgmt = SpringContextUtils.getBean(MobileStatMgmt.class);
		List<MobileStatResult> list = mobileStatMgmt.queryByRegionName(ms);
		
		//组装统计结果
		Map<String,Object> result =  new HashMap<String,Object>();
		List<Map<String,Object>> data  = new ArrayList<Map<String,Object>>();
		for(MobileStatResult rrs : list){
			Map<String,Object> map = new HashMap<String,Object>();
			Long inNum = rrs.getInStayTourists();
			Long outNum = rrs.getOutStayTourists();
//			Long jamValue = rrs.getJamValue();
			
			Long allNum = inNum + outNum;
			
			
			if(rrs.getLevel1Num()!=0 && allNum>= rrs.getLevel1Num()){
				map.put("warn","红色告警"); 
			}else if(rrs.getLevel2Num()!=0 && allNum >= rrs.getLevel2Num()){
				map.put("warn","橙色告警"); 
			}else if(rrs.getLevel3Num()!=0 && allNum >= rrs.getLevel3Num()){
				map.put("warn","黄色告警"); 
			}else if(rrs.getLevel4Num()!=0 && allNum >= rrs.getLevel4Num()){
				map.put("warn","蓝色告警");
			}else{
				map.put("warn", "正常");
			}
//			
//			if((inNum + outNum)> jamValue){
//				map.put("warn","告警"); 
//			}else{
//				map.put("warn", "正常");
//			}
			map.put("inNum", inNum);
			map.put("outNum",outNum);
			map.put("allNum",(inNum + outNum));
			map.put("scenicCode", rrs.getRegionId());
			map.put("scenicName",rrs.getRegionName());
			map.put("longitude", rrs.getAhLng()==null ? "":rrs.getAhLng());
			map.put("latitude", rrs.getAhLat()==null ? "":rrs.getAhLat());
			map.put("time", showTime);
			data.add(map);
		}
		result.put("pois", data);
		result.put(MobileConstants.RESULT_CODE, MobileConstants.SUCCESS_CODE);
		return result;
	}

}
