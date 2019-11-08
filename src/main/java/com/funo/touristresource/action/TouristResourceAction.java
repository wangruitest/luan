package com.funo.touristresource.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
 
import com.funo.common.CommonAction;
import com.funo.report.StringUtil;
import com.funo.common.ActionResult;
import com.funo.touristresource.mgmt.ITouristResourceMgmt;
import com.funo.touristresource.model.TPDSum;
import com.funo.touristresource.model.TouristResource;
import com.funo.utils.Constants;
import com.funo.system.model.SysOperator;

public class TouristResourceAction extends CommonAction{
	private ITouristResourceMgmt touristResourceMgmt;

	public ITouristResourceMgmt getTouristResourceMgmt() {
		return touristResourceMgmt;
	}
	public void setTouristResourceMgmt(ITouristResourceMgmt touristResourceMgmt) {
		this.touristResourceMgmt = touristResourceMgmt;
	}
	

	/**
	 * 获取所有旅游资源
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllTouristResource(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = touristResourceMgmt.queryTouristResource(new TouristResource());
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
	 * 根据条件获取旅游资源列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getTouristResourceList(TouristResource touristResource){
		ActionResult ar=new ActionResult();
		List result=null;
		if(!StringUtil.isEmpty(touristResource.getProvinceCode())){
			result = touristResourceMgmt.queryProvinceResources(touristResource);
		}else{
			result = touristResourceMgmt.queryCityResources(touristResource);
          }
	
		try {
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
	 * 创建旅游资源
	 */
	public ActionResult createTouristResource(TouristResource touristResource){
		ActionResult ar=new ActionResult();
		try {
			touristResource.setCreateTime(new Date());
			touristResource=touristResourceMgmt.createTouristResource(touristResource);
			ar.setReturnObject(touristResource);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 根据ID获取旅游资源
	 */
	public ActionResult getTouristResourceById(String id){
		ActionResult ar=new ActionResult();
		TouristResource touristResource = null;
		try {
			touristResource=touristResourceMgmt.getTouristResourceById(id);
			ar.setReturnObject(touristResource);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改旅游资源
	 */
	public ActionResult updateTouristResource(TouristResource touristResource){
		ActionResult ar=new ActionResult();
		String loginUser = this.getSessionUser().getName();
		try {
			touristResource.setUpdateTime(new Date());
			touristResource.setUpdateUser(loginUser);
			touristResource=touristResourceMgmt.modifyTouristResource(touristResource);
			ar.setReturnObject(touristResource);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除旅游资源
	 */
	public ActionResult deleteTouristResource(TouristResource touristResource){
		ActionResult ar=new ActionResult();
		try {
			touristResourceMgmt.deleteTouristResource(touristResource);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除旅游资源
	 */
	public ActionResult batchDeleteTouristResource(List<TouristResource> touristResourceList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<touristResourceList.size();i++){
				this.deleteTouristResource(touristResourceList.get(i));
			}
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	
	/**
	 * <p>
	 *	<b>describe: 游客来源统计</b><br>
	 *	 <br>
	 * <b><i>notice:</i></b>
	 *	<ol>
	 *		<li></li>
	 *	</ol>
	 * </p>
	 * @param touristResource
	 * @return
	 * @author wucong
	 */
	public String getSourcePlace(TouristResource touristResource){
		JSONObject jsonb = new JSONObject();
		JSONArray json = new JSONArray();
		long viewnum = 6;//默认显示10个地区（包含其他）  
		long viewflag = 1;//默认显示其他
		int totle = 0;//总条数
		int other = 0;//其他的条数
		List<TPDSum> list = null;
		try {
			list = touristResourceMgmt.queryByCityCode(touristResource);
			if (list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					//判断当前是否显示其他，是时地区数据少取一条
					if(list.get(i).getAreacode().indexOf("安徽")!=-1){
						JSONObject jo = new JSONObject();
						jo.put("value", list.get(i).getTourists());
						jo.put("name", list.get(i).getAreacode());
						json.put(jo);
						if(i<viewnum){
							viewnum=viewnum+1;
						}
					}else if(list.get(i).getAreacode().equals("其他")){//排除统计数据中的”其他“数据
						other = other + Integer.valueOf(list.get(i).getTourists());
						if(i<viewnum){
							viewnum = viewnum + 1;
						}						
					}else{
						if (i < (viewnum-2)) {
							JSONObject jo = new JSONObject();
							jo.put("value", list.get(i).getTourists());
							jo.put("name", list.get(i).getAreacode());
							json.put(jo);
						}
						//获取其他的数据和
						if (i >= (viewnum-2)) {
							other = other + Integer.valueOf(list.get(i).getTourists());
						}
					}
					//获取所有的数据和
					totle = totle + Integer.valueOf(list.get(i).getTourists());
				}
				JSONObject jo = new JSONObject();
				jo.put("value", other);
				jo.put("name", "其他");
				json.put(jo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		jsonb.put("total", totle);
		jsonb.put("datavalue", json.toString());
		return jsonb.toString();
		
	}
	
	//切换城市tis库
	private void connectToTisDb(){
		SysOperator user=this.getSessionUser();
		setUserExParams(Constants.TEMP_DB_TYPE, Constants.DB_TYPE_TIS);
		String curCityCode=(String)user.getOtherParams().get(Constants.CUR_CHOOSE_CITY);
		setUserExParams(Constants.TEMP_ORG_CODE, curCityCode);
	}
	
	private boolean setUserExParams(String key,String value){
		boolean result=true;
		try{
			SysOperator user=this.getSessionUser();
			user.getOtherParams().put(key, value);
		}catch(Exception e){
			result=false;
			e.printStackTrace();
		}
		return result;
	}
	
	public String getTouristNumber(String num){
		JSONObject jo = new JSONObject();
		int otherTourist = 0;//外省
		int overseasTourist = 0;//境外
		int provincialTourist = 0;//本省
		if (num.equals("1")) {
			otherTourist = 34531;//外省
			overseasTourist = 12345;//境外
			provincialTourist = 564321;//本省
		} else if (num.equals("2")) {
			otherTourist = 34531 + 100;//外省
			overseasTourist = 12345 + 150;//境外
			provincialTourist = 564321 + 300;//本省
		} else {
			otherTourist = 34531 + 200;//外省
			overseasTourist = 12345 + 250;//境外
			provincialTourist = 564321 + 300;//本省
		}
		
		int totalTourist = otherTourist + overseasTourist + provincialTourist;
		jo.put("otherTourist", otherTourist);
		jo.put("overseasTourist", overseasTourist);
		jo.put("provincialTourist", provincialTourist);
		jo.put("totalTourist", totalTourist);
		
		return jo.toString();
	}
	
	public String getCityMonth(){
		JSONArray json = new JSONArray();
		
		for (int i = 0; i < 9; i++) {
			JSONObject jo = new JSONObject();
			jo.put("dateTime", 10 + i);
			jo.put("tiemValue", 100 - i*5);
			json.put(jo);
		}
		
		return json.toString();
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