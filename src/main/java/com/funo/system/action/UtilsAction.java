package com.funo.system.action;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import com.funo.base.other.BusinessException;
import com.funo.business.mgmt.IBusinessMgmt;
import com.funo.business.model.Business;
import com.funo.businessregioncfg.mgmt.IBusinessRegionCfgMgmt;
import com.funo.businessregioncfg.model.BusinessRegionCfg;
import com.funo.common.ActionResult;
import com.funo.common.CommonAction;
import com.funo.common.CommonMethod;
import com.funo.holiday.mgmt.IHolidayMgmt;
import com.funo.holiday.model.Holiday;
import com.funo.region.mgmt.IRegionCfgMgmt;
import com.funo.region.model.RegionCfg;
import com.funo.regiontype.mgmt.IRegionTypeCfgMgmt;
import com.funo.regiontype.model.RegionTypeCfg;
import com.funo.roleregioncfg.mgmt.IRoleRegionCfgMgmt;
import com.funo.roleregioncfg.model.RoleRegionCfg;
import com.funo.system.mgmt.ISysOperatorMgmt;
import com.funo.system.model.SysOperator;
import com.funo.userbusinesscfg.mgmt.IUserBusinessCfgMgmt;
import com.funo.utils.ApplicationContext;
import com.funo.utils.Constants;
import com.funo.utils.DateUtils;
import com.funo.utils.Md5PwdEncoder;
import com.funo.utils.SessionOutException;

public class UtilsAction extends CommonAction{
	
	private IRegionCfgMgmt regionCfgMgmt;
	private IRegionTypeCfgMgmt regionTypeCfgMgmt;
	private IUserBusinessCfgMgmt userBusinessCfgMgmt;
	private IRoleRegionCfgMgmt roleRegionCfgMgmt;
	private IBusinessMgmt businessMgmt;
	private IBusinessRegionCfgMgmt businessRegionCfgMgmt;
	private ISysOperatorMgmt sysOperatorMgmt;
	private IHolidayMgmt holidayMgmt;

	public IHolidayMgmt getHolidayMgmt() {
		return holidayMgmt;
	}
	public void setHolidayMgmt(IHolidayMgmt holidayMgmt) {
		this.holidayMgmt = holidayMgmt;
	}

	
	public ISysOperatorMgmt getSysOperatorMgmt() {
		return sysOperatorMgmt;
	}
	public void setSysOperatorMgmt(ISysOperatorMgmt sysOperatorMgmt) {
		this.sysOperatorMgmt = sysOperatorMgmt;
	}
	public IBusinessRegionCfgMgmt getBusinessRegionCfgMgmt() {
		return businessRegionCfgMgmt;
	}
	public void setBusinessRegionCfgMgmt(
			IBusinessRegionCfgMgmt businessRegionCfgMgmt) {
		this.businessRegionCfgMgmt = businessRegionCfgMgmt;
	}
	public IBusinessMgmt getBusinessMgmt() {
		return businessMgmt;
	}
	public void setBusinessMgmt(IBusinessMgmt businessMgmt) {
		this.businessMgmt = businessMgmt;
	}
	public IUserBusinessCfgMgmt getUserBusinessCfgMgmt() {
		return userBusinessCfgMgmt;
	}
	public void setUserBusinessCfgMgmt(IUserBusinessCfgMgmt userBusinessCfgMgmt) {
		this.userBusinessCfgMgmt = userBusinessCfgMgmt;
	}
	public IRoleRegionCfgMgmt getRoleRegionCfgMgmt() {
		return roleRegionCfgMgmt;
	}
	public void setRoleRegionCfgMgmt(IRoleRegionCfgMgmt roleRegionCfgMgmt) {
		this.roleRegionCfgMgmt = roleRegionCfgMgmt;
	}

	public IRegionCfgMgmt getRegionCfgMgmt() {
		return regionCfgMgmt;
	}
	public void setRegionCfgMgmt(IRegionCfgMgmt regionCfgMgmt) {
		this.regionCfgMgmt = regionCfgMgmt;
	}
	
	public IRegionTypeCfgMgmt getRegionTypeCfgMgmt() {
		return regionTypeCfgMgmt;
	}
	public void setRegionTypeCfgMgmt(IRegionTypeCfgMgmt regionTypeCfgMgmt) {
		this.regionTypeCfgMgmt = regionTypeCfgMgmt;
	}
	
	private boolean setUserExParams(String key,String value){
		boolean result=true;
		try{
			SysOperator user=this.getSessionUser();
			user.getOtherParams().put(key, value);
		}catch(Exception e){
			result=false;
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 用户切换地市
	 * @param areaCode 地市
	 * @return
	 */
	public ActionResult changeToCity(String areaCode){
		ActionResult ar=new ActionResult();
		try{
			HttpSession session = CommonMethod.filtDwrSession(null);
			setUserExParams(Constants.CUR_CHOOSE_CITY, areaCode);
			ar.setResultCode(0);
		}catch(Exception e){
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 获取当前用户能够查看到的地市数据范围
	 * @return
	 */
	public ActionResult getMyOrgs(){
		ActionResult result=new ActionResult();
		try{
			SysOperator user=this.getSessionUser();
			if(null==user){
				throw new SessionOutException(Constants.sessionOutMsg);
			}
			List myOrgs=new ArrayList();
			if(null!=user.getChildOrgs()){
				myOrgs.addAll(user.getChildOrgs());
			}
			if(myOrgs.size()==0)myOrgs.add(user.getOrg());
			result.setResultCode(0);
			result.setReturnList(myOrgs);
		}catch(Exception e){
			result.setResultCode(-1);
			result.setResultMessage(e.getMessage());
		}
		return result;
	}
	
	/**
	 * 通过景区配置获取当前用户能够查看到的地市
	 * @return
	 */
	public ActionResult getMyCitycode(){
		ActionResult result=new ActionResult();
		SysOperator user=this.getSessionUser();
		if(null==user){
			throw new SessionOutException(Constants.sessionOutMsg);
		}
		try{
			String businessidStr = getBusinessIdFromUser();
//			setUserExParams(Constants.TEMP_DB_TYPE, Constants.DB_TYPE_CSMS);
//			setUserExParams(Constants.TEMP_ORG_CODE, Constants.DS_CODE_ALL);
			BusinessRegionCfg businessRegionCfg = new BusinessRegionCfg();
			businessRegionCfg.setBusinessidStr(businessidStr);
			List businessRegionCfgList = businessRegionCfgMgmt.queryBusinessRegionForCityCfg(businessRegionCfg);
			result.setResultCode(0);
			result.setReturnList(businessRegionCfgList);
		}catch(Exception e){
			result.setResultCode(-1);
			result.setResultMessage(e.getMessage());
		}
		return result;
	}
	
	
	/**
	 * 根据当前组织的编码和景区类型到相应地市数据库中获取景区信息
	 * @return
	 */
	public ActionResult getMyRegionCfgByOrgCode(String orgCode,String regionType){
		ActionResult result=new ActionResult();
		SysOperator user=this.getSessionUser();
		if(null==user){
			throw new SessionOutException(Constants.sessionOutMsg);
		}
		try{
			String businessIdStr = getBusinessIdFromUser();
			System.out.println("----------------------->businessIdStr:"+businessIdStr);
			HttpSession session = CommonMethod.filtDwrSession(null);
			String curOrgCode=user.getOrg().getCode();
			String userUnid=user.getUnid();
			if(StringUtils.isEmpty(orgCode)){
				orgCode=curOrgCode;
			}
			setUserExParams(Constants.TEMP_DB_TYPE, Constants.DB_TYPE_CSMS);
			setUserExParams(Constants.TEMP_ORG_CODE, Constants.DS_CODE_ALL);
			RegionCfg qRegionCfg=new RegionCfg();
			if(StringUtils.isNotEmpty(regionType)){
				qRegionCfg.setTypeid(regionType);
			}
			if(StringUtils.isNotEmpty(orgCode)){
				qRegionCfg.setCityCode(orgCode);
			}
			qRegionCfg.setBusinessidStr(businessIdStr);
			//List regionCfgList=regionCfgMgmt.queryRegionCfg(qRegionCfg);
			List regionCfgList=null;
			if(orgCode=="-1"||orgCode.equals("-1")){
				regionCfgList=regionCfgMgmt.queryByUserOfCities(qRegionCfg);
			}else{
				regionCfgList=regionCfgMgmt.queryRegionCfgOfcityUser(qRegionCfg);
			}
			System.out.println("返回的景区列表："+regionCfgList);
			result.setReturnList(regionCfgList);
			result.setResultCode(0);
		}catch(Exception e){
			System.out.println(e.getMessage());
			result.setResultCode(-1);
			result.setResultMessage(e.getMessage());
		}
		return result;
	}
	
	/**
	 * 根据当前组织的编码和景区类型到相应地市数据库中获取景区信息
	 * @return
	 */
	public ActionResult getMyRegionCfgByCounty(String orgCode,String regionType){
		ActionResult result=new ActionResult();
		SysOperator user=this.getSessionUser();
		if(null==user){
			throw new SessionOutException(Constants.sessionOutMsg);
		}
		try{
			String businessIdStr = getBusinessIdFromUser();
			System.out.println("----------------------->businessIdStr:"+businessIdStr);
			HttpSession session = CommonMethod.filtDwrSession(null);
			String curOrgCode=user.getCountyCode();
			String userUnid=user.getUnid();
			if(StringUtils.isEmpty(orgCode)){
				orgCode=curOrgCode;
			}
			setUserExParams(Constants.TEMP_DB_TYPE, Constants.DB_TYPE_CSMS);
			setUserExParams(Constants.TEMP_ORG_CODE, Constants.DS_CODE_ALL);
			RegionCfg qRegionCfg=new RegionCfg();
			if(regionType != null){
				qRegionCfg.setaLevel(Long.parseLong(regionType));
			}
			if(StringUtils.isNotEmpty(orgCode)){
				qRegionCfg.setCountyCode(orgCode);
			}
			qRegionCfg.setBusinessidStr(businessIdStr);
			//List regionCfgList=regionCfgMgmt.queryRegionCfg(qRegionCfg);
			List regionCfgList=null;
			if(orgCode=="-1"||orgCode.equals("-1")){
				regionCfgList=regionCfgMgmt.queryByUserOfCounty(qRegionCfg);
			}else{
				regionCfgList=regionCfgMgmt.queryByUserOfCounty(qRegionCfg);
			}
			System.out.println("返回的景区列表："+regionCfgList);
			result.setReturnList(regionCfgList);
			result.setResultCode(0);
		}catch(Exception e){
			result.setResultCode(-1);
			System.out.println(e.getMessage());
			result.setResultMessage(e.getMessage());
		}
		return result;
	}
	
	/**
	 * 根据当前组织的编码和景区类型到相应地市数据库中获取景区信息
	 * @return
	 */
	public ActionResult getMyRegionCfgByOrgCodes(String orgCodes,String regionType){
		ActionResult result=new ActionResult();
		SysOperator user=this.getSessionUser();
		if(null==user){
			throw new SessionOutException(Constants.sessionOutMsg);
		}
		try{
			String businessIdStr = getBusinessIdFromUser();
			HttpSession session = CommonMethod.filtDwrSession(null);
			String curOrgCode=user.getOrg().getCode();
			String userUnid=user.getUnid();
			if(StringUtils.isEmpty(orgCodes)){
				orgCodes=curOrgCode;
			}
			setUserExParams(Constants.TEMP_DB_TYPE, Constants.DB_TYPE_CSMS);
			setUserExParams(Constants.TEMP_ORG_CODE, Constants.DS_CODE_ALL);
			RegionCfg qRegionCfg=new RegionCfg();
			if(StringUtils.isNotEmpty(regionType)){
				qRegionCfg.setTypeid(regionType);
			}
			if(StringUtils.isNotEmpty(orgCodes)){
				qRegionCfg.setCityCode(orgCodes);
			}
			qRegionCfg.setBusinessidStr(businessIdStr);
			//List regionCfgList=regionCfgMgmt.queryRegionCfg(qRegionCfg);
			List regionCfgList=regionCfgMgmt.queryByUserOfCities(qRegionCfg);
			result.setReturnList(regionCfgList);
			result.setResultCode(0);
		}catch(Exception e){
			result.setResultCode(-1);
			result.setResultMessage(e.getMessage());
		}
		return result;
	}
	
	/**
	 * 获取当前用户景区类型
	 * @return
	 */
	public ActionResult getMyRegionCfgType(String orgCode){
		ActionResult result=new ActionResult();
		SysOperator user=this.getSessionUser();
		if(null==user){
			throw new SessionOutException(Constants.sessionOutMsg);
		}
		try{
			HttpSession session = CommonMethod.filtDwrSession(null);
			String curOrgCode=user.getOrg().getCode();
			if(StringUtils.isEmpty(orgCode)){
				orgCode=curOrgCode;
			}
			RegionTypeCfg qReginType=new RegionTypeCfg();
			if(StringUtils.isNotEmpty(orgCode)){
				qReginType.setCityCode(orgCode);
			}
			
			setUserExParams(Constants.TEMP_DB_TYPE, Constants.DB_TYPE_CSMS);
			setUserExParams(Constants.TEMP_ORG_CODE, Constants.DS_CODE_ALL);
			List regionCfgTypeList=regionTypeCfgMgmt.queryRegionTypeCfg(qReginType);
			result.setReturnList(regionCfgTypeList);
			result.setResultCode(0);
		}catch(Exception e){
			result.setResultCode(-1);
			result.setResultMessage(e.getMessage());
		}
		return result;
	}

	/**
	 * 通过Session获取用户信息
	 */
	public SysOperator getSessionUser(){
		SysOperator user=super.getSessionUser();
		if(user==null){
			user=new SysOperator();
			user.setUnid("0");
			user.setName("超级管理员");
		}
		return user;
	}
	
	/**
	 * 通过登入用户获取关联商户id
	 */
	public String getBusinessIdFromUser(){
		String businessIdStr = "";
		SysOperator user=this.getSessionUser();
		if(null==user){
			throw new SessionOutException(Constants.sessionOutMsg);
		}
		try{
			HttpSession session = CommonMethod.filtDwrSession(null);
			String userUnid=user.getUnid();
			List<Business> businessList = userBusinessCfgMgmt.queryByUserId(userUnid);
			if(null!=businessList && businessList.size()>0){
				for(int i=0;i<businessList.size();i++){
					businessIdStr += String.valueOf(businessList.get(i).getBusinessid());
					if(i<businessList.size()-1){
						businessIdStr += ",";
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return businessIdStr;
	}
	
	public Business getBusinessFromUser(){
		SysOperator user=this.getSessionUser();
		if(null==user){
			throw new SessionOutException(Constants.sessionOutMsg);
		}
		try{
			HttpSession session = CommonMethod.filtDwrSession(null);
			String userUnid=user.getUnid();
			List<Business> businessList = userBusinessCfgMgmt.queryByUserId(userUnid);
			if(null!=businessList && businessList.size()>0){
				return businessList.get(0);
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return null;
	}
	
	public String getCurDate(){
		return DateUtils.getCurrentTime();
	} 
	
	public String loginEditPassword(String oldpassword, String newpassword) {
		String errmesg = "";
		try {
			Md5PwdEncoder pwdEncoder=new Md5PwdEncoder();
			SysOperator user=this.getSessionUser();
			String password = user.getPassword();
			if(pwdEncoder.encodePassword(oldpassword).equals(password)){
				if(6<=newpassword.length()){
					Pattern pattern = Pattern.compile("^[A-Za-z0-9]+$");
					Pattern patternNum = Pattern.compile("[0-9]*");
					Pattern patternTest = Pattern.compile("^[A-Za-z]+$");
					if(patternNum.matcher(newpassword).matches()){
						return "密码格式为6位以上数字加字母！";
					}
					if(patternTest.matcher(newpassword).matches()){
						return "密码格式为6位以上数字加字母！";
					}
					pattern.matcher(newpassword).matches();
					if(pattern.matcher(newpassword).matches()){
						user.setPassword(newpassword);
						SysOperator sysOperators = sysOperatorMgmt.modifySysOperator(user);
					}
				}else{
					return "密码需要六位以上！";
				}
			}else{
				return "原密码错误！";
			}
			return "true";
		} catch (BusinessException e) {
			e.printStackTrace();
			errmesg = e.getMessage();
			return errmesg;
		}
	}
//	@SuppressWarnings({ "rawtypes", "unchecked" })
//	public ActionResult getAllHolidayList(){
//		ActionResult result=new ActionResult();
////		List result=null;
//		try {
//			Holiday holiday = new Holiday();
//			holiday.setStatus(1L);//查询状态为有效的holiday
//			List holidayList = holidayMgmt.queryHoliday(holiday);
//			result.setReturnList(holidayList);
//			result.setResultCode(0);
//		} catch (Exception e) {
//			e.printStackTrace();
//			result.setResultCode(-1);
//			result.setResultMessage(e.getMessage());
//		}
//		return result;
//	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getHolidayById(Long id){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			Holiday holiday = new Holiday();
			holiday.setId(id);
			result = holidayMgmt.queryHoliday(holiday);
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	public ActionResult getProvince(){
		ActionResult result=new ActionResult();
		SysOperator user=this.getSessionUser();
		if(null==user){
			throw new SessionOutException(Constants.sessionOutMsg);
		}
		try{
			List provinceList=null;
			provinceList=regionCfgMgmt.queryByOtherOfProvince();
			System.out.println("返回的外省省份："+provinceList);
			result.setReturnList(provinceList);
			result.setResultCode(0);
		}catch(Exception e){
			result.setResultCode(-1);
			System.out.println(e.getMessage());
			result.setResultMessage(e.getMessage());
		}
		return result;
	}
}