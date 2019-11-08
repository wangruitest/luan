package com.funo.mobile.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.mobile.model.Mobile;
import com.funo.mobile.model.MobileAlarm;
import com.funo.mobile.model.Region;
import com.funo.mobile.model.ReportOne;
import com.funo.mobile.model.ReportThree;
import com.funo.mobile.model.ReportTwo;
import com.funo.mobile.model.Software;
import com.funo.noticecfg.model.PageCount;

public interface IMobileDao extends CommonDao<Mobile> {

	public List<Region> queryByRegions(Region region);
	
	public List<Software> queryBySoftware();
	
	public List<ReportOne> queryByReportOneTah(ReportOne reportOne);
	
	public List<ReportTwo> queryByReportTwo(ReportTwo reportTwo);
	
	public List<ReportThree> queryByReportThree(ReportThree reportThree);
	
	
	public List<ReportThree> queryByReportFour(ReportThree reportThree);
	
	public List<ReportOne> queryByReportFire(ReportOne reportOne);
	
	public List<MobileAlarm> queryByAlarm(MobileAlarm mobileAlarm);
	
	public List<PageCount> queryByCount(MobileAlarm mobileAlarm);
}