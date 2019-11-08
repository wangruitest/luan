package com.funo.industry.action;

import java.util.List;

import com.funo.business.mgmt.IBusinessMgmt;
import com.funo.business.model.Business;
import com.funo.common.ActionResult;
import com.funo.common.CommonAction;
import com.funo.industry.mgmt.IIndustryMgmt;
import com.funo.industry.model.Industry;
import com.funo.system.model.SysOperator;

public class IndustryAction extends CommonAction{
	private IIndustryMgmt industryMgmt;
	
	private IBusinessMgmt businessMgmt;
	
	public IIndustryMgmt getIndustryMgmt() {
		return industryMgmt;
	}
	public void setIndustryMgmt(IIndustryMgmt industryMgmt) {
		this.industryMgmt = industryMgmt;
	}
	public IBusinessMgmt getBusinessMgmt() {
		return businessMgmt;
	}
	public void setBusinessMgmt(IBusinessMgmt businessMgmt) {
		this.businessMgmt = businessMgmt;
	}
	/**
	 * 获取所有行业类型表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllIndustry(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = industryMgmt.queryIndustry(new Industry());
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
	 * 根据条件获取行业类型表列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getIndustryList(Industry industry){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = industryMgmt.queryIndustry(industry);
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
	 * 创建行业类型表
	 */
	public ActionResult createIndustry(Industry industry){
		ActionResult ar=new ActionResult();
		try {
			//industry.setUnid(industryMgmt.getKey());
			industry=industryMgmt.createIndustry(industry);
			ar.setReturnObject(industry);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改行业类型表
	 */
	public ActionResult updateIndustry(Industry industry){
		ActionResult ar=new ActionResult();
		try {
			industry=industryMgmt.modifyIndustry(industry);
			ar.setReturnObject(industry);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除行业类型表
	 */
	public Boolean deleteIndustry(Industry industry){
		ActionResult ar=new ActionResult();
		try {
			if(!isExistIdtIdInBsns(industry)){
				return false;
			}
			industryMgmt.deleteIndustry(industry);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
			return false;
		}
		return true;
	}
	
	/**
	 * 批量删除行业类型表
	 */
	public ActionResult batchDeleteIndustry(List<Industry> industryList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<industryList.size();i++){
				if(!this.deleteIndustry(industryList.get(i))){
					ar.setResultMessage("该行业类型正在使用中，不能删除");
					ar.setResultCode(-1);
					return ar;
				}
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
	/**
	 * 新增判断是否重名
	 */
	@SuppressWarnings("rawtypes")
	public boolean queryByInsertIsExist(Industry industry){
		boolean boo = false;
		List rs = null;
		try{
			rs = industryMgmt.queryByInsertIsExist(industry);
			if(rs.isEmpty()){
				boo = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boo;
	}
	/**
	 * 修改判断是否重名
	 */
	@SuppressWarnings("rawtypes")
	public boolean queryByUpdateIsExist(Industry industry){
		boolean boo = false;
		List rs = null;
		try{
			rs = industryMgmt.queryByUpdateIsExist(industry);
			if(rs.isEmpty()){
				boo = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boo;
	}
	/**
	 * 删除时判断是否正在使用
	 */
	@SuppressWarnings("rawtypes")
	public boolean isExistIdtIdInBsns(Industry industry){
		//判断该行业类型是否在使用
		boolean boo = false;
		List rs = null;
		try{
			Business bu = new Business();
			bu.setIndustryid(industry.getIndustryid());
			rs = businessMgmt.queryBusiness(bu);
			if(rs.isEmpty()){
				boo = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boo;
	}
}