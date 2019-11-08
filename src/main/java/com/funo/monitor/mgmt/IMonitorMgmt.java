package com.funo.monitor.mgmt;

import java.util.List;

import com.funo.base.vo.Result;
import com.funo.monitor.model.Monitor;
import com.funo.monitor.model.MonitorQueryObj;


public interface IMonitorMgmt {

	public String getKey();

	public Monitor createMonitor(Monitor monitor);

	public Monitor modifyMonitor(Monitor monitor);

	public void deleteMonitor(Monitor monitor);

	public void batchDeleteMonitor(List<Monitor> monitorList);

	public Monitor getMonitorById(String unid);

	public List<Monitor> queryMonitor(Monitor monitor);
	
	public Result<Monitor> pageQueryMonitor(MonitorQueryObj monitorQueryObj);

}