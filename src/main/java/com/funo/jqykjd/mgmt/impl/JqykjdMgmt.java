package com.funo.jqykjd.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.jqykjd.adapt.IJqykjdAdapt;
import com.funo.jqykjd.mgmt.IJqykjdMgmt;
import com.funo.jqykjd.model.Jqykjd;
import com.funo.jqykjd.model.Srykzs;
import com.funo.jqykjd.model.Ydtj;
import com.funo.jqykjd.model.YdtjBt;
import com.funo.jqykjd.model.Ysjfx;

public class JqykjdMgmt extends BaseMgmt implements IJqykjdMgmt {

	private static final long serialVersionUID = 1L;
	private IJqykjdAdapt jqykjdAdapt;
	
	public IJqykjdAdapt getJqykjdAdapt() {
		return jqykjdAdapt;
	}
	public void setJqykjdAdapt(IJqykjdAdapt jqykjdAdapt) {
		this.jqykjdAdapt = jqykjdAdapt;
	}

	public String getKey() {
		return jqykjdAdapt.getKey();
	}

	public Jqykjd createJqykjd(Jqykjd jqykjd) {
		jqykjdAdapt.createJqykjd(jqykjd);
		return jqykjd;
	}

	public Jqykjd modifyJqykjd(Jqykjd jqykjd) {
		jqykjdAdapt.modifyJqykjd(jqykjd);
		return jqykjd;
	}

	public void deleteJqykjd(Jqykjd jqykjd) {
		jqykjdAdapt.deleteJqykjd(jqykjd);
	}

	public void batchDeleteJqykjd(List<Jqykjd> jqykjdList) {
		jqykjdAdapt.batchDeleteJqykjd(jqykjdList);
	}

	public Jqykjd getJqykjdById(String jqykjdId) {
		return jqykjdAdapt.getJqykjdById(jqykjdId);
	}

	public List<Jqykjd> queryJqykjd(Jqykjd jqykjd) {
		return jqykjdAdapt.queryJqykjd(jqykjd);
	}
	
	public List<Ysjfx> queryByjdtj(Ysjfx ysjfx){
		return jqykjdAdapt.queryByjdtj(ysjfx);
	}
	@Override
	public List<Ydtj> queryByydtj(Ydtj ydtj) {
		return jqykjdAdapt.queryByydtj(ydtj);
	}
	@Override
	public List<YdtjBt> queryByydtjBt(YdtjBt ydtjBt) {
		return jqykjdAdapt.queryByydtjBt(ydtjBt);
	}
	@Override
	public List<YdtjBt> queryByndtjBt(YdtjBt ydtjBt) {
		return jqykjdAdapt.queryByndtjBt(ydtjBt);
	}
	@Override
	public List<Ysjfx> queryByndtj(Ysjfx ysjfx) {
		// TODO Auto-generated method stub
		return jqykjdAdapt.queryByndtj(ysjfx);
	}
	@Override
	public List<Ydtj> queryByNdtjqx(Ydtj ydtj) {
		// TODO Auto-generated method stub
		return jqykjdAdapt.queryByNdtjqx(ydtj);
	}
	
	@Override
	public List<Jqykjd> queryByWeather(Jqykjd jqykjd) {
		// TODO Auto-generated method stub
		return jqykjdAdapt.queryByWeather(jqykjd);
	}
	@Override
	public List<Jqykjd> queryByCount() {
		// TODO Auto-generated method stub
		return jqykjdAdapt.queryByCount();
	}
	@Override
	public List<Ydtj> queryByydtjToTourist(Ydtj ydtj) {
		// TODO Auto-generated method stub
		return jqykjdAdapt.queryByydtjToTourist(ydtj);
	}
	
	



	@Override
	public List<YdtjBt> queryByndtjBt2(YdtjBt ydtjBt) {
		return jqykjdAdapt.queryByndtjBt2(ydtjBt);
	}
	@Override
	public List<Ydtj> queryByNdtjLkqx(Ydtj ydtj) {
		return jqykjdAdapt.queryByNdtjLkqx(ydtj);
	}
	
	@Override
	public List<Ysjfx> queryByProDayReal(String date) {
		// TODO Auto-generated method stub
		return jqykjdAdapt.queryByProDayReal(date);
	}
	
	@Override
	public List<Ysjfx> queryByProDayAll(String sdate, String edate) {
		// TODO Auto-generated method stub
		return jqykjdAdapt.queryByProDayAll(sdate, edate);
	}
	
	@Override
	public List<Srykzs> queryBySrykzs() {
		// TODO Auto-generated method stub
		return jqykjdAdapt.queryBySrykzs();
	}
	
	


}