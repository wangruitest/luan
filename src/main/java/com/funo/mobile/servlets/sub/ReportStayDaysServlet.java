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
import com.funo.mobile.utils.ServletUtils;
import com.funo.utils.SpringContextUtils;

/**
 * 3.9	游客旅游天数统计接口
 * @author shijiansheng
 *
 */
public class ReportStayDaysServlet extends BaseServlet {

	@Override
	public Map<String, Object> process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String userId = request.getParameter("userId");
		String cityId = request.getParameter("cityId");//地市编码Id
		String time= request.getParameter("time");//查询日期（0：近一个月；1：近三个月；2：近半年；3：近一年）
		String visitType = request.getParameter("visitType");//游客类型（0：全部游客；1：省内游客；2：省外游客）
		
		MobileStat mobileStat = new MobileStat();
		mobileStat.setUserId(userId);
//		mobileStat.setStartTime(ServletUtils.parseBeginTime(time)+"-01");
//		mobileStat.setEndTime(DateUtils.getCurrYearMonth()+"-"+DateUtils.getMonthLastDay(null));
		
		mobileStat.setStartTime(ServletUtils.parseSpecBeginTime(time)+"-01");
		//上个月的月末
		mobileStat.setEndTime(DateUtils.getDiffMonth(new Date(), 1,"yyyy-MM")+"-"+DateUtils.getMonthLastDay(DateUtils.getBeforeTime(1, "month")));
		mobileStat.setTouristType(visitType);
		mobileStat.setCityCode(cityId);
		mobileStat.setProvince(MobileConstants.PROVINCE_CONDITION);
		
//		mobileStat.setStartTime("2015-01-01");
//		mobileStat.setEndTime("2015-05-31");
		
		
		IMobileStatMgmt mobileStatMgmt = SpringContextUtils.getBean(MobileStatMgmt.class);
		
		List<MobileStatResult> list = mobileStatMgmt.queryByReportStayDays(mobileStat);
		
		//组装数据
		Map<String,Object> result = new HashMap<String,Object>();
		
		List<Long> data = new ArrayList<Long>();
		for(MobileStatResult rrs : list){
			data.add(rrs.getDay1Sum());
			data.add(rrs.getDay2Sum());
			data.add(rrs.getDay3Sum());
			data.add(rrs.getDay4Sum());
			data.add(rrs.getDay5Sum());
			data.add(rrs.getDayMoreSum());
		}
		
		result.put(MobileConstants.RESULT_DATA, data);
		result.put(MobileConstants.RESULT_CODE, MobileConstants.SUCCESS_CODE);
		
		return result;
	}

}
