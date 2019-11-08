package com.funo.mobile.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.mobile.dao.IMobileDao;
import com.funo.mobile.adapt.IMobileAdapt;
import com.funo.mobile.model.Mobile;
import com.funo.mobile.model.MobileAlarm;
import com.funo.mobile.model.Region;
import com.funo.mobile.model.ReportOne;
import com.funo.mobile.model.ReportThree;
import com.funo.mobile.model.ReportTwo;
import com.funo.mobile.model.Software;
import com.funo.noticecfg.model.PageCount;

public class MobileAdapt extends BaseAdapt implements IMobileAdapt {

	private static final long serialVersionUID = 1L;
	private IMobileDao mobileDao;
	
	public IMobileDao getMobileDao() {
		return mobileDao;
	}

	public void setMobileDao(IMobileDao mobileDao) {
		this.mobileDao = mobileDao;
	}

	public String getKey() {
		return mobileDao.getKey();
	}

	public Mobile createMobile(Mobile mobile) {
		mobileDao.create(mobile);
		return mobile;
	}

	public Mobile modifyMobile(Mobile mobile) {
		mobileDao.update(mobile);
		return mobile;
	}

	public void deleteMobile(Mobile mobile) {
		mobileDao.delete(mobile);
	}

	public void batchDeleteMobile(List<Mobile> mobileList) {
		mobileDao.batchCreate(mobileList);
	}

	public Mobile getMobileById(String mobileId) {
		return mobileDao.getById(mobileId);
	}

	public List<Mobile> queryMobile(Mobile mobile) {
		return mobileDao.queryByArgs(mobile);
	}

	@Override
	public List<Region> queryByRegions(Region region) {
		return mobileDao.queryByRegions(region);
	}

	@Override
	public List<Software> queryBySoftware() {
		// TODO Auto-generated method stub
		return mobileDao.queryBySoftware();
	}

	@Override
	public List<ReportOne> queryByReportOneTah(ReportOne reportOne) {
		// TODO Auto-generated method stub
		return mobileDao.queryByReportOneTah(reportOne);
	}

	@Override
	public List<ReportTwo> queryByReportTwo(ReportTwo reportTwo) {
		// TODO Auto-generated method stub
		return mobileDao.queryByReportTwo(reportTwo);
	}

	@Override
	public List<ReportThree> queryByReportThree(ReportThree reportThree) {
		// TODO Auto-generated method stub
		return mobileDao.queryByReportThree(reportThree);
	}

	@Override
	public List<ReportThree> queryByReportFour(ReportThree reportThree) {
		// TODO Auto-generated method stub
		return mobileDao.queryByReportFour(reportThree);
	}

	@Override
	public List<ReportOne> queryByReportFire(ReportOne reportOne) {
		// TODO Auto-generated method stub
		return mobileDao.queryByReportFire(reportOne);
	}

	@Override
	public List<MobileAlarm> queryByAlarm(MobileAlarm mobileAlarm) {
		// TODO Auto-generated method stub
		return mobileDao.queryByAlarm(mobileAlarm);
	}

	@Override
	public List<PageCount> queryByCount(MobileAlarm mobileAlarm) {
		// TODO Auto-generated method stub
		return mobileDao.queryByCount(mobileAlarm);
	}
	
}