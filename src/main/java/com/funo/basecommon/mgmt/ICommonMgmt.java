package com.funo.basecommon.mgmt;

import java.util.List;
import java.util.Map;

import com.funo.basecommon.model.Common;


public interface ICommonMgmt {

	public String getKey();

	public Common createCommon(Common common);

	public Common modifyCommon(Common common);

	public void deleteCommon(Common common);

	public void batchDeleteCommon(List<Common> commonList);

	public Common getCommonById(String unid);

	public List<Common> queryCommon(Common common);
	
	public Map<String,String> queryForMap();
	
	public void updateBySql(Common common);
	public void updateBy618Set(Common common);
	
	public Common getCommonValueByKey(String key);
}