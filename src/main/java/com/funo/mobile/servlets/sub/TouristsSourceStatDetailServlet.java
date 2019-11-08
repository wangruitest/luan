package com.funo.mobile.servlets.sub;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

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
 * 2.8	游客来源列表接口<br>
 * 根据登录用户的角色获取其所辖区域内游客来源地详细信息。
 * @author shijiansheng
 *
 */
public class TouristsSourceStatDetailServlet extends BaseServlet {

	@Override
	public Map<String, Object> process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String userId = request.getParameter("userId");
		String orderBy = request.getParameter("orderBy");//排序方式：0-按城市游客排序；1-按景区游客排序；2-按游客转化率排序
		
		String orderByStr = "";
		if(StringUtils.equals(orderBy, "0")){
			orderByStr = "ORDER BY  countToCity desc";
		}else if(StringUtils.equals(orderBy, "1")){
			orderByStr = "ORDER BY  countToScenic desc";
		}else{
			orderByStr = "ORDER BY  convRate desc";
		}
		
		MobileStat mobileStat = new MobileStat();
		//获取昨天的时间
		Timestamp  ts = DateUtils.getBeforeTime(1, "date");
		Calendar c  = Calendar.getInstance();
		c.setTime(ts);
	    String statDate = c.get(Calendar.YEAR)+"-"+(c.get(Calendar.MONTH)+1)+"-"+c.get(Calendar.DATE);
//	    mobileStat.setStatDate("2015-05-10");
	    mobileStat.setStatDate(statDate);
	    mobileStat.setOrderByStr(orderByStr);
	    mobileStat.setUserId(userId);
	    mobileStat.setProvince(MobileConstants.PROVINCE_CONDITION);
	    
	    
	    IMobileStatMgmt mobileStatMgmt = SpringContextUtils.getBean(MobileStatMgmt.class);
	    
	    List<MobileStatResult> list = mobileStatMgmt.queryByTouristStatDetail(mobileStat);
	    List<Map<String,Object>> values = new ArrayList<Map<String,Object>>(); 
	    
	    //统计总值
	    Long allCountToCity = 0L,allCountToScenic = 0L;
	    for(MobileStatResult msr : list){
	    	allCountToCity += msr.getCountToCity();
	    	allCountToScenic += msr.getCountToScenic();
	    }
	    
	    //转换明细数据
	    DecimalFormat df = new DecimalFormat("0.00");
	    for(MobileStatResult msr : list){
	    	Map<String,Object> tMap = new HashMap<String,Object>();
	    	//海外的游客areaCode小于0
	    	tMap.put("areaCode", Integer.parseInt(msr.getAreaCode())==MobileConstants.FOREIGN_AREA_CODE ? 0 : msr.getAreaCode());
	    	tMap.put("areaName",Integer.parseInt(msr.getAreaCode())==MobileConstants.FOREIGN_AREA_CODE ? "海外" :msr.getAreaName());
	    	tMap.put("countToCity", msr.getCountToCity());
	    	tMap.put("countToScenic", msr.getCountToScenic());
	    	tMap.put("convRate",msr.getConvRate()+"%");
	    	
			tMap.put("rateToCtiyAll", ServletUtils.parsePercent(df, msr.getCountToCity(), allCountToCity));
			tMap.put("rateToScenicAll", ServletUtils.parsePercent(df, msr.getCountToScenic(), allCountToScenic));
	    	values.add(tMap);
	    }

	    //返回结果
	    Map<String,Object> result = new HashMap<String,Object>();
	    result.put(MobileConstants.RESULT_CODE, MobileConstants.SUCCESS_CODE);
	    result.put("date",DateUtils.formatterDate(new Date(), "yyyy-MM-dd"));
	    result.put("allCountToCity", allCountToCity);
	    result.put("allCountToScenic", allCountToScenic );
	    result.put("value", values);
	    
		return result;
	}

}
