package com.funo.monitor.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.base.vo.Result;
import com.funo.monitor.dao.IMonitorDao;
import com.funo.monitor.adapt.IMonitorAdapt;
import com.funo.monitor.model.Monitor;
import com.funo.monitor.model.MonitorQueryObj;

public class MonitorAdapt extends BaseAdapt implements IMonitorAdapt {

	private static final long serialVersionUID = 1L;
	private IMonitorDao monitorDao;
	
	public IMonitorDao getMonitorDao() {
		return monitorDao;
	}

	public void setMonitorDao(IMonitorDao monitorDao) {
		this.monitorDao = monitorDao;
	}

	public String getKey() {
		return monitorDao.getKey();
	}

	public Monitor createMonitor(Monitor monitor) {
		monitorDao.create(monitor);
		return monitor;
	}

	public Monitor modifyMonitor(Monitor monitor) {
		monitorDao.update(monitor);
		return monitor;
	}

	public void deleteMonitor(Monitor monitor) {
		monitorDao.delete(monitor);
	}

	public void batchDeleteMonitor(List<Monitor> monitorList) {
		monitorDao.batchCreate(monitorList);
	}

	public Monitor getMonitorById(String monitorId) {
		return monitorDao.getById(monitorId);
	}

	public List<Monitor> queryMonitor(Monitor monitor) {
		return monitorDao.queryByArgs(monitor);
	}

	@Override
	public Result<Monitor> pageQueryMonitor(MonitorQueryObj monitorQueryObj) {
		// TODO Auto-generated method stub
		return monitorDao.pageCountByArgs(monitorQueryObj);
	}
	
}