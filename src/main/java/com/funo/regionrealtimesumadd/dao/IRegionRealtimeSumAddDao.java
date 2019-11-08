package com.funo.regionrealtimesumadd.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.regionrealtimesumadd.model.RegionRealtimeSumAdd;

public interface IRegionRealtimeSumAddDao extends CommonDao<RegionRealtimeSumAdd> {
	
	public List<RegionRealtimeSumAdd> queryByAllcitysIn(RegionRealtimeSumAdd regionRealtimeSumAdd);
	
	public List<RegionRealtimeSumAdd> queryByAllcitysOut(RegionRealtimeSumAdd regionRealtimeSumAdd);
	
	public List<RegionRealtimeSumAdd> queryByCityidRegionid(RegionRealtimeSumAdd regionRealtimeSumAdd);
	
	public List<RegionRealtimeSumAdd> queryByCityidRegionidOut(RegionRealtimeSumAdd regionRealtimeSumAdd);
	
	public List<RegionRealtimeSumAdd> queryByCityidRegionidIn(RegionRealtimeSumAdd regionRealtimeSumAdd);

}