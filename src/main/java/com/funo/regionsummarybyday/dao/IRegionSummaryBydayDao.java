package com.funo.regionsummarybyday.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.regionsummarybyday.model.RegionSummaryByday;
import com.funo.regionsummarybyday.model.RegionSummaryBydaySum;

public interface IRegionSummaryBydayDao extends CommonDao<RegionSummaryByday> {
	public List<RegionSummaryBydaySum> queryBySum(RegionSummaryByday regionSummaryByday);

}