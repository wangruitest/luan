package com.funo.jqykjd.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.jqykjd.model.Jqykjd;
import com.funo.jqykjd.model.Srykzs;
import com.funo.jqykjd.model.Ydtj;
import com.funo.jqykjd.model.YdtjBt;
import com.funo.jqykjd.model.Ysjfx;

public interface IJqykjdDao extends CommonDao<Jqykjd> {
	
	public List<Ysjfx> queryByjdtj(Ysjfx ysjfx);

	public List<Ydtj> queryByydtj(Ydtj ydtj);
	
	public List<Ydtj> queryByydtjToTourist(Ydtj ydtj);
	
	public List<YdtjBt> queryByydtjBt(YdtjBt ydtjBt);
	
	public List<YdtjBt> queryByndtjBt(YdtjBt ydtjBt);

	public List<YdtjBt> queryByndtjBt2(YdtjBt ydtjBt);

	public List<Ysjfx> queryByndtj(Ysjfx ysjfx);
	
	public List<Ydtj> queryByNdtjqx(Ydtj ydtj);

	public List<Ysjfx> queryByProDayReal(String date);
 ///
	public List<Ysjfx> queryByProDayAll(String sdate);
	//
	public List<Srykzs> queryBySrykzs();
	//
	public List<Jqykjd> queryByWeather(Jqykjd jqykjd);
	//
	public List<Jqykjd> queryByCount();

	// 年度旅客统计曲线
	public List<Ydtj> queryByNdtjLkqx(Ydtj ydtj);

}