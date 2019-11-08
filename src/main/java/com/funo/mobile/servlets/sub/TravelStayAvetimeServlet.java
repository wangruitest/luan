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
 * 3.8	游客驻留时间统计接口
 * @author shijiansheng
 *
 */
public class TravelStayAvetimeServlet extends BaseServlet {

	@Override
	public Map<String, Object> process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String userId = request.getParameter("userId");
		String cityId = ServletUtils.parseCityId(request.getParameter("cityId"));//地市编码Id
		String scenicCode = ServletUtils.parseScenicCode(request.getParameter("scenicCode"));//景区编码（存在“全部”选项）
		String time= request.getParameter("time");//查询日期（0：近一个月；1：近三个月；2：近半年；3：近一年）
		String visitType = request.getParameter("visitType");//游客类型（0：全部游客；1：省内游客；2：省外游客）
		
		MobileStat ms = new MobileStat();
		ms.setCityCode(cityId);
		ms.setRegionId(scenicCode);
		ms.setStartTime(ServletUtils.parseSpecBeginTime(time));
		ms.setEndTime(DateUtils.getDiffMonth(new Date(), 1, null));
//		ms.setEndTime(DateUtils.getCurrYearMonth());
//		ms.setStartTime("2015-01");
//		ms.setEndTime("2015-03");
//		ms.setTouristType(visitType);
		ms.setUserId(userId);
		ms.setProvince(MobileConstants.PROVINCE_CONDITION);
		
		IMobileStatMgmt mobileStatMgmt = SpringContextUtils.getBean(MobileStatMgmt.class);
		List<MobileStatResult> list =  mobileStatMgmt.queryByTravelStayAvgTime(ms);
		Map<String,Object> result = new HashMap<String,Object>();
		List<String> categorys = new ArrayList<String>();
		List<Long> data = new ArrayList<Long>();
		for(MobileStatResult msr : list){
			categorys.add(msr.getTitle());
			data.add(Long.parseLong(msr.getAvgTime()));
		}
		
		result.put(MobileConstants.RESULT_CATAGORY, categorys);
		result.put(MobileConstants.RESULT_DATA, data);
		result.put(MobileConstants.RESULT_CODE, MobileConstants.SUCCESS_CODE);
		return result;
	}

}
