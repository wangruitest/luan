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
import com.funo.mobile.utils.DateUtils;
import com.funo.mobile.utils.ServletUtils;
import com.funo.utils.SpringContextUtils;

/**
 * 3.13	景区游客排行统计接口
 * @author shijiansheng
 *
 */
public class ReportRegionHotServlet extends BaseServlet {

	@Override
	public Map<String, Object> process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String userId = request.getParameter("userId");//登录用户Id
//		String cityId = request.getParameter("cityId"); //地市编码Id（可为空）
		String date  = request.getParameter("date");//查询日期（0：近一个月；1：近三个月；2：近半年；3：近一年）
		String scenicCode = ServletUtils.parseScenicCode(request.getParameter("scenicCode")); //景区编码（包括“全部”选项）
		
		String topN = request.getParameter("topN") == null ? "10" : request.getParameter("topN"); //用户所辖区域内排名前N位景区（默认为10）
		
		//组装查询参数
		MobileStat ms = new MobileStat();
		ms.setUserId(userId);
//		ms.setCityCode(cityId);
		ms.setStartTime(ServletUtils.parseBeginTime(date));
		ms.setEndTime(DateUtils.getCurrYearMonth());
		ms.setRegionId(scenicCode);
		ms.setTopN(topN);
		//查询
		IMobileStatMgmt mobileStatMgmt = SpringContextUtils.getBean(MobileStatMgmt.class);
		List<MobileStatResult> list = mobileStatMgmt.queryByReportRegionHot(ms);
		
		
		//组装查询结果
		List<String> categorys = new ArrayList<String>();
		List<Long> data = new ArrayList<Long>();
		for(MobileStatResult msr : list){
			categorys.add(msr.getTitle());
			data.add(Long.parseLong(msr.getTouristsum()));
		}
		//组装数据
		Map<String,Object> result = new HashMap<String,Object>();
		result.put(MobileConstants.RESULT_CATAGORY, categorys);
		result.put(MobileConstants.RESULT_DATA, data);
		result.put(MobileConstants.RESULT_CODE, MobileConstants.SUCCESS_CODE);
		
		
		return result;
	}

}
