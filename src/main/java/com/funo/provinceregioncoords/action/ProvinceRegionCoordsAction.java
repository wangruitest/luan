package com.funo.provinceregioncoords.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.commons.lang.StringUtils;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.provinceregioncoords.mgmt.IProvinceRegionCoordsMgmt;
import com.funo.provinceregioncoords.model.ProvinceRegionCoords;
import com.funo.regionCoords.model.RegionCoords;
import com.funo.regionCoords.model.RegionPolygon;
import com.funo.system.model.SysOperator;
import com.funo.utils.Constants;

public class ProvinceRegionCoordsAction extends CommonAction{
	private IProvinceRegionCoordsMgmt provinceRegionCoordsMgmt;

	public IProvinceRegionCoordsMgmt getProvinceRegionCoordsMgmt() {
		return provinceRegionCoordsMgmt;
	}
	public void setProvinceRegionCoordsMgmt(IProvinceRegionCoordsMgmt provinceRegionCoordsMgmt) {
		this.provinceRegionCoordsMgmt = provinceRegionCoordsMgmt;
	}
	

	/**
	 * 获取所有
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllProvinceRegionCoords(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = provinceRegionCoordsMgmt.queryProvinceRegionCoords(new ProvinceRegionCoords());
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 根据条件获取列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getProvinceRegionCoordsList(ProvinceRegionCoords provinceRegionCoords){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = provinceRegionCoordsMgmt.queryProvinceRegionCoords(provinceRegionCoords);
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
		
	
	/**
	 * 创建
	 */
	public ActionResult createProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords){
		ActionResult ar=new ActionResult();
		try {
//			provinceRegionCoords.setUnid(provinceRegionCoordsMgmt.getKey());
			provinceRegionCoords=provinceRegionCoordsMgmt.createProvinceRegionCoords(provinceRegionCoords);
			ar.setReturnObject(provinceRegionCoords);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改
	 */
	public ActionResult updateProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords){
		ActionResult ar=new ActionResult();
		try {
			provinceRegionCoords=provinceRegionCoordsMgmt.modifyProvinceRegionCoords(provinceRegionCoords);
			ar.setReturnObject(provinceRegionCoords);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除
	 */
	public ActionResult deleteProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords){
		ActionResult ar=new ActionResult();
		try {
			provinceRegionCoordsMgmt.deleteProvinceRegionCoords(provinceRegionCoords);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除
	 */
	public ActionResult batchDeleteProvinceRegionCoords(List<ProvinceRegionCoords> provinceRegionCoordsList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<provinceRegionCoordsList.size();i++){
				this.deleteProvinceRegionCoords(provinceRegionCoordsList.get(i));
			}
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	//获取景区
	public List<ProvinceRegionCoords> getAllRegion() {
		ActionResult ar=new ActionResult();
		List<ProvinceRegionCoords> rcs = new ArrayList<ProvinceRegionCoords>();
		try {
			rcs = provinceRegionCoordsMgmt.queryRegionsTags(new ProvinceRegionCoords());	
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return rcs;
	}
	
	public ProvinceRegionCoords getRegionInfoByRegionId(Long regionId) {
		ActionResult ar=new ActionResult();
		ProvinceRegionCoords rp = new ProvinceRegionCoords();
		try {
			//获取景区信息
			ProvinceRegionCoords provinceRegions = provinceRegionCoordsMgmt.getProvinceRegionCoordsById(regionId.toString());
			
			//获取景区的经纬度信息
			ProvinceRegionCoords rc = new ProvinceRegionCoords();
			rc.setRegionId(regionId);
			List<ProvinceRegionCoords> rcs = provinceRegionCoordsMgmt.queryProvinceRegionCoords(rc);
			rcs = sortRegionCoordsList(rcs);
			
			
			//整合景区数据
			rp.setRegionId(regionId);
			rp.setRegionName(provinceRegions.getRegionName());
			rp.setLat(provinceRegions.getLat());
			rp.setLng(provinceRegions.getLng());
			rp.setaRegionCoords(rcs);
//			//获取景区的基站信息
//			rp.setaCellCfg(cellCfgMgmt.queryByRegion(regionId));
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return rp;
	}
	
	/**
	 * 根据编号对该景区的经纬度信息进行排序
	 * @param rcl
	 * @return
	 */
	private List<ProvinceRegionCoords> sortRegionCoordsList(List<ProvinceRegionCoords> rcl) {
		Collections.sort(rcl, new Comparator<ProvinceRegionCoords>(){
			public int compare(ProvinceRegionCoords o1, ProvinceRegionCoords o2) {
				return Long.valueOf(o1.getCoordsIndex().longValue() - o2.getCoordsIndex().longValue()).intValue();
			}
		});
		return rcl;
	}
	
	/**
	 * 重置景区位置区域
	 */
	public ActionResult deleteRegionCoords(Long id){
		ActionResult ar=new ActionResult();
		try {
			ProvinceRegionCoords rc1 = new ProvinceRegionCoords();
			rc1.setRegionId(id);
			provinceRegionCoordsMgmt.deleteProvinceRegionCoords(rc1);//删除景区区域
			ProvinceRegionCoords rc = new ProvinceRegionCoords();
			rc.setId(id);
			rc.setLat("");
			rc.setLng("");
			provinceRegionCoordsMgmt.uptRegionLnglat(rc);//删除景区中心
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	//设置景区中心点
	public ActionResult uptRegionLatLng(ProvinceRegionCoords rp) {
		ActionResult ar=new ActionResult();
		try {
			ProvinceRegionCoords rc = new ProvinceRegionCoords();
			rc.setId(rp.getRegionId());
			rc.setLat(rp.getLat());
			rc.setLng(rp.getLng());
			provinceRegionCoordsMgmt.uptRegionLnglat(rc);//设置景区中心
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	//绘制景区区域
	public ActionResult uptRegionCoords(ProvinceRegionCoords rp) {
		ActionResult ar=new ActionResult();
		try {
			provinceRegionCoordsMgmt.uptRegionCoordsList(rp);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 通过城市id获取景区
	 */
	public ActionResult getAllRegionByCityCode(ProvinceRegionCoords provinceRegionCoords){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = provinceRegionCoordsMgmt.queryRegionCfgByCityCode(provinceRegionCoords);
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 获取景区在园人数信息并绘制
	 * @return
	 */
	public List<ProvinceRegionCoords> getAllRegionInfo(ProvinceRegionCoords provinceRegionCoords) {
		ActionResult ar=new ActionResult();
		List<ProvinceRegionCoords> rps = new ArrayList<ProvinceRegionCoords>();
		try {
			rps = provinceRegionCoordsMgmt.queryRegionCfgByCityCode(provinceRegionCoords);
			List<ProvinceRegionCoords> totalRcs = provinceRegionCoordsMgmt.queryProvinceRegionCoords(new ProvinceRegionCoords());
			for(ProvinceRegionCoords rp : rps) {
				rp.setColorIndex(0);
				//读取出属于该景区的经纬度信息
				List<ProvinceRegionCoords> rcs = new ArrayList<ProvinceRegionCoords>();
				for(ProvinceRegionCoords rc : totalRcs) {
					if(rc.getRegionId().longValue() == rp.getId().longValue()) {
						rcs.add(rc);
					}
				}
				//根据编号对该景区的经纬度信息进行排序
				sortRegionCoordsList(rcs);
				rp.setaRegionCoords(rcs);
			}
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return rps;
	}
	
	/**
	 * 通过Session获取用户信息
	 */
	public SysOperator getSessionUser(){
		SysOperator user=super.getSessionUser();
		if(user==null){
			user=new SysOperator();
			user.setUnid("0");
			user.setName("超级管理员");
		}
		return user;
	}
}