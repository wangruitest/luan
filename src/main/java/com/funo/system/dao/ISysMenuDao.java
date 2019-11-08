package com.funo.system.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.system.model.SysMenu;
import com.funo.system.model.SysOperator;

public interface ISysMenuDao extends CommonDao<SysMenu> {

	public List<SysMenu> queryByCurUser(SysOperator user);
}