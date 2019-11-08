package com.funo.anhui.adapt;

import java.util.List;

import com.funo.anhui.model.Anhui;


public interface IAnhuiAdapt {

	public String getKey();

	public Anhui createAnhui(Anhui anhui);

	public Anhui modifyAnhui(Anhui anhui);

	public void deleteAnhui(Anhui anhui);

	public void batchDeleteAnhui(List<Anhui> anhuiList);

	public Anhui getAnhuiById(String unid);

	public List<Anhui> queryAnhui(Anhui anhui);
	
	public List<Anhui> queryBy1(Anhui anhui);
	public List<Anhui> queryBy2(Anhui anhui);
	public List<Anhui> queryBy3(Anhui anhui);
	public List<Anhui> queryBy4(Anhui anhui);
	public List<Anhui> queryBy5(Anhui anhui);
}