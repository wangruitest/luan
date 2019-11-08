package com.funo.anhui.adapt.impl;

import java.util.List;

import com.funo.anhui.adapt.IAnhuiAdapt;
import com.funo.anhui.dao.IAnhuiDao;
import com.funo.anhui.model.Anhui;
import com.funo.base.adapt.BaseAdapt;

public class AnhuiAdapt extends BaseAdapt implements IAnhuiAdapt {

	private static final long serialVersionUID = 1L;
	private IAnhuiDao anhuiDao;
	
	public IAnhuiDao getAnhuiDao() {
		return anhuiDao;
	}

	public void setAnhuiDao(IAnhuiDao anhuiDao) {
		this.anhuiDao = anhuiDao;
	}

	public String getKey() {
		return anhuiDao.getKey();
	}

	public Anhui createAnhui(Anhui anhui) {
		anhuiDao.create(anhui);
		return anhui;
	}

	public Anhui modifyAnhui(Anhui anhui) {
		anhuiDao.update(anhui);
		return anhui;
	}

	public void deleteAnhui(Anhui anhui) {
		anhuiDao.delete(anhui);
	}

	public void batchDeleteAnhui(List<Anhui> anhuiList) {
		anhuiDao.batchCreate(anhuiList);
	}

	public Anhui getAnhuiById(String anhuiId) {
		return anhuiDao.getById(anhuiId);
	}

	public List<Anhui> queryAnhui(Anhui anhui) {
		return anhuiDao.queryByArgs(anhui);
	}
	
	public List<Anhui> queryBy1(Anhui anhui){
		return anhuiDao.queryBy1(anhui);
	}
	
	public List<Anhui> queryBy2(Anhui anhui){
		return anhuiDao.queryBy2(anhui);
	}
	
	public List<Anhui> queryBy3(Anhui anhui){
		return anhuiDao.queryBy3(anhui);
	}
	
	public List<Anhui> queryBy4(Anhui anhui){
		return anhuiDao.queryBy4(anhui);
	}
	
	public List<Anhui> queryBy5(Anhui anhui){
		return anhuiDao.queryBy5(anhui);
	}
}