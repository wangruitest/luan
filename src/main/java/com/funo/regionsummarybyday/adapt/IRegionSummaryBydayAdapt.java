package com.funo.regionsummarybyday.adapt;

import java.util.List;

import com.funo.regionsummarybyday.model.RegionSummaryByday;
import com.funo.regionsummarybyday.model.RegionSummaryBydaySum;


public interface IRegionSummaryBydayAdapt {

	public String getKey();

	public RegionSummaryByday createRegionSummaryByday(RegionSummaryByday regionSummaryByday);

	public RegionSummaryByday modifyRegionSummaryByday(RegionSummaryByday regionSummaryByday);

	public void deleteRegionSummaryByday(RegionSummaryByday regionSummaryByday);

	public void batchDeleteRegionSummaryByday(List<RegionSummaryByday> regionSummaryBydayList);

	public RegionSummaryByday getRegionSummaryBydayById(String unid);

	public List<RegionSummaryByday> queryRegionSummaryByday(RegionSummaryByday regionSummaryByday);

	public List<RegionSummaryBydaySum> queryBySum(RegionSummaryByday regionSummaryByday);
}