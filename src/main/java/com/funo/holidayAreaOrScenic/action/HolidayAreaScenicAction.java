package com.funo.holidayAreaOrScenic.action;

import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.holidayAreaOrScenic.mgmt.IHolidayAreaScenicMgmt;
import com.funo.holidayAreaOrScenic.model.HolidayAreaScenic;
import com.funo.system.model.SysOperator;

public class HolidayAreaScenicAction extends CommonAction{
	private IHolidayAreaScenicMgmt holidayAreaScenicMgmt;

	public IHolidayAreaScenicMgmt getHolidayAreaScenicMgmt() {
		return holidayAreaScenicMgmt;
	}
	public void setHolidayAreaScenicMgmt(IHolidayAreaScenicMgmt holidayAreaScenicMgmt) {
		this.holidayAreaScenicMgmt = holidayAreaScenicMgmt;
	}
	

	
/**
	 * 获取所有节假日地市数据
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllHolidayAreaScenic(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = holidayAreaScenicMgmt.queryHolidayAreaScenic(new HolidayAreaScenic());
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
	 * 根据条件获取列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getHolidayAreaScenicList(HolidayAreaScenic holidayAreaScenic){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = holidayAreaScenicMgmt.queryHolidayAreaScenic(holidayAreaScenic);
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
	 * 创建
	 */
	public ActionResult createHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic){
		ActionResult ar=new ActionResult();
		try {
			holidayAreaScenic=holidayAreaScenicMgmt.createHolidayAreaScenic(holidayAreaScenic);
			ar.setReturnObject(holidayAreaScenic);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改
	 */
	public ActionResult updateHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic){
		ActionResult ar=new ActionResult();
		try {
			holidayAreaScenic=holidayAreaScenicMgmt.modifyHolidayAreaScenic(holidayAreaScenic);
			ar.setReturnObject(holidayAreaScenic);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除
	 */
	public ActionResult deleteHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic){
		ActionResult ar=new ActionResult();
		try {
			holidayAreaScenicMgmt.deleteHolidayAreaScenic(holidayAreaScenic);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除
	 */
	public ActionResult batchDeleteHolidayAreaScenic(List<HolidayAreaScenic> holidayAreaScenicList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<holidayAreaScenicList.size();i++){
				this.deleteHolidayAreaScenic(holidayAreaScenicList.get(i));
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