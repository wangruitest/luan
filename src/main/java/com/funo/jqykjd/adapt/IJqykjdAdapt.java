package com.funo.jqykjd.adapt;

import java.util.List;

import com.funo.jqykjd.model.Jqykjd;
import com.funo.jqykjd.model.Srykzs;
import com.funo.jqykjd.model.Ydtj;
import com.funo.jqykjd.model.YdtjBt;
import com.funo.jqykjd.model.Ysjfx;


public interface IJqykjdAdapt {

	public String getKey();

	public Jqykjd createJqykjd(Jqykjd jqykjd);

	public Jqykjd modifyJqykjd(Jqykjd jqykjd);

	public void deleteJqykjd(Jqykjd jqykjd);

	public void batchDeleteJqykjd(List<Jqykjd> jqykjdList);

	public Jqykjd getJqykjdById(String unid);

	public List<Jqykjd> queryJqykjd(Jqykjd jqykjd);
	
	public List<Ysjfx> queryByjdtj(Ysjfx ysjfx);

	public List<Ydtj> queryByydtj(Ydtj ydtj);
	
	public List<Ydtj> queryByydtjToTourist(Ydtj ydtj);
	
	public List<YdtjBt> queryByydtjBt(YdtjBt ydtjBt);
	
	public List<YdtjBt> queryByndtjBt(YdtjBt ydtjBt);
	
	public List<YdtjBt> queryByndtjBt2(YdtjBt ydtjBt);
	
	public List<Ysjfx> queryByndtj(Ysjfx ysjfx);
	
	public List<Ydtj> queryByNdtjqx(Ydtj ydtj);
	//年度旅客统计曲线
	public List<Ydtj> queryByNdtjLkqx(Ydtj ydtj);
	
	public List<Ysjfx> queryByProDayReal(String date);
	public List<Ysjfx> queryByProDayAll(String sdate,String edate);
	
	public List<Jqykjd> queryByWeather(Jqykjd jqykjd);
	
	public List<Jqykjd> queryByCount();
	
	public List<Srykzs> queryBySrykzs();
}