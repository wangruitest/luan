package com.funo.mobile.servlets.sub;

import java.util.ArrayList;
import java.util.LinkedHashMap;
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
import com.funo.utils.SpringContextUtils;


/**
 * 3.7	景区驻留分析统计接口
 * @author shijiansheng
 *
 */
public class RegionRemainServlet extends BaseServlet {

	@Override
	public Map<String, Object> process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String cityId = request.getParameter("cityId");//地市编码Id
		String scenicCode = request.getParameter("scenicCode");//景区编码
		
		//根据传入的时间进行
		String statDate =  request.getParameter("date"); //开始时间

		MobileStat rs = new MobileStat();
		rs.setStatDate(statDate);
		rs.setCityCode(cityId);
		rs.setRegionId(scenicCode);
		
		IMobileStatMgmt mobileStatMgmt = SpringContextUtils.getBean(MobileStatMgmt.class);
		List<MobileStatResult> list = mobileStatMgmt.queryByRegionRemainByDate(rs);
		
	  
		Map<String,Object> result = new LinkedHashMap<String,Object>();
//		Map<String,Object> dateMap = new LinkedHashMap<String,Object>();
		List<Long> data = new ArrayList<Long>();
		for(MobileStatResult  trr : list){
			data.add(trr.getOnetotwohCount()); //0~2
			data.add(trr.getTwotosixhCount()); //2~6
			data.add(trr.getSixhtodayCount()); //6~24
			data.add(trr.getDaytotwodCount()); //24~48
			data.add(trr.getMoretwodCount()); //>48
//			data.add(Long.parseLong(trr.getTouristsum()));
			
		}
		//组装结果
		result.put(MobileConstants.RESULT_CODE, MobileConstants.SUCCESS_CODE);
		result.put(MobileConstants.RESULT_DATA, data);
		return result;
	}
	
	
}
