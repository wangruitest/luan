package com.funo.mobile.servlets.sub;

import java.text.DecimalFormat;
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
import com.funo.mobile.utils.ServletUtils;
import com.funo.utils.SpringContextUtils;

/**
 * 2.6	景区实时列表接口
 * @author shijiansheng
 *
 */
public class RegionRealtimeSumListServlet extends BaseServlet {

	@Override
	public Map<String, Object> process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String userId = request.getParameter("userId");
		String thisDate =DateUtils.formatterDate(new Date(), "yyyy-MM-dd HH");
		
//		String thisDate = "2015-04-15 21"; 
		
		IMobileStatMgmt mobileStatMgmt = SpringContextUtils.getBean(MobileStatMgmt.class);
		MobileStat ms = new MobileStat(); //参数
		ms.setUserId(userId);
		ms.setStatDate(thisDate);
		
		List<MobileStatResult> list = mobileStatMgmt.queryByStatRealTime(ms);
		
		//组装最后的结果
		Map<String,Object> result = new HashMap<String,Object>();
		result.put(MobileConstants.RESULT_CODE, MobileConstants.SUCCESS_CODE);
		result.put("date", DateUtils.formatterDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
		
		List<Map<String,Object>> value = new ArrayList<Map<String,Object>>();
		
		//合计总值
		Long sum = 0L;
		for(MobileStatResult rsr : list){
			sum += Long.parseLong(rsr.getTouristsum());
		}
		result.put("countAll", sum);
		
		//明细值
		DecimalFormat df = new DecimalFormat("0.00");
		for(MobileStatResult rsr : list){
			Map<String,Object> innerMap = new HashMap<String,Object>();
			innerMap.put("scenicCode", rsr.getRegionId());
			innerMap.put("scenicName", rsr.getRegionName());
			Long count = Long.parseLong(rsr.getTouristsum());
			innerMap.put("count", count);
			
			//百分数
			innerMap.put("rateToAll", 	ServletUtils.parsePercent(df, count, sum));
			value.add(innerMap);
		}
		result.put("value", value);
		return result;
	}
	
	

}
