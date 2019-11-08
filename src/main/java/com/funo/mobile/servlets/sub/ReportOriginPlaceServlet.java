package com.funo.mobile.servlets.sub;

import java.util.ArrayList;
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
 * 3.12	景区游客归属地统计接口
 * @author shijiansheng
 *
 */
public class ReportOriginPlaceServlet extends BaseServlet {

	@Override
	public Map<String, Object> process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String userId = request.getParameter("userId");
		String cityId = ServletUtils.parseCityId(request.getParameter("cityId")); //城市id
		String scenicCode = ServletUtils.parseScenicCode(request.getParameter("scenicCode"));//景区编码（包括“全部”选项）
		String date = request.getParameter("date");//查询日期（0：当天；1：近一个月；2：近三个月；3：近半年；4：近一年）
		String visitFrom = request.getParameter("visitFrom");//游客类型（0：包含海外游客；1：不包含海外游客）
		
		
		MobileStat ms = new MobileStat();
		ms.setUserId(userId);
		ms.setCityCode(cityId);
		ms.setRegionId(scenicCode);
		ms.setTouristType(visitFrom);
		ms.setForeignAreaCode(MobileConstants.FOREIGN_AREA_CODE);
		if(StringUtils.equals(date, "0")){ //当天
			ms.setStartTime(DateUtils.formatterDate(new Date(), "yyyy-MM-dd"));
			ms.setEndTime(DateUtils.formatterDate(new Date(), "yyyy-MM-dd"));
//			ms.setStartTime("2015-05-09");
//			ms.setEndTime("2015-05-09");
			ms.setTimeFormat("yyyy-MM-dd");
			ms.setStatTimeType("stat_day");
			ms.setStatTable("REGION_SUMMARY_BYDAY");
		}else{ //根据类型转换时间
			date = String.valueOf(Integer.parseInt(date)-1);
			ms.setStartTime(ServletUtils.parseBeginTime(date));
			ms.setEndTime(DateUtils.getCurrYearMonth());
			ms.setTimeFormat("yyyy-MM");
			ms.setStatTimeType("stat_month");
			ms.setStatTable("REGION_SUMMARY_BYMONTH");
		}
		
		IMobileStatMgmt mobileStatMgmt = SpringContextUtils.getBean(MobileStatMgmt.class);
		
		List<MobileStatResult> list =  null;
		if(StringUtils.equals(visitFrom, "1")){
			 list =  mobileStatMgmt.queryByReportOriginPlace(ms);
		}else{
			list =  mobileStatMgmt.queryByReportOriginPlaceAll(ms);
		}
		
		//结果查询
		//组装数据
		Map<String,Object> result = new HashMap<String,Object>();
		List<String> categorys = new ArrayList<String>();
		List<Long> data = new ArrayList<Long>();
		for(MobileStatResult msr : list){
			categorys.add(msr.getTitle());
			data.add(Long.parseLong(msr.getTouristsum()));
		}
		
		result.put(MobileConstants.RESULT_CATAGORY, categorys);
		result.put(MobileConstants.RESULT_DATA, data);
		if(data.size()==0) //没有值也为失败
			result.put(MobileConstants.RESULT_CODE, MobileConstants.FAIL_CODE);
		else
			result.put(MobileConstants.RESULT_CODE, MobileConstants.SUCCESS_CODE);
		
		return result;
	}

}
