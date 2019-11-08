package com.funo.regiontype.action;

import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.regiontype.mgmt.IRegionTypeCfgMgmt;
import com.funo.regiontype.model.RegionTypeCfg;
import com.funo.system.model.SysOperator;
import com.funo.utils.Constants;

public class RegionTypeCfgAction extends CommonAction{
	private IRegionTypeCfgMgmt regionTypeCfgMgmt;

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
	 * 获取所有景区类型
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllRegionTypeCfg(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = regionTypeCfgMgmt.queryRegionTypeCfg(new RegionTypeCfg());
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	public ActionResult getAllRegionTypesWithConnect(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			SysOperator user=this.getSessionUser();
			setUserExParams(Constants.TEMP_DB_TYPE, Constants.DB_TYPE_TIS);
			String curCityCode=(String)user.getOtherParams().get(Constants.CUR_CHOOSE_CITY);
			setUserExParams(Constants.TEMP_ORG_CODE, curCityCode);
			result = regionTypeCfgMgmt.queryRegionTypeCfg(new RegionTypeCfg());
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
	 * 根据条件获取景区类型列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getRegionTypeCfgList(RegionTypeCfg regionTypeCfg){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = regionTypeCfgMgmt.queryRegionTypeCfg(regionTypeCfg);
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
	 * 创建景区类型
	 */
	public ActionResult createRegionTypeCfg(RegionTypeCfg regionTypeCfg){
		ActionResult ar=new ActionResult();
		try {
			//regionTypeCfg.setUnid(regionTypeCfgMgmt.getKey());
			regionTypeCfg=regionTypeCfgMgmt.createRegionTypeCfg(regionTypeCfg);
			ar.setReturnObject(regionTypeCfg);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改景区类型
	 */
	public ActionResult updateRegionTypeCfg(RegionTypeCfg regionTypeCfg){
		ActionResult ar=new ActionResult();
		try {
			regionTypeCfg=regionTypeCfgMgmt.modifyRegionTypeCfg(regionTypeCfg);
			ar.setReturnObject(regionTypeCfg);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除景区类型
	 */
	public ActionResult deleteRegionTypeCfg(RegionTypeCfg regionTypeCfg){
		ActionResult ar=new ActionResult();
		try {
			regionTypeCfgMgmt.deleteRegionTypeCfg(regionTypeCfg);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除景区类型
	 */
	public ActionResult batchDeleteRegionTypeCfg(List<RegionTypeCfg> regionTypeCfgList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<regionTypeCfgList.size();i++){
				this.deleteRegionTypeCfg(regionTypeCfgList.get(i));
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
	 * 修改时，验证名称是否已存在
	 * */
	@SuppressWarnings("rawtypes")
	public boolean updateForIsExist(RegionTypeCfg regionTypeCfg){
		boolean boo = false;
		List rs = null;
		try{
			rs = regionTypeCfgMgmt.updateForIsExist(regionTypeCfg);
			if(rs.isEmpty()){
				boo = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boo;
	}
	/**
	 * 插入时，验证名称是否已存在
	 * */
	@SuppressWarnings("rawtypes")
	public boolean insertForIsExist(RegionTypeCfg regionTypeCfg){
		boolean boo = false;
		List rs = null;
		try{
			rs = regionTypeCfgMgmt.insertForIsExist(regionTypeCfg);
			if(rs.isEmpty()){
				boo = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boo;
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