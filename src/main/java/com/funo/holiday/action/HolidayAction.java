package com.funo.holiday.action;


import java.util.List;

import com.funo.common.ActionResult;
import com.funo.common.CommonAction;
import com.funo.holiday.mgmt.IHolidayMgmt;
import com.funo.holiday.model.Holiday;

public class HolidayAction extends CommonAction {
	
	private IHolidayMgmt holidayMgmt;

	public IHolidayMgmt getHolidayMgmt() {
		return holidayMgmt;
	}

	public void setHolidayMgmt(IHolidayMgmt holidayMgmt) {
		this.holidayMgmt = holidayMgmt;
	}
	
	/**
	 * 查询所有的列表
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllHoliday(){
		ActionResult ar=new ActionResult();
		List result=null;
		try{
			result=holidayMgmt.queryHoliday(new Holiday());
			ar.setReturnList(result);
			ar.setResultCode(0);
		}catch(Exception e){
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	//查询不重复的的节假日
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAll(){
		ActionResult ar=new ActionResult();
		List result=null;
		try{
			result=holidayMgmt.queryAll(new Holiday());
			ar.setReturnList(result);
			ar.setResultCode(0);
		}catch(Exception e){
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 根据条件查询假日
	 * @param order
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getHolidayList(Holiday holiday){
		ActionResult ar=new ActionResult();
		List result=null;
		try{
			result=holidayMgmt.queryHoliday(holiday);
			ar.setReturnList(result);
			ar.setResultCode(0);
		}catch(Exception e){
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 根据年查询假日
	 * @param order
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getHolidayListByYear(Holiday holiday){
		ActionResult ar=new ActionResult();
		List result=null;
		try{
			result=holidayMgmt.queryListByYear(holiday);
			ar.setReturnList(result);
			ar.setResultCode(0);
		}catch(Exception e){
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	
	/**
	 * 根据年,假日名称查询假日
	 * @param order
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getHolidayListByName(Holiday holiday){
		ActionResult ar=new ActionResult();
		List result=null;
		try{
			result=holidayMgmt.queryListByName(holiday);
			ar.setReturnList(result);
			ar.setResultCode(0);
		}catch(Exception e){
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 创建假日
	 * @param order
	 * @return
	 */
	public ActionResult createHoliday(Holiday holiday){
		ActionResult ar=new ActionResult();
		try{
			String beloneYear=holiday.getFirstDay().substring(0,4);
			holiday.setBeloneYear(beloneYear);
			holiday=holidayMgmt.createHoliday(holiday);
			ar.setReturnObject(holiday);
			ar.setResultCode(0);
		}catch(Exception e){
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}

	
	/**
	 * 修改假日
	 * @param order
	 * @return
	 */
	public ActionResult updateHoliday(Holiday holiday){
		ActionResult ar=new ActionResult();
		try{
			String beloneYear=holiday.getFirstDay().substring(0,4);
			holiday.setBeloneYear(beloneYear);
			holiday=holidayMgmt.modifyHoliday(holiday);
			ar.setReturnObject(holiday);
			ar.setResultCode(0);
		}catch(Exception e){
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	
	/**
	 * 删除假日
	 * @param order
	 * @return
	 */
	public ActionResult deleteHoliday(Holiday holiday){
		ActionResult ar=new ActionResult();
		try{
			holidayMgmt.deleteHoliday(holiday);
			ar.setResultCode(0);
		}catch(Exception e){
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除
	 * @param orderList
	 * @return
	 */
	public ActionResult batchDeleteHoliday(List<Holiday> holidayList){
		ActionResult ar=new ActionResult();
		try{
			for(int i=0;i<holidayList.size();i++){
				this.deleteHoliday(holidayList.get(i));
			}
			ar.setResultCode(0);
		}catch(Exception e){
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
}
