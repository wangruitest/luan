package com.funo.monitor.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.base.vo.Result;
import com.funo.monitor.adapt.IMonitorAdapt;
import com.funo.monitor.mgmt.IMonitorMgmt;
import com.funo.monitor.model.Monitor;
import com.funo.monitor.model.MonitorQueryObj;

public class MonitorMgmt extends BaseMgmt implements IMonitorMgmt {

	private static final long serialVersionUID = 1L;
	private IMonitorAdapt monitorAdapt;
	
	public IMonitorAdapt getMonitorAdapt() {
		return monitorAdapt;
	}
	public void setMonitorAdapt(IMonitorAdapt monitorAdapt) {
		this.monitorAdapt = monitorAdapt;
	}

	public String getKey() {
		return monitorAdapt.getKey();
	}

	public Monitor createMonitor(Monitor monitor) {
		monitorAdapt.createMonitor(monitor);
		return monitor;
	}

	public Monitor modifyMonitor(Monitor monitor) {
		monitorAdapt.modifyMonitor(monitor);
		return monitor;
	}

	public void deleteMonitor(Monitor monitor) {
		monitorAdapt.deleteMonitor(monitor);
	}

	public void batchDeleteMonitor(List<Monitor> monitorList) {
		monitorAdapt.batchDeleteMonitor(monitorList);
	}

	public Monitor getMonitorById(String monitorId) {
		return monitorAdapt.getMonitorById(monitorId);
	}

	public List<Monitor> queryMonitor(Monitor monitor) {
		return monitorAdapt.queryMonitor(monitor);
	}
	@Override
	public Result<Monitor> pageQueryMonitor(MonitorQueryObj monitorQueryObj) {
		// TODO Auto-generated method stub
		return monitorAdapt.pageQueryMonitor(monitorQueryObj);
	}
	
}