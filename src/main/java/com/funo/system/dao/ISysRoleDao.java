package com.funo.system.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.system.model.SysRole;
import com.funo.system.model.SysOperator;

public interface ISysRoleDao extends CommonDao<SysRole> {

	public List<SysRole> queryByCurUser(SysOperator user);
}