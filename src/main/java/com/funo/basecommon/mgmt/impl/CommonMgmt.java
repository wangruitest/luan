package com.funo.basecommon.mgmt.impl;

import java.util.List;
import java.util.Map;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.basecommon.adapt.ICommonAdapt;
import com.funo.basecommon.mgmt.ICommonMgmt;
import com.funo.basecommon.model.Common;

public class CommonMgmt extends BaseMgmt implements ICommonMgmt {

	private static final long serialVersionUID = 1L;
	private ICommonAdapt commonAdapt;
	
	public ICommonAdapt getCommonAdapt() {
		return commonAdapt;
	}
	public void setCommonAdapt(ICommonAdapt commonAdapt) {
		this.commonAdapt = commonAdapt;
	}

	public String getKey() {
		return commonAdapt.getKey();
	}

	public Common createCommon(Common common) {
		commonAdapt.createCommon(common);
		return common;
	}

	public Common modifyCommon(Common common) {
		commonAdapt.modifyCommon(common);
		return common;
	}

	public void deleteCommon(Common common) {
		commonAdapt.deleteCommon(common);
	}

	public void batchDeleteCommon(List<Common> commonList) {
		commonAdapt.batchDeleteCommon(commonList);
	}

	public Common getCommonById(String commonId) {
		return commonAdapt.getCommonById(commonId);
	}

	public List<Common> queryCommon(Common common) {
		return commonAdapt.queryCommon(common);
	}
	public Map<String,String> queryForMap(){
		return commonAdapt.queryForMap();
	}
	public void updateBySql(Common common){
		commonAdapt.updateBySql(common);
	}
	public void updateBy618Set(Common common){
		commonAdapt.updateBy618Set(common);
	}
	
	/**
	 * 根据Common表的Name查询Common对象
	 * @param key 对应common表的name字段
	 * @return 查询结果Common对象
	 */
	public Common getCommonValueByKey(String key){
		Common result=null;
		try {
			Common qCommon=new Common();
			qCommon.setName(key);
			List<Common> qResult = commonAdapt.queryCommon(qCommon);
			if(null!=qResult && qResult.size()>0){
				result=qResult.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}