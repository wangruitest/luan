package com.funo.mobile.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.mobile.adapt.IMobileAdapt;
import com.funo.mobile.mgmt.IMobileMgmt;
import com.funo.mobile.model.Mobile;
import com.funo.mobile.model.MobileAlarm;
import com.funo.mobile.model.Region;
import com.funo.mobile.model.ReportOne;
import com.funo.mobile.model.ReportThree;
import com.funo.mobile.model.ReportTwo;
import com.funo.mobile.model.Software;
import com.funo.noticecfg.model.PageCount;

public class MobileMgmt extends BaseMgmt implements IMobileMgmt {

	private static final long serialVersionUID = 1L;
	private IMobileAdapt mobileAdapt;
	
	public IMobileAdapt getMobileAdapt() {
		return mobileAdapt;
	}
	public void setMobileAdapt(IMobileAdapt mobileAdapt) {
		this.mobileAdapt = mobileAdapt;
	}

	public String getKey() {
		return mobileAdapt.getKey();
	}

	public Mobile createMobile(Mobile mobile) {
		mobileAdapt.createMobile(mobile);
		return mobile;
	}

	public Mobile modifyMobile(Mobile mobile) {
		mobileAdapt.modifyMobile(mobile);
		return mobile;
	}

	public void deleteMobile(Mobile mobile) {
		mobileAdapt.deleteMobile(mobile);
	}

	public void batchDeleteMobile(List<Mobile> mobileList) {
		mobileAdapt.batchDeleteMobile(mobileList);
	}

	public Mobile getMobileById(String mobileId) {
		return mobileAdapt.getMobileById(mobileId);
	}

	public List<Mobile> queryMobile(Mobile mobile) {
		return mobileAdapt.queryMobile(mobile);
	}
	@Override
	public List<Region> queryByRegions(Region region) {
		// TODO Auto-generated method stub
		return mobileAdapt.queryByRegions(region);
	}
	@Override
	public List<Software> queryBySoftware() {
		// TODO Auto-generated method stub
		return mobileAdapt.queryBySoftware();
	}
	@Override
	public List<ReportOne> queryByReportOneTah(ReportOne reportOne) {
		// TODO Auto-generated method stub
		return mobileAdapt.queryByReportOneTah(reportOne);
	}
	@Override
	public List<ReportTwo> queryByReportTwo(ReportTwo reportTwo) {
		// TODO Auto-generated method stub
		return mobileAdapt.queryByReportTwo(reportTwo);
	}
	@Override
	public List<ReportThree> queryByReportThree(ReportThree reportThree) {
		// TODO Auto-generated method stub
		return mobileAdapt.queryByReportThree(reportThree);
	}
	@Override
	public List<ReportThree> queryByReportFour(ReportThree reportThree) {
		// TODO Auto-generated method stub
		return mobileAdapt.queryByReportFour(reportThree);
	}
	@Override
	public List<ReportOne> queryByReportFire(ReportOne reportOne) {
		// TODO Auto-generated method stub
		return mobileAdapt.queryByReportFire(reportOne);
	}
	@Override
	public List<MobileAlarm> queryByAlarm(MobileAlarm mobileAlarm) {
		// TODO Auto-generated method stub
		return mobileAdapt.queryByAlarm(mobileAlarm);
	}
	@Override
	public List<PageCount> queryByCount(MobileAlarm mobileAlarm) {
		// TODO Auto-generated method stub
		return mobileAdapt.queryByCount(mobileAlarm);
	}
	
}