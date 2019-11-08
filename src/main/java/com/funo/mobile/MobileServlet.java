package com.funo.mobile;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.directwebremoting.WebContextFactory;
import org.directwebremoting.impl.DefaultWebContextBuilder;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.funo.mobile.mgmt.impl.MobileMgmt;
import com.funo.mobile.model.MobileAlarm;
import com.funo.mobile.model.Region;
import com.funo.mobile.model.ReportOne;
import com.funo.mobile.model.ReportThree;
import com.funo.mobile.model.ReportTwo;
import com.funo.mobile.model.Software;
import com.funo.mobile.utils.ServletUtils;
import com.funo.noticecfg.mgmt.impl.NoticeCfgMgmt;
import com.funo.noticecfg.model.NoticeCfg;
import com.funo.noticecfg.model.PageCount;
import com.funo.system.mgmt.impl.SysOperatorMgmt;
import com.funo.system.mgmt.impl.SysOrganizationMgmt;
import com.funo.system.model.SysOperator;
import com.funo.system.model.SysOrganization;
import com.funo.system.model.SysRole;
import com.funo.utils.DateUtils;
import com.funo.utils.Md5PwdEncoder;

public class MobileServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private WebApplicationContext webApplicationContext;
	
	//public static Map<String, Object> CACHE_MAP = new HashMap<String, Object>();
	
	/**
	 * Constructor of the object.
	 */
	public MobileServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/json; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		DefaultWebContextBuilder webBuilder = new DefaultWebContextBuilder();// 创建WebContextBuilder 
        webBuilder.set(request, response, getServletConfig(), getServletContext(), null);
        WebContextFactory.setWebContextBuilder(webBuilder);
        
        MobileMgmt mobileMgmt = (MobileMgmt)webApplicationContext.getBean("mobileMgmt");
		
		String type = request.getParameter("type");
		OutputStream out = response.getOutputStream();
		String userId = request.getParameter("userId");
		SysOperatorMgmt sysOperatorMgmt = (SysOperatorMgmt)webApplicationContext.getBean("sysOperatorMgmt");
		Map<String, Object> data = new HashMap<String, Object>();
		
		if(type.equals("1")){//用户登录
			String password = request.getParameter("password");
			if(userId != null && !userId.equals("") && password !=null && !password.equals("")){
				
				SysOperator userQuery=new SysOperator();
				userQuery.setLoginName(userId);
				userQuery.setStatus(0L);
				userQuery.setOperatorType(2l);//手机用户
				
				try {
					List<SysOperator> users=sysOperatorMgmt.querySysOperator(userQuery);
					if(null!=users && users.size()>0){
						SysOperator curUser=users.get(0);
						Md5PwdEncoder pwdEncoder=new Md5PwdEncoder();
						if(pwdEncoder.isPasswordValid(curUser.getPassword(), password)){
							data.put("code","0");
							data.put("userId", curUser.getUnid());
							data.put("userName", curUser.getLoginName());
							data.put("cityName",curUser.getOrg().getName());//用户归属城市
							data.put("cityCode",curUser.getOrg().getCode());
							data.put("roleCode",curUser.getMobileRole());
							List<Map<String, String>> roleList = new ArrayList<Map<String,String>>();
							for(SysRole role : curUser.getRoles()){//获取权限
								Map<String,String> r = new HashMap<String, String>();
								r.put("roleId",role.getUnid());
								r.put("roleName", role.getName());
								roleList.add(r);
							}
							data.put("roles", roleList);
							
						}
						out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
						out.close();
						return ;
					}
					
				} catch (Exception e) {
					e.printStackTrace();
					data.put("code","1");
					data.put("msg",MobileConstants.SYSTEM_ERROR);
					out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
					out.close();
					return ;
				}
			}	
			data.put("code","1");
			data.put("msg",MobileConstants.USER_ERROR);
			out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
			out.close();
			
		}else if(type.equals("2")){//软件升级接口
			
			String currentVersion = request.getParameter("currentVersion");
			if(currentVersion==null || currentVersion.equals("")){
				data.put("code","1");
				data.put("msg",MobileConstants.SOFTWARE_ERROR_MSG);
				
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			try {
				List<Software> soft = mobileMgmt.queryBySoftware();
				if(soft != null && soft.size()>0){
					Software software  = soft.get(0);
					if(currentVersion.equals(software.getCurrentVersion())){//版本相同
						data.put("code","0");
						data.put("isNeedUpdate","0");//暂定0不升级
						data.put("url", software.getUrl());
						
						out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
						out.close();
						return ;
					}else{
						data.put("code","0");
						data.put("isNeedUpdate","1");//暂定1升级
						data.put("url", software.getUrl());
						out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
						out.close();
						return ;
						
					}
					
				}else{
					
					data.put("code","1");				
					data.put("msg","数据库未有软件版本信息！");					
					out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
					out.close();
					return ;
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
				data.put("code","1");
				data.put("msg",MobileConstants.SYSTEM_ERROR);	
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			
			
		}else if(type.equals("3")){//地市列表带全部
			if(userId==null || userId.equals("")){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			
			SysOperator curUser = checkUser(userId);
			if(curUser == null){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			SysOrganization sysOrganization = curUser.getOrg();
			List<HashMap<String, String>> datas = new ArrayList<HashMap<String,String>>();
			HashMap<String, String> d = new HashMap<String, String>();
			if(sysOrganization.getUnid().equals("0")){//省级管理员
				d.put("cityId",sysOrganization.getCode());
				d.put("cityName","全部");
				d.put("provinceId", MobileConstants.PROVINCE_CODE);
				datas.add(d);
				for(SysOrganization org : curUser.getChildOrgs()){//子地市
					HashMap<String, String> ds = new HashMap<String, String>();
					ds.put("cityId",org.getCode());
					ds.put("cityName",org.getName());
					ds.put("provinceId", MobileConstants.PROVINCE_CODE);
					datas.add(ds);
				}
				data.put("code","0");
				data.put("value", datas);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
				
			}else{
				SysOrganizationMgmt sysOrganizationMgmt = (SysOrganizationMgmt)webApplicationContext.getBean("sysOrganizationMgmt");
				try {//获取省级城市
					SysOrganization parms = new SysOrganization();
					parms.setUnid("0");
					List<SysOrganization> orgs = sysOrganizationMgmt.querySysOrganization(parms);
					HashMap<String, String> provicen = new HashMap<String, String>();
					provicen.put("cityId", orgs.get(0).getCode());
					provicen.put("cityName","全部");
					provicen.put("provinceId", MobileConstants.PROVINCE_CODE);
					datas.add(provicen);
				} catch (Exception e) {
					e.printStackTrace();
					data.put("code","1");
					data.put("msg",MobileConstants.SYSTEM_ERROR);
					out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
					out.close();
					return ;
				}
				
				d.put("cityId",sysOrganization.getCode());
				d.put("cityName",sysOrganization.getName());
				d.put("provinceId", MobileConstants.PROVINCE_CODE);
				datas.add(d);
				//数据返回
				data.put("code","0");
				data.put("value", datas);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
		}else if(type.equals("4")){//地市列表
			if(userId==null || userId.equals("")){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			SysOperator curUser = checkUser(userId);
			if(curUser == null){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			SysOrganization sysOrganization = curUser.getOrg();
			List<HashMap<String, String>> datas = new ArrayList<HashMap<String,String>>();
			HashMap<String, String> d = new HashMap<String, String>();
			if(sysOrganization.getUnid().equals("0")){//省级管理员
				/*d.put("cityId",sysOrganization.getCode());
				d.put("cityName","全部");
				d.put("provinceId", MobileConstants.PROVINCE_CODE);
				datas.add(d);*/
				for(SysOrganization org : curUser.getChildOrgs()){//子地市
					HashMap<String, String> ds = new HashMap<String, String>();
					ds.put("cityId",org.getCode());
					ds.put("cityName",org.getName());
					ds.put("provinceId", MobileConstants.PROVINCE_CODE);
					datas.add(ds);
				}
				data.put("code","0");
				data.put("value", datas);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
				
			}else{//地市级管理员
				
				d.put("cityId",sysOrganization.getCode());
				d.put("cityName",sysOrganization.getName());
				d.put("provinceId", MobileConstants.PROVINCE_CODE);
				datas.add(d);
				//数据返回
				data.put("code","0");
				data.put("value", datas);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
		}else if(type.equals("5")){//景区列表接口（带“全部”）
			if(userId==null || userId.equals("")){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			SysOperator curUser = checkUser(userId);
			if(curUser == null){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			try {
				String userUnid=curUser.getUnid();
				//curUser.getOtherParams().put(Constants.TEMP_DB_TYPE, Constants.DB_TYPE_CSMS);
				//curUser.getOtherParams().put(Constants.TEMP_ORG_CODE, (String)curUser.getOtherParams().get(Constants.CUR_CHOOSE_CITY));
				//request.getSession().setAttribute(Constants.Session_Attribute_UserEnv,curUser);
				//ApplicationContext.putSessionId(curUser.getUnid(),request.getSession().getId());
				//UserBusinessCfgMgmt userBusinessCfgMgmt = (UserBusinessCfgMgmt)webApplicationContext.getBean("userBusinessCfgMgmt");
				
				Region parm = new Region();
				parm.setUserId(userUnid);
				parm.setCityCode( request.getParameter("cityId"));
				List<Region> regions = mobileMgmt.queryByRegions(parm);
				List<Map<String, String>> datas = new ArrayList<Map<String,String>>();
				Map<String, String> all = new HashMap<String, String>();
				all.put("scenicCode", "-1");
				all.put("scenicName","全部");
				datas.add(all);
				
				for(Region r : regions){
					Map<String, String> d = new HashMap<String, String>();
					d.put("scenicCode", r.getRegionId());
					d.put("scenicName", r.getRegionName());
					datas.add(d);
				}
				

				/*curUser.getOtherParams().put(Constants.TEMP_DB_TYPE, Constants.DB_TYPE_CSMS);
				curUser.getOtherParams().put(Constants.TEMP_ORG_CODE, Constants.DS_CODE_ALL);
				RegionCfgMgmt regionCfgMgmt = (RegionCfgMgmt)webApplicationContext.getBean("regionCfgMgmt");
				RegionCfg qRegionCfg=new RegionCfg();
				qRegionCfg.setBusinessidStr(businessIdStr);
				List<RegionCfg> regionCfgList=regionCfgMgmt.queryRegionCfgOfcityUser(qRegionCfg);
				List<Map<String, String>> datas = new ArrayList<Map<String,String>>();
				for(RegionCfg r : regionCfgList){
					Map<String, String> d = new HashMap<String, String>();
					d.put("regionID", r.getUnid());
					d.put("regionName", r.getRegionName());
					datas.add(d);
				}*/
				data.put("code","0");
				data.put("value", datas);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			} catch (Exception e) {
				e.printStackTrace();
				data.put("code","1");
				data.put("msg",MobileConstants.SYSTEM_ERROR);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			
			
			
		}else if(type.equals("6")){//景区列表接口
			if(userId==null || userId.equals("")){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			SysOperator curUser = checkUser(userId);
			if(curUser == null){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			try {
				String userUnid=curUser.getUnid();
				Region parm = new Region();
				parm.setUserId(userUnid);
				parm.setCityCode( request.getParameter("cityId"));
				List<Region> regions = mobileMgmt.queryByRegions(parm);
				List<Map<String, String>> datas = new ArrayList<Map<String,String>>();
				for(Region r : regions){
					Map<String, String> d = new HashMap<String, String>();
					d.put("scenicCode", r.getRegionId());
					d.put("scenicName", r.getRegionName());
					datas.add(d);
				}
				data.put("code","0");
				data.put("value", datas);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			} catch (Exception e) {
				e.printStackTrace();
				data.put("code","1");
				data.put("msg",MobileConstants.SYSTEM_ERROR);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
		}else if(type.equals("7")){//来皖客流汇总接口
			if(userId==null || userId.equals("")){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			SysOperator curUser = checkUser(userId);
			if(curUser == null){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			try {
				ReportOne parm = new ReportOne();
				if(!curUser.getOrg().getCode().equals("340000")){
					parm.setCityId(curUser.getOrg().getCode());
				}
				
				String regionIds = getRegionIds(curUser.getUnid());
				if(regionIds != null && !regionIds.equals("")){
					parm.setRegionIds(regionIds);
				}
				parm.setDate(MyDate.dateReduce(1));//昨天
				parm.setYear(MyDate.getLastYear(MyDate.dateReduce(1), -1));
				
				List<ReportOne> datas = mobileMgmt.queryByReportOneTah(parm);
				String cityCounts="0",regionCounts="0",yearCounts="0",result="";
				for(ReportOne r : datas){
					if(r.getType().equals("1")){//到景区的人数
						if(r.getCount() != null){
							regionCounts = r.getCount();
						}
					}else if(r.getType().equals("2")){//到改地市的游客
						if(r.getCount() != null){
							cityCounts = r.getCount();
							
						}
					}else if(r.getType().equals("3")){//去年到该地市的游客
						if(r.getCount() != null){
							yearCounts = r.getCount();
							
						}
					}
				}
				if(regionCounts != null && !regionCounts.equals("0")&& cityCounts != null && !cityCounts.equals("0")){
					result = ServletUtils.parsePercent(null,Long.parseLong(regionCounts),Long.parseLong(cityCounts));
					data.put("conRate", result);
				}else{
					data.put("conRate", "0");
				}
				data.put("countToAnhui",Long.parseLong(cityCounts));
				data.put("countToAnhuiYoY", Long.parseLong(yearCounts));
				data.put("code","0");
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			} catch (Exception e) {
				e.printStackTrace();
				data.put("code","1");
				data.put("msg",MobileConstants.SYSTEM_ERROR);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			
			
		}else if(type.equals("8")){//来皖客流列表接口
			
			if(userId==null || userId.equals("")){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			SysOperator curUser = checkUser(userId);
			if(curUser == null){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			try {
				ReportTwo parm = new ReportTwo();
				if(!curUser.getOrg().getCode().equals("340000")){
					parm.setCityId(curUser.getOrg().getCode());
				}
				
				parm.setDate(MyDate.dateReduce(1));//获取昨天日期
				//parm.setDate("2013-8-30");
				List<ReportTwo> datas = mobileMgmt.queryByReportTwo(parm);
				Long sum=0L;
				for(ReportTwo r : datas){//先循环获取总人数
					if(r.getTouristcount() != null){
						sum+= Long.parseLong(r.getTouristcount());
						
					}
				}
				data.put("code", "0");
				data.put("date", MyDate.dateReduce(1));
				//data.put("date","2013-8-30");
				data.put("countAll", sum);
				List<Map<String, Object>> values = new ArrayList<Map<String,Object>>();
				for(ReportTwo r : datas){
					Map<String, Object> m = new HashMap<String, Object>();
					if(r.getTouristcount() != null){
						m.put("fromProvinceId", r.getProvincesCode());
						m.put("fromProvinceName", r.getProvinces());
						m.put("count", Long.parseLong(r.getTouristcount()));
						m.put("rateToAll",ServletUtils.parsePercent(null,Long.parseLong(r.getTouristcount()),sum));
					}
					values.add(m);
				}
				data.put("value", values);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
				
			} catch (Exception e) {
				e.printStackTrace();
				data.put("code","1");
				data.put("msg",MobileConstants.SYSTEM_ERROR);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			
		}else if(type.equals("9")){//景区客流汇总接口

			
			if(userId==null || userId.equals("")){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			SysOperator curUser = checkUser(userId);
			if(curUser == null){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			try {
				ReportThree parm = new ReportThree();
				if(!curUser.getOrg().getCode().equals("340000")){
					parm.setCityId(curUser.getOrg().getCode());
				}
				parm.setDate(MyDate.getCurrentDate());
				//parm.setDate("2013-12-17");
				String regionIds = getRegionIds(curUser.getUnid());
				if(regionIds != null && !regionIds.equals("")){
					parm.setRegionIds(regionIds);
				}
				List<ReportThree> datas = mobileMgmt.queryByReportThree(parm);
				Long allProvince=0L,inProvince=0L,outProvince=0L;//所有游客，省内游客,省外游客(包括境外游客)
				for(ReportThree r: datas){
					if(r.getType().equals("3")){//1：本地；2：本省外地；3：外省
						outProvince += Long.parseLong(r.getInTourists());
					}else{
						inProvince += Long.parseLong(r.getInTourists());
					}
					allProvince+= Long.parseLong(r.getInTourists());
				}
				data.put("code", "0");
				data.put("allProvince",allProvince);
				data.put("inProvince",inProvince);
				data.put("outProvince",outProvince);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			} catch (Exception e) {
				e.printStackTrace();
				data.put("code","1");
				data.put("msg",MobileConstants.SYSTEM_ERROR);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
		
		}else if(type.equals("10")){//景区游客列表接口

			
			if(userId==null || userId.equals("")){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			SysOperator curUser = checkUser(userId);
			if(curUser == null){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			try {
				ReportThree parm = new ReportThree();
				if(!curUser.getOrg().getCode().equals("340000")){
					parm.setCityId(curUser.getOrg().getCode());
				}
				parm.setDate(MyDate.getCurrentDate());
				//parm.setDate("2013-12-17");
				String regionIds = getRegionIds(curUser.getUnid());
				if(regionIds != null && !regionIds.equals("")){
					parm.setRegionIds(regionIds);
				}
				List<ReportThree> datas = mobileMgmt.queryByReportFour(parm);
				Long countAll = 0L;
				List<Map<String, Object>> value = new ArrayList<Map<String,Object>>();
				for(ReportThree r : datas){//获取总人数
					countAll += Long.parseLong(r.getInTourists());
					
				}
				for(ReportThree r : datas){
					Map<String, Object> v = new HashMap<String, Object>();
					v.put("scenicCode", r.getRegionId());
					v.put("scenicName", r.getRegionName());
					v.put("count", Long.parseLong(r.getInTourists()));
					v.put("rateToAll", ServletUtils.parsePercent(null,Long.parseLong(r.getInTourists()), countAll));
					value.add(v);
				}
				
				data.put("code", "0");
				data.put("date",MyDate.getCurrentDate());
				data.put("countAll",countAll);
				data.put("value",value);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
				
			} catch (Exception e) {
				e.printStackTrace();
				data.put("code","1");
				data.put("msg",MobileConstants.SYSTEM_ERROR);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
		
		}else if(type.equals("11")){//景区实时汇总接口

			if(userId==null || userId.equals("")){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			SysOperator curUser = checkUser(userId);
			if(curUser == null){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			try {
				ReportOne parm = new ReportOne();
				parm.setUserId(curUser.getUnid());
				if(!curUser.getOrg().getCode().equals("340000")){
					parm.setCityId(curUser.getOrg().getCode());
				}
				String regionIds = getRegionIds(curUser.getUnid());
				if(regionIds != null && !regionIds.equals("")){
					parm.setRegionIds(regionIds);
				}
				parm.setDate(MyDate.getCurrentHour());
				List<ReportOne> datas = mobileMgmt.queryByReportFire(parm);
				Long allProvince=0L,inProvince=0L,outProvince=0L;//所有游客，省内游客,省外游客(包括境外游客)
				for(ReportOne r: datas){
					if(r.getType().equals("3")){//1：本地；2：本省外地；3：外省
						outProvince += Long.parseLong(r.getCount());
					}else{
						inProvince += Long.parseLong(r.getCount());
					}
					allProvince+= Long.parseLong(r.getCount());
				}
				data.put("code", "0");
				data.put("allProvince",allProvince);
				data.put("inProvince",inProvince);
				data.put("outProvince",outProvince);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
				
				
			} catch (Exception e) {
				e.printStackTrace();
				data.put("code","1");
				data.put("msg",MobileConstants.SYSTEM_ERROR);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
		
		}else if(type.equals("12")){//预警接口
			if(userId==null || userId.equals("")){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			SysOperator curUser = checkUser(userId);
			if(curUser == null){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			try {
				MobileAlarm parm = new MobileAlarm();
				String page = request.getParameter("page");
				String pagesize = request.getParameter("pagesize");
				String scenicCode = request.getParameter("scenicCode");
				if(scenicCode != null && !scenicCode.equals("-1")){
					parm.setScenicCode(Long.parseLong(scenicCode));
				}
				String time = request.getParameter("time");
				String [] timer = MyDate.getTimes(time);
				parm.setBegTime(timer[0]);
				parm.setEndTime(timer[1]);
				parm.setRegionIds(getRegionIds(userId));
				List<PageCount> pList = mobileMgmt.queryByCount(parm);
				data.put("total", Long.parseLong(pList.get(0).getCount()));

				if(page==null || page.equals("")){
					page="1";
				}
				if(pagesize == null || pagesize.equals("")){
					pagesize=MobileConstants.DEFAUL_PAGESIZE;
				}
				if(page.equals("1")){
					parm.setPageSize(Integer.parseInt(page)*Integer.parseInt(pagesize));
					parm.setPage((Integer.parseInt(page)-1)*Integer.parseInt(pagesize));
					
				}else{
					parm.setPageSize(Integer.parseInt(page)*Integer.parseInt(pagesize));
					parm.setPage((Integer.parseInt(page)-1)*Integer.parseInt(pagesize)+1);
				}
				List<MobileAlarm> datas = mobileMgmt.queryByAlarm(parm);
				List<Map<String, Object>> value = new ArrayList<Map<String,Object>>(); 
				for(MobileAlarm r : datas){
					Map<String, Object> m = new HashMap<String, Object>();
					m.put("warningLogId", r.getId());
					m.put("scenicCode", r.getScenicCode());				
					m.put("scenicName", r.getScenicName());
					m.put("warningLevel", r.getWarningLevel());
					m.put("warningPhone", r.getWarningPhone());
					m.put("waringContent", r.getWarinngContent());
					m.put("warningValue", r.getWarningValue());
					m.put("warningTime", DateUtils.formatDate(r.getWarningTime(), "yyyy-MM-dd HH:mm:ss"));
					m.put("warningName", r.getWarningName());
					m.put("outProvinceCount", r.getOutProvinceCount());
					m.put("allCount", r.getAllCount());
					m.put("inProvinceCount", r.getInProvinceCount());
					value.add(m);
				}
				data.put("code","0");
				data.put("value",value);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
				
			} catch (Exception e) {
				e.printStackTrace();
				data.put("code","1");
				data.put("msg",MobileConstants.SYSTEM_ERROR);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
		}else if(type.equals("13")){//公告列表

			
			if(userId==null || userId.equals("")){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			SysOperator curUser = checkUser(userId);
			if(curUser == null){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			try {
				String time = request.getParameter("time");
				String title = request.getParameter("title");
				String page = request.getParameter("page");
				String pagesize = request.getParameter("pagesize");
				NoticeCfg noticeCfg = new NoticeCfg();
				noticeCfg.setDateStr(time);
				noticeCfg.setNewsTitle(title);
				NoticeCfgMgmt noticeCfgMgmt = (NoticeCfgMgmt)webApplicationContext.getBean("noticeCfgMgmt");
				List<PageCount> pList = noticeCfgMgmt.queryByCount(noticeCfg);
				
				data.put("total", Long.parseLong(pList.get(0).getCount()));

				if(page==null || page.equals("")){
					page="1";
				}
				if(pagesize == null || pagesize.equals("")){
					pagesize=MobileConstants.DEFAUL_PAGESIZE;
				}
				if(page.equals("1")){
					noticeCfg.setPageSize(Integer.parseInt(page)*Integer.parseInt(pagesize));
					noticeCfg.setPage((Integer.parseInt(page)-1)*Integer.parseInt(pagesize));
					
				}else{
					noticeCfg.setPageSize(Integer.parseInt(page)*Integer.parseInt(pagesize));
					noticeCfg.setPage((Integer.parseInt(page)-1)*Integer.parseInt(pagesize)+1);
				}
				List<NoticeCfg> datas = noticeCfgMgmt.queryByAPP(noticeCfg);
				List<Map<String, Object>> value = new ArrayList<Map<String,Object>>(); 
				for(NoticeCfg n : datas){
					Map<String, Object> m = new HashMap<String, Object>();
					m.put("newsTime", DateUtils.formatDate(n.getNewsTime(),"yyyy-MM-dd HH:mm:ss"));
					m.put("newsCode", n.getId());
					m.put("newsTitle", n.getNewsTitle());
					m.put("totalpage", pagesize);
					
					value.add(m);
				}
				data.put("code","0");
				data.put("value",value);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			} catch (Exception e) {
				data.put("code","1");
				data.put("msg",MobileConstants.SYSTEM_ERROR);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
		
			
			
		}else if(type.equals("14")){//公告详情
			

			
			if(userId==null || userId.equals("")){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			SysOperator curUser = checkUser(userId);
			if(curUser == null){
				data.put("code","1");
				data.put("msg",MobileConstants.USER_NOT_MESSAGE);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
			try {
				String newsCode = request.getParameter("newsCode");
				NoticeCfg noticeCfg = new NoticeCfg();
				noticeCfg.setId(Long.parseLong(newsCode));
				NoticeCfgMgmt noticeCfgMgmt = (NoticeCfgMgmt)webApplicationContext.getBean("noticeCfgMgmt");
				List<NoticeCfg> datas = noticeCfgMgmt.queryNoticeCfg(noticeCfg);
				if(datas !=null && datas.size()>0){
					data.put("total", datas.size());
					data.put("cmd", "newsDetail");
					data.put("newsTime", DateUtils.formatDate(datas.get(0).getNewsTime(),"yyyy-MM-dd HH:mm:ss"));
					data.put("newsCode",datas.get(0).getId());
					data.put("newsTitle",datas.get(0).getNewsTitle());
					data.put("newsContent",datas.get(0).getNewsContent());
				}
				data.put("code","0");
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			} catch (Exception e) {
				e.printStackTrace();
				data.put("code","1");
				data.put("msg",MobileConstants.SYSTEM_ERROR);
				out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
				out.close();
				return ;
			}
		
			
		} else{
			

			data.put("code","1");
			data.put("msg","参数出错!");
			out.write(JSONObject.fromObject(data).toString().getBytes("UTF-8"));
			out.close();
			return ;
		
		}
	}

	/**
	 * <p>
	 *	<b>describe:验证是否有userid的用户</b><br>
	 *	 <br>
	 * <b><i>notice:</i></b>
	 *	<ol>
	 *		<li></li>
	 *	</ol>
	 * </p>
	 * @param userId
	 * @return
	 * @author Chen-JY
	 */
	private SysOperator checkUser(String userId){
		SysOperator user = null;
		SysOperatorMgmt sysOperatorMgmt = (SysOperatorMgmt)webApplicationContext.getBean("sysOperatorMgmt");
		try {
			SysOperator userQuery=new SysOperator();
			userQuery.setUnid(userId);
			List<SysOperator> users =  sysOperatorMgmt.querySysOperator(userQuery);
			if(users != null && users.size()>0){
				user =  users.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
		
	}
	/**
	 * <p>
	 *	<b>describe:获取用户关联的景区</b><br>
	 *	 <br>
	 * <b><i>notice:</i></b>
	 *	<ol>
	 *		<li></li>
	 *	</ol>
	 * </p>
	 * @param userid
	 * @return
	 * @author Chen-JY
	 */
	private String getRegionIds(String userid){
		StringBuffer sb = new StringBuffer();
		try {
			
			Region parm = new Region();
			parm.setUserId(userid);
			 MobileMgmt mobileMgmt = (MobileMgmt)webApplicationContext.getBean("mobileMgmt");
			List<Region> regions = mobileMgmt.queryByRegions(parm);
			int i=1;
			for(Region r : regions){
				sb.append(r.getRegionId());
				if(i!=regions.size()){
					sb.append(",");
				}
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
	
	
	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		ServletContext servletContext = this.getServletContext();
		this.webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext);
	}

}
