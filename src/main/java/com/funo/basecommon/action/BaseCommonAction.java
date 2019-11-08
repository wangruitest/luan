package com.funo.basecommon.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.funo.basecommon.mgmt.ICommonMgmt;
import com.funo.basecommon.model.Common;
import com.funo.common.ActionResult;
import com.funo.common.CommonAction;
import com.funo.system.model.SysOperator;
import com.funo.utils.Constants;

public class BaseCommonAction extends CommonAction{
	private ICommonMgmt commonMgmt;

	public ICommonMgmt getCommonMgmt() {
		return commonMgmt;
	}
	public void setCommonMgmt(ICommonMgmt commonMgmt) {
		this.commonMgmt = commonMgmt;
	}
	

	/**
	 * 获取所有?????
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllCommon(){
		ActionResult ar=new ActionResult();
		Common commonparam = new Common();
		try {
			commonparam.setType("OVERALL");
			List<Common> list = commonMgmt.queryCommon(commonparam);
			Map<String,String> map = new HashMap<String,String>();
			for (Common common:list) {
				if ("OVERALL_OUTSMS_QUERY_INTEVAL".equals(common.getName())) {
					Integer hour = Integer.parseInt(common.getValue())/60;
					map.put(common.getName(), hour.toString());
				}else{
					map.put(common.getName(), common.getValue());
				}
			}
			ar.setReturnObject(map);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 获取所有?????
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAll618Common(){
		ActionResult ar=new ActionResult();
		Common commonparam = new Common();
		try {
			commonparam.setType("FZ618");
			List<Common> list = commonMgmt.queryCommon(commonparam);
			Map<String,String> map = new HashMap<String,String>();
			for (Common common:list) {
				map.put(common.getName(), common.getValue());
			}
			ar.setReturnObject(map);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 根据条件获取?????列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getCommonList(Common common){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = commonMgmt.queryCommon(common);
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 获取提交县市数据
	 * @param common
	 * @return
	 */
	public ActionResult getSubmiCountyList(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			Common qCommon=new Common();
			qCommon.setType(Constants.SUBMIT_COUNTY);
			result = commonMgmt.queryCommon(qCommon);
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 根据标识获取Common数据
	 * @param common
	 * @return
	 */
	public ActionResult getCommonByNameAndType(String name,String type){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			Common qCommon=new Common();
			qCommon.setName(name);
			qCommon.setType(type);
			result = commonMgmt.queryCommon(qCommon);
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 创建?????
	 */
	public ActionResult createCommon(Common common){
		ActionResult ar=new ActionResult();
		try {
			common=commonMgmt.createCommon(common);
			ar.setReturnObject(common);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改?????
	 */
	public ActionResult updateCommon(String[] args){
		ActionResult ar=new ActionResult();
		try {
			Common common = new Common();
			common.setName("OVERALL_IS_OUTSMS");
			common.setValue(args[0]);
			commonMgmt.updateBySql(common);
			common.setName("OVERALL_OUTSMS_STARTTIME");
			common.setValue(args[1]);
			commonMgmt.updateBySql(common);
			common.setName("OVERALL_OUTSMS_ENDTIME");
			common.setValue(args[2]);
			commonMgmt.updateBySql(common);
			common.setName("OVERALL_IS_SEND_EARLY_SMS");
			common.setValue(args[3]);
			commonMgmt.updateBySql(common);
			Integer minute = Integer.parseInt(args[4])*60;
			common.setName("OVERALL_OUTSMS_QUERY_INTEVAL");
			common.setValue(minute.toString());
			commonMgmt.updateBySql(common);
			common.setName("OVERALL_TEST_WHITELIST_SWITCH");
			common.setValue(args[5]);
			commonMgmt.updateBySql(common);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改?????
	 */
	public ActionResult update618Common(String[] args){
		ActionResult ar=new ActionResult();
		try {
			Common common = new Common();
			common.setName("FZ618_SMSCOUNT_WORKORDERID");
			common.setValue(args[0]);
			commonMgmt.updateBy618Set(common);
			common.setName("FZ618_FLOW_BEGIN_DATE");
			common.setValue(args[1]);
			commonMgmt.updateBy618Set(common);
			common.setName("FZ618_FLOW_FILTER_ECCODE");
			common.setValue(args[2]);
			commonMgmt.updateBy618Set(common);
			common.setName("FZ618_REFRESH_TIME");
			common.setValue(args[3]);
			commonMgmt.updateBy618Set(common);
			common.setName("FZ618_MONITOR_BEGIN_DATE");
			common.setValue(args[4]);
			commonMgmt.updateBy618Set(common);
			common.setName("FZ618_CHINA_MOBILE_PERCENT");
			common.setValue(args[5]);
			commonMgmt.updateBy618Set(common);
			common.setName("FZ618_FLOW_INFOS_COUNT");
			common.setValue(args[6]);
			commonMgmt.updateBy618Set(common);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除?????
	 */
	public ActionResult deleteCommon(Common common){
		ActionResult ar=new ActionResult();
		try {
			commonMgmt.deleteCommon(common);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除?????
	 */
	public ActionResult batchDeleteCommon(List<Common> commonList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<commonList.size();i++){
				this.deleteCommon(commonList.get(i));
			}
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
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
}