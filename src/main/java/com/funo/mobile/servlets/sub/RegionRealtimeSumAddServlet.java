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
 * 实时新增客流统计接口:<br>
 * 获取其所辖区域内或所选景区的各整点时间内的实时新增客流量<br>
 * @author shijiansheng
 *
 */
public class RegionRealtimeSumAddServlet extends BaseServlet {


	@Override
	public Map<String, Object> process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String userId = request.getParameter("userId");
		String cityId =  ServletUtils.parseCityId(request.getParameter("cityId"));
		String scenicCode = ServletUtils.parseScenicCode(request.getParameter("scenicCode"));
		String date  = request.getParameter("date");//查询日期
		String visitType = request.getParameter("visitType");//游客类型（0：全部游客；1：省内游客；2：省外游客）
		
		
		//组装查询条件
		MobileStat ms = new MobileStat();
		ms.setUserId(userId);
		ms.setCityCode(cityId);
		ms.setRegionId(scenicCode);
		ms.setStatDate(date);
		ms.setTouristType(visitType);
				
		IMobileStatMgmt mobileStatMgmt = SpringContextUtils.getBean(MobileStatMgmt.class);
		List<MobileStatResult> list = mobileStatMgmt.queryByRegionRealtimeSumAdd(ms);
		
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
