package com.funo.jqykjd.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.jqykjd.dao.IJqykjdDao;
import com.funo.jqykjd.adapt.IJqykjdAdapt;
import com.funo.jqykjd.model.Jqykjd;
import com.funo.jqykjd.model.Srykzs;
import com.funo.jqykjd.model.Ydtj;
import com.funo.jqykjd.model.YdtjBt;
import com.funo.jqykjd.model.Ysjfx;

public class JqykjdAdapt extends BaseAdapt implements IJqykjdAdapt {

	private static final long serialVersionUID = 1L;
	private IJqykjdDao jqykjdDao;
	
	public IJqykjdDao getJqykjdDao() {
		return jqykjdDao;
	}

	public void setJqykjdDao(IJqykjdDao jqykjdDao) {
		this.jqykjdDao = jqykjdDao;
	}

	public String getKey() {
		return jqykjdDao.getKey();
	}

	public Jqykjd createJqykjd(Jqykjd jqykjd) {
		jqykjdDao.create(jqykjd);
		return jqykjd;
	}

	public Jqykjd modifyJqykjd(Jqykjd jqykjd) {
		jqykjdDao.update(jqykjd);
		return jqykjd;
	}

	public void deleteJqykjd(Jqykjd jqykjd) {
		jqykjdDao.delete(jqykjd);
	}

	public void batchDeleteJqykjd(List<Jqykjd> jqykjdList) {
		jqykjdDao.batchCreate(jqykjdList);
	}

	public Jqykjd getJqykjdById(String jqykjdId) {
		return jqykjdDao.getById(jqykjdId);
	}

	public List<Jqykjd> queryJqykjd(Jqykjd jqykjd) {
		return jqykjdDao.queryByArgs(jqykjd);
	}
	
	public List<Ysjfx> queryByjdtj(Ysjfx ysjfx){
		return jqykjdDao.queryByjdtj(ysjfx);
	}

	@Override
	public List<Ydtj> queryByydtj(Ydtj ydtj) {
		
		return jqykjdDao.queryByydtj(ydtj);
	}

	@Override
	public List<YdtjBt> queryByydtjBt(YdtjBt ydtjBt) {
		return jqykjdDao.queryByydtjBt(ydtjBt);
	}

	@Override
	public List<YdtjBt> queryByndtjBt(YdtjBt ydtjBt) {
		return jqykjdDao.queryByndtjBt(ydtjBt);
	}

	@Override
	public List<Ysjfx> queryByndtj(Ysjfx ysjfx) {
		// TODO Auto-generated method stub
		return jqykjdDao.queryByndtj(ysjfx);
	}

	@Override
	public List<Ydtj> queryByNdtjqx(Ydtj ydtj) {
		// TODO Auto-generated method stub
		return jqykjdDao.queryByNdtjqx(ydtj);
	}

	@Override
	public List<Srykzs> queryBySrykzs() {
		// TODO Auto-generated method stub
		return jqykjdDao.queryBySrykzs();
	}

	
	@Override
	public List<Ysjfx> queryByProDayReal(String date) {
		// TODO Auto-generated method stub
		return jqykjdDao.queryByProDayReal(date);
	}
	@Override
	public List<Jqykjd> queryByWeather(Jqykjd jqykjd) {
		// TODO Auto-generated method stub
		return jqykjdDao.queryByWeather(jqykjd);
	}

	@Override
	public List<Jqykjd> queryByCount() {
		// TODO Auto-generated method stub
		return jqykjdDao.queryByCount();
	}

	@Override
	public List<Ydtj> queryByydtjToTourist(Ydtj ydtj) {
		// TODO Auto-generated method stub
		return jqykjdDao.queryByydtjToTourist(ydtj);
	}

	/* (non-Javadoc)
	 * @see com.funo.jqykjd.adapt.IJqykjdAdapt#queryByAllDay(java.lang.String, java.lang.String)
	 */
	@Override
	public List<Ysjfx> queryByProDayAll(String sdate, String edate) {
		// TODO Auto-generated method stub
		return jqykjdDao.queryByProDayAll(sdate);
	}

	@Override
	public List<YdtjBt> queryByndtjBt2(YdtjBt ydtjBt) {
		return jqykjdDao.queryByndtjBt2(ydtjBt);
	}

	@Override
	public List<Ydtj> queryByNdtjLkqx(Ydtj ydtj) {
		return jqykjdDao.queryByNdtjLkqx(ydtj);
	}

	

//	@Override
//	public List<Ydtj> queryByNdtjLkqx(Ydtj ydtj) {
//		return jqykjdDao.queryByNdtjLkqx(ydtj);
//	}



	
}