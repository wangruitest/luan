package com.funo.mobile.servlets.sub;

import java.util.ArrayList;
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
import com.funo.mobile.utils.ServletUtils;
import com.funo.utils.SpringContextUtils;


/**
 *  3.6游客实时流量统计接口<br>
 * 获取其所辖区域内或所选景区的整点实时客流量
 * @author shijiansheng
 *
 */
public class RegionRealtimeSumServlet extends BaseServlet {

	@Override
	public Map<String, Object> process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//组装参数
		String userId = request.getParameter("userId");
		//处理cityId的为全部（为省） 的时候
		String cityId =  ServletUtils.parseCityId(request.getParameter("cityId"));
		String scenicCode = ServletUtils.parseScenicCode(request.getParameter("scenicCode"));
		String date = request.getParameter("date");
		String visitType = request.getParameter("visitType");
		
		
		MobileStat ms = new MobileStat();
		ms.setUserId(userId);
		ms.setCityCode(cityId);
		ms.setRegionId(scenicCode);
		ms.setStatDate(date);
		ms.setTouristType(visitType);
		
		IMobileStatMgmt mobileStatMgmt = SpringContextUtils.getBean(MobileStatMgmt.class);
		List<MobileStatResult> list = mobileStatMgmt.queryByRegionRealtimeSum(ms);
		List<Long> data = new ArrayList<Long>();
		
		//组装结果
		Map<String,Object> result = new HashMap<String,Object>();
		for(MobileStatResult msr : list){
			data.add(Long.parseLong(msr.getTouristsum()));
		}
		result.put(MobileConstants.RESULT_DATA, data);
		result.put(MobileConstants.RESULT_CODE, MobileConstants.SUCCESS_CODE);
		
		
		return result;
	}

}
