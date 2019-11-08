package com.funo.anhui.dao;

import java.util.List;

import com.funo.anhui.model.Anhui;
import com.funo.base.dao.CommonDao;

public interface IAnhuiDao extends CommonDao<Anhui> {
	public List<Anhui> queryBy1(Anhui anhui);
	public List<Anhui> queryBy2(Anhui anhui);
	public List<Anhui> queryBy3(Anhui anhui);
	public List<Anhui> queryBy4(Anhui anhui);
	public List<Anhui> queryBy5(Anhui anhui);
}