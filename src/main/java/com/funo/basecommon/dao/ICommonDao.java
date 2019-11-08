package com.funo.basecommon.dao;

import java.util.Map;

import com.funo.base.dao.CommonDao;
import com.funo.basecommon.model.Common;

public interface ICommonDao extends CommonDao<Common> {
	public Map<String,String> queryForMap();
	public void updateBySql(Common common);
	public void updateBy618Set(Common common);
}