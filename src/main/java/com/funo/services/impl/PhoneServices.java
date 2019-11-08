package com.funo.services.impl;

import com.funo.anhui.mgmt.IAnhuiMgmt;
import com.funo.anhui.model.Anhui;
import com.funo.overnight.mgmt.ITouristRoamingOvernightDayMgmt;
import com.funo.overnight.model.TouristRoamingOvernightDay;
import com.funo.regioninfo.mgmt.IRegionInfoMgmt;
import com.funo.regionnotice.mgmt.IRegionNoticeMgmt;
import com.funo.regionrealtimesum.mgmt.IRegionRealtimeSumMgmt;
import com.funo.regionsummarybyday.mgmt.IRegionSummaryBydayMgmt;
import com.funo.services.*;
import com.funo.system.mgmt.ISysOperatorMgmt;
import com.funo.system.model.SysOperator;
import com.google.gson.Gson;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.jws.WebService;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 手机端服务接口
 *
 * @author chenxifu@funo.com.cn
 */
@WebService(endpointInterface = "com.funo.services.IPhoneServices", targetNamespace = "http://services.funo.com/")
public class PhoneServices implements IPhoneServices {
    @Autowired
    private IRegionInfoMgmt regionInfoMgmt;
    @Autowired
    private ISysOperatorMgmt sysOperatorMgmt;
    @Autowired
    private IRegionSummaryBydayMgmt regionSummaryBydayMgmt;
    @Autowired
    private IRegionRealtimeSumMgmt regionRealtimeSumMgmt;
    @Autowired
    private IRegionNoticeMgmt regionNoticeMgmt;
    @Autowired
    private IAnhuiMgmt anhuiMgmt;
    @Autowired
    private ITouristRoamingOvernightDayMgmt touristRoamingOvernightDayMgmt;

    public IRegionInfoMgmt getRegionInfoMgmt() {
        return regionInfoMgmt;
    }

    public void setRegionInfoMgmt(IRegionInfoMgmt regionInfoMgmt) {
        this.regionInfoMgmt = regionInfoMgmt;
    }

    public ISysOperatorMgmt getSysOperatorMgmt() {
        return sysOperatorMgmt;
    }

    public void setSysOperatorMgmt(ISysOperatorMgmt sysOperatorMgmt) {
        this.sysOperatorMgmt = sysOperatorMgmt;
    }

    public IRegionSummaryBydayMgmt getRegionSummaryBydayMgmt() {
        return regionSummaryBydayMgmt;
    }

    public void setRegionSummaryBydayMgmt(
            IRegionSummaryBydayMgmt regionSummaryBydayMgmt) {
        this.regionSummaryBydayMgmt = regionSummaryBydayMgmt;
    }

    public IRegionRealtimeSumMgmt getRegionRealtimeSumMgmt() {
        return regionRealtimeSumMgmt;
    }

    public void setRegionRealtimeSumMgmt(
            IRegionRealtimeSumMgmt regionRealtimeSumMgmt) {
        this.regionRealtimeSumMgmt = regionRealtimeSumMgmt;
    }

    public IRegionNoticeMgmt getRegionNoticeMgmt() {
        return regionNoticeMgmt;
    }

    public void setRegionNoticeMgmt(IRegionNoticeMgmt regionNoticeMgmt) {
        this.regionNoticeMgmt = regionNoticeMgmt;
    }

    public IAnhuiMgmt getAnhuiMgmt() {
        return anhuiMgmt;
    }

    public void setAnhuiMgmt(IAnhuiMgmt anhuiMgmt) {
        this.anhuiMgmt = anhuiMgmt;
    }

	public ITouristRoamingOvernightDayMgmt getTouristRoamingOvernightDayMgmt() {
		return touristRoamingOvernightDayMgmt;
	}

	public void setTouristRoamingOvernightDayMgmt(
			ITouristRoamingOvernightDayMgmt touristRoamingOvernightDayMgmt) {
		this.touristRoamingOvernightDayMgmt = touristRoamingOvernightDayMgmt;
	}

	/**
     * 用户登录验证
     *
     * @param username
     * @param password
     * @return
     */
    private boolean loginValidate(String username, String password) {
        boolean result = false;
        SysOperator userQuery = new SysOperator();
        userQuery.setLoginName(username);
        userQuery.setStatus(0L);
        List<SysOperator> users = sysOperatorMgmt.querySysOperator(userQuery);
        if (null != users && users.size() > 0) {
            if (users.get(0).getPassword().equals(password)) {
                result = true;
            } else {
                result = false;
            }
        } else {
            result = false;
        }
        return result;
    }

    @Override
    public String getTouristFromToAnhui(String username, String password,
                                        String searchDate) {
        TouristFromToAnhuiResponse response = new TouristFromToAnhuiResponse();
        response.setResult("1");
        response.setSearchDate(searchDate);
        Gson gson = new Gson();
        try {
            // 验证用户
            if (!"admin".equalsIgnoreCase(username)
                    || !"123".equalsIgnoreCase(password)) {
                response.setMsg("用户名或密码错误！");
                String resultStr = gson.toJson(response);
                return resultStr;
            }

            if (StringUtils.isBlank(searchDate)) {
                response.setMsg("参数不能为空！");
                String resultStr = gson.toJson(response);
                return resultStr;
            }

            // 获取数据
            Anhui anhui = new Anhui();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date timeParam = sdf.parse(searchDate);
            anhui.setStatDay(timeParam);
            List<Anhui> list1 = anhuiMgmt.queryBy1(anhui);
            List<Anhui> list2 = anhuiMgmt.queryBy2(anhui);
            List<TouristFromToAnhui> tourList = new ArrayList<TouristFromToAnhui>();
            if (null != list1) {
                for (Anhui ah : list1) {
                    TouristFromToAnhui tfta = new TouristFromToAnhui();
                    tfta.setCount(ah.getCount());
                    tfta.setCountryId(ah.getCountryId());
                    tfta.setCountryName(ah.getCountryName());
                    tourList.add(tfta);
                }
            }

            TouristFromToAnhui tfta = new TouristFromToAnhui();
            tfta.setCountryId("I999");
            tfta.setCountryName("中国");
            tfta.setCount(null);
            if (null != list2 && !list2.isEmpty()) {
                List<TouristInChina> chinaList = new ArrayList<TouristInChina>();
                for (Anhui ah : list2) {
                    TouristInChina tic = new TouristInChina();
                    tic.setCount(ah.getCount());
                    tic.setProvinceId(ah.getProvinceId());
                    tic.setProvinceName(ah.getProvinceName());
                    chinaList.add(tic);
                }
                tfta.setList(chinaList);

                tourList.add(tfta);
            }


            if (!tourList.isEmpty()) {
                response.setMsg("数据返回成功！");
                response.setResult("0");
                response.setLstAllCountry(tourList);
            } else {
                response.setMsg("无对应数据！");
                response.setResult("1");
            }

            String resultStr = gson.toJson(response);
            return resultStr;
        } catch (Exception e) {
            response.setMsg(e.toString());
            response.setResult("1");
            String resultStr = gson.toJson(response);
            return resultStr;
        }
    }

    @Override
    public String getTouristByScenic(String username, String password,
                                     String scenicCode, String searchDate) {
        TouristByScenicResponse response = new TouristByScenicResponse();
        response.setResult("1");
        response.setScenicCode(scenicCode);
        response.setSearchDate(searchDate);
        JSONObject result = new JSONObject();
        try {
            // 验证用户
            if (!"admin".equalsIgnoreCase(username)
                    || !"123".equalsIgnoreCase(password)) {
                response.setMsg("用户名或密码错误！");
                result = JSONObject.fromObject(response);
                String resultStr = result.toString();
                return resultStr;
            }

            if (StringUtils.isBlank(scenicCode)
                    || StringUtils.isBlank(searchDate)) {
                response.setMsg("参数不能为空！");
                result = JSONObject.fromObject(response);
                String resultStr = result.toString();
                return resultStr;
            }

            // 获取数据
            Anhui anhui = new Anhui();
            anhui.setRegionId(scenicCode);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date timeParam = sdf.parse(searchDate);
            anhui.setStatDay(timeParam);
            List<Anhui> list = anhuiMgmt.queryBy3(anhui);
            List<TouristInChina> tourList = new ArrayList<TouristInChina>();
            if (null != list) {
                for (Anhui ah : list) {
                    TouristInChina t = new TouristInChina();
                    t.setCount(ah.getCount());
                    t.setProvinceId(ah.getProvinceId());
                    t.setProvinceName(ah.getProvinceName());
                    tourList.add(t);
                }
            }

            if (!tourList.isEmpty()) {
                response.setMsg("数据返回成功！");
                response.setResult("0");
                response.setLstInChina(tourList);
            } else {
                response.setMsg("无对应数据！");
                response.setResult("1");
            }

            result = JSONObject.fromObject(response);
            String resultStr = result.toString();
            return resultStr;
        } catch (Exception e) {
            response.setMsg(e.toString());
            response.setResult("1");
            return JSONObject.fromObject(response).toString();
        }
    }

    @Override
    public String getRealtimeByScenic(String username, String password,
                                      String scenicCode) {
        RealtimeByScenicResponse response = new RealtimeByScenicResponse();
        response.setResult("1");
        response.setScenicCode(scenicCode);
        JSONObject result = new JSONObject();
        try {
            // 验证用户
            if (!"admin".equalsIgnoreCase(username)
                    || !"123".equalsIgnoreCase(password)) {
                response.setMsg("用户名或密码错误！");
                result = JSONObject.fromObject(response);
                String resultStr = result.toString();
                return resultStr;
            }

            if (StringUtils.isBlank(scenicCode)
                    || !StringUtils.isNumeric(scenicCode)) {
                response.setMsg("参数错误！");
                result = JSONObject.fromObject(response);
                String resultStr = result.toString();
                return resultStr;
            }

            // 获取数据
            Anhui anhui = new Anhui();
            anhui.setRegionId(scenicCode);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            List<Anhui> list = anhuiMgmt.queryBy4(anhui);
            List<RealtimeByScenic> tourList = new ArrayList<RealtimeByScenic>();
            if (null != list) {
                for (Anhui ah : list) {
                    RealtimeByScenic t = new RealtimeByScenic();
                    t.setCount(ah.getCount());
                    if(ah.getStatTime() == null){
                        break;
                    }
                    String date_time = sdf.format(ah.getStatTime());
                    t.setDate_time(date_time);
                    t.setFlag(ah.getFlag());
                    tourList.add(t);
                }
            }

            if (!tourList.isEmpty()) {
                response.setMsg("数据返回成功！");
                response.setResult("0");
                response.setLstRealtime(tourList);
            } else {
                response.setMsg("无对应数据！");
                response.setResult("1");
            }

            result = JSONObject.fromObject(response);
            String resultStr = result.toString();
            return resultStr;
        } catch (Exception e) {
            response.setMsg(e.toString());
            response.setResult("1");
            return JSONObject.fromObject(response).toString();
        }
    }
    
    @Override
    public String getOverNightByCity(String username, String password,
			String cityCode,String searchDate){
    	
    	OverNightByCityResponse response = new OverNightByCityResponse();
        response.setResult("1");
        response.setCityCode(cityCode);
        JSONObject result = new JSONObject();
        try {
        	// 验证用户
            if (!"admin".equalsIgnoreCase(username)
                    || !"123".equalsIgnoreCase(password)) {
                response.setMsg("用户名或密码错误！");
                result = JSONObject.fromObject(response);
                String resultStr = result.toString();
                return resultStr;
            }

            if (StringUtils.isBlank(searchDate)
                    || StringUtils.isBlank(cityCode)) {
                response.setMsg("参数不能为空！");
                result = JSONObject.fromObject(response);
                String resultStr = result.toString();
                return resultStr;
            }
        	
            
            // 获取数据
            TouristRoamingOvernightDay touristRoamingOvernightDay = new TouristRoamingOvernightDay();
            touristRoamingOvernightDay.setCityCode(cityCode);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date timeParam = sdf.parse(searchDate);
            touristRoamingOvernightDay.setStatDay(timeParam);
            
            List<TouristRoamingOvernightDay> lstOverNight = touristRoamingOvernightDayMgmt.queryTouristRoamingOvernightDay(touristRoamingOvernightDay);
            List<OverNightByCity> tourList = new ArrayList<OverNightByCity>();
            if (null != lstOverNight) {
                for (TouristRoamingOvernightDay overnight : lstOverNight) {
                	OverNightByCity t = new OverNightByCity();
                	
                	t.setCount(String.valueOf(overnight.getCount()));
                    if(overnight.getStatDay() == null){
                        break;
                    }
                    String statDate = sdf.format(overnight.getStatDay());
                    t.setStatDay(statDate);
                    t.setCityCode(overnight.getCityCode());
                   
                    t.setVisitorCity(overnight.getVisitorcity());
                    t.setVisitorProvince(overnight.getVisitorprovince());
                    tourList.add(t);
                }
            }
            
            if (!tourList.isEmpty()) {
            	response.setMsg("数据返回成功！");
                response.setResult("0");
                response.setLstOverNight(tourList);
            }else{
            	response.setMsg("无对应数据！");
                response.setResult("1");
            }
            
            return JSONObject.fromObject(response).toString();
        } catch (Exception e) {
            response.setMsg(e.toString());
            response.setResult("1");
            return JSONObject.fromObject(response).toString();
        }
    }

	@Override
	public String getRealTimeToday(String username, String password,
			String scenicCode) {
		RealtimeByScenicResponse response = new RealtimeByScenicResponse();
        response.setResult("1");
        response.setScenicCode(scenicCode);
        JSONObject result = new JSONObject();
        try {
            // 验证用户
            if (!"admin".equalsIgnoreCase(username)
                    || !"123".equalsIgnoreCase(password)) {
                response.setMsg("用户名或密码错误！");
                result = JSONObject.fromObject(response);
                String resultStr = result.toString();
                return resultStr;
            }

            if (StringUtils.isBlank(scenicCode)
                    || !StringUtils.isNumeric(scenicCode)) {
                response.setMsg("参数错误！");
                result = JSONObject.fromObject(response);
                String resultStr = result.toString();
                return resultStr;
            }

            // 获取数据
            Anhui anhui = new Anhui();
            anhui.setRegionId(scenicCode);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            List<Anhui> list = anhuiMgmt.queryBy5(anhui);
            List<RealtimeByScenic> tourList = new ArrayList<RealtimeByScenic>();
            if (null != list) {
                for (Anhui ah : list) {
                    RealtimeByScenic t = new RealtimeByScenic();
                    t.setCount(ah.getCount());
                    if(ah.getStatTime() == null){
                        break;
                    }
                    String date_time = sdf.format(ah.getStatTime());
                    t.setDate_time(date_time);
                    t.setFlag(ah.getFlag());
                    tourList.add(t);
                }
            }

            if (!tourList.isEmpty()) {
                response.setMsg("数据返回成功！");
                response.setResult("0");
                response.setLstRealtime(tourList);
            } else {
                response.setMsg("无对应数据！");
                response.setResult("1");
            }

            result = JSONObject.fromObject(response);
            String resultStr = result.toString();
            return resultStr;
        } catch (Exception e) {
            response.setMsg(e.toString());
            response.setResult("1");
            return JSONObject.fromObject(response).toString();
        }
	}

}  

