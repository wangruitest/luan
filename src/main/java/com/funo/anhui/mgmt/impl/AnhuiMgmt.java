package com.funo.anhui.mgmt.impl;

import com.funo.anhui.adapt.IAnhuiAdapt;
import com.funo.anhui.mgmt.IAnhuiMgmt;
import com.funo.anhui.model.Anhui;
import com.funo.base.mgmt.BaseMgmt;

import java.util.List;

public class AnhuiMgmt extends BaseMgmt implements IAnhuiMgmt {

	private static final long serialVersionUID = 1L;
	private IAnhuiAdapt anhuiAdapt;
	
	public IAnhuiAdapt getAnhuiAdapt() {
		return anhuiAdapt;
	}
	public void setAnhuiAdapt(IAnhuiAdapt anhuiAdapt) {
		this.anhuiAdapt = anhuiAdapt;
	}

	public String getKey() {
		return anhuiAdapt.getKey();
	}

	public Anhui createAnhui(Anhui anhui) {
		anhuiAdapt.createAnhui(anhui);
		return anhui;
	}

	public Anhui modifyAnhui(Anhui anhui) {
		anhuiAdapt.modifyAnhui(anhui);
		return anhui;
	}

	public void deleteAnhui(Anhui anhui) {
		anhuiAdapt.deleteAnhui(anhui);
	}

	public void batchDeleteAnhui(List<Anhui> anhuiList) {
		anhuiAdapt.batchDeleteAnhui(anhuiList);
	}

	public Anhui getAnhuiById(String anhuiId) {
		return anhuiAdapt.getAnhuiById(anhuiId);
	}

	public List<Anhui> queryAnhui(Anhui anhui) {
		return anhuiAdapt.queryAnhui(anhui);
	}
	
	public List<Anhui> queryBy1(Anhui anhui){
		return anhuiAdapt.queryBy1(anhui);
	}
	
	public List<Anhui> queryBy2(Anhui anhui){
		return anhuiAdapt.queryBy2(anhui);
	}
	
	public List<Anhui> queryBy3(Anhui anhui){
		return anhuiAdapt.queryBy3(anhui);
	}
	
	public List<Anhui> queryBy4(Anhui anhui){
		return anhuiAdapt.queryBy4(anhui);
	}
	
	public List<Anhui> queryBy5(Anhui anhui){
		return anhuiAdapt.queryBy5(anhui);
	}
}