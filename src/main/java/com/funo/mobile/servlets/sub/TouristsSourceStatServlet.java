package com.funo.mobile.servlets.sub;

import java.sql.Timestamp;
import java.util.Calendar;
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
 * 2.7	游客来源汇总接口<br>
 * 根据登录用户的角色获取其所辖区域内(昨日)游客来源地（包括省内游客）。<br>
注：该总人数是指到所辖区域的所有人，不到景区也算入之内。

 * 
 * @author shijiansheng
 *
 */
public class TouristsSourceStatServlet extends BaseServlet {

	@Override
	public Map<String, Object> process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String userId = request.getParameter("userId");
		
		MobileStat mobileStat = new MobileStat();
		mobileStat.setUserId(userId);
		mobileStat.setProvince(MobileConstants.PROVINCE_CONDITION);
		
		
		//获取昨天的时间
		Timestamp  ts = DateUtils.getBeforeTime(1, "date");
		Calendar c  = Calendar.getInstance();
		c.setTime(ts);
	    String statDate = c.get(Calendar.YEAR)+"-"+(c.get(Calendar.MONTH)+1)+"-"+c.get(Calendar.DATE);
//	    mobileStat.setStatDate("2015-05-10");
	    mobileStat.setStatDate(statDate);
		
		IMobileStatMgmt mobileStatMgmt = SpringContextUtils.getBean(MobileStatMgmt.class);
		
		List<MobileStatResult> list = mobileStatMgmt.queryByTouristStat(mobileStat);
		
		Map<String,Object> result = new HashMap<String,Object>();
		if(list.size()>0){
			Long provinceIn = list.get(0).getProvinceIn(); //省内
			Long provinceOut = list.get(0).getProvinceOut();//省外
			Long all = provinceIn + provinceOut;
			
			result.put(MobileConstants.RESULT_CODE, MobileConstants.SUCCESS_CODE);
			result.put("countAll",all);
			result.put("rateIn",ServletUtils.parsePercent(null, provinceIn, all));
			result.put("rateOut",ServletUtils.parsePercent(null, provinceOut, all));
			
		}
	
		return result;
	}

}
