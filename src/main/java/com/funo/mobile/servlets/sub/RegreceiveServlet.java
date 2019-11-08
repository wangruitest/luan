package com.funo.mobile.servlets.sub;

import java.util.ArrayList;
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
 * 3.10	所有景区接待统计接口
 * 3.11	景区接待游客统计接口
 * @author shijiansheng
 *
 */
public class RegreceiveServlet extends BaseServlet {

	@Override
	public Map<String, Object> process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String userId = request.getParameter("userId");
		String date  = request.getParameter("date");//查询日期（0：近一个月；1：近三个月；2：近半年；3：近一年）
		String visitType = request.getParameter("visitType");//游客类型（0：全部游客；1：省内游客；2：省外游客）
		
		String cityId =  ServletUtils.parseCityId(request.getParameter("cityId"));
		String scenicCode = ServletUtils.parseScenicCode(request.getParameter("scenicCode"));
		
		List<MobileStatResult> list = new ArrayList<MobileStatResult>();
		
		IMobileStatMgmt mobileStatMgmt = SpringContextUtils.getBean(MobileStatMgmt.class);
		
		
		//查询参数的组合
		MobileStat ms = new MobileStat();
		ms.setUserId(userId);
		ms.setRegionId(scenicCode);
		ms.setProvince(MobileConstants.PROVINCE_CONDITION);
		ms.setTouristType(visitType);
	    ms.setCityCode(cityId);
	
		if(StringUtils.equals(date, "0")){ //格式按天查询
			ms.setStartTime( ServletUtils.parseBeginTime(date)+"-01");
//			ms.setEndTime(DateUtils.getCurrYearMonth()+"-31");
			ms.setEndTime(DateUtils.getCurrYearMonth()+"-"+DateUtils.getMonthLastDay(null));
			
			//根据类型调用不同的方法
			list = mobileStatMgmt.queryByAllregreceiveByDate(ms);
		}else{ //按月查询
			ms.setStartTime(ServletUtils.parseBeginTime(date));
			
			if(StringUtils.equals(date, "1")){
				ms.setTimeLevel(3);
			}else if(StringUtils.equals(date, "2")){
				ms.setTimeLevel(6);
			}else if(StringUtils.equals(date, "3")){
				ms.setTimeLevel(12); 
			}
		    
		  //根据类型调用不同的方法
		    list = mobileStatMgmt.queryByAllregreceiveByMonth(ms);
		}
	
		
		//组合查询结果
		Map<String,Object> result = new HashMap<String,Object>();
		List<String> categorys = new ArrayList<String>();
		List<Long> data = new ArrayList<Long>();
		for(MobileStatResult rrs : list){
			categorys.add(rrs.getTitle());
			data.add(Long.parseLong(rrs.getTouristsum()));
		}
		
		result.put(MobileConstants.RESULT_CATAGORY, categorys);
		result.put(MobileConstants.RESULT_DATA, data);
		result.put(MobileConstants.RESULT_CODE, MobileConstants.SUCCESS_CODE);
		
		return result;
	}

}
