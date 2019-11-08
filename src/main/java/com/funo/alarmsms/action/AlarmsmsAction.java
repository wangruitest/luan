package com.funo.alarmsms.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.funo.alarmsms.mgmt.IAlarmsmsMgmt;
import com.funo.alarmsms.model.Alarmsms;
import com.funo.common.ActionResult;
import com.funo.common.CommonAction;
import com.funo.report.ExportExcelReport;

public class AlarmsmsAction extends CommonAction{
	private IAlarmsmsMgmt alarmsmsMgmt;

	public IAlarmsmsMgmt getAlarmsmsMgmt() {
		return alarmsmsMgmt;
	}
	public void setAlarmsmsMgmt(IAlarmsmsMgmt alarmsmsMgmt) {
		this.alarmsmsMgmt = alarmsmsMgmt;
	}
	

	/**
	 * 获取所有
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllAlarmsms(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = alarmsmsMgmt.queryAlarmsms(new Alarmsms());
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
	public ActionResult getAlarmsmsList(Alarmsms alarmsms){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = alarmsmsMgmt.queryAlarmsms(alarmsms);
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
	public ActionResult createAlarmsms(Alarmsms alarmsms){
		ActionResult ar=new ActionResult();
		try {
			//alarmsms.setUpdatetime(new Date());
			alarmsms=alarmsmsMgmt.createAlarmsms(alarmsms);
			ar.setReturnObject(alarmsms);
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
	public ActionResult updateAlarmsms(List<Alarmsms> alarmsmsList){
		ActionResult ar=new ActionResult();
		Alarmsms alarmsms = new Alarmsms();
		StringBuffer sb = null;
		try {
			if (alarmsmsList.size()>0) {
				 sb = new StringBuffer();
				for(int i=0;i<alarmsmsList.size();i++){
					sb.append("'").append(alarmsmsList.get(i).getId()).append("',");
				}
				alarmsms.setIdIn(sb.delete(sb.length()-1, sb.length()).toString());
			}
			alarmsmsMgmt.modifyAlarmsms(alarmsms);
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
	public ActionResult deleteAlarmsms(Alarmsms alarmsms){
		ActionResult ar=new ActionResult();
		try {
			alarmsmsMgmt.deleteAlarmsms(alarmsms);
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
	public ActionResult batchDeleteAlarmsms(List<Alarmsms> alarmsmsList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<alarmsmsList.size();i++){
				this.deleteAlarmsms(alarmsmsList.get(i));
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
	 * 导出excel
	 */
	public ActionResult reportExport(Alarmsms alarmsms,String[] headerStr,String title){
		ActionResult ar=new ActionResult();
		String[] reStr = null;
		try {
			
			List<Alarmsms> list = alarmsmsMgmt.queryAlarmsms(alarmsms);
			ExportExcelReport exportExcelReport = new ExportExcelReport();
			String[][] result = new String[list.size()][headerStr.length];
			int i=0;
			String smstypename =null;
			Date date=null;
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			for (Alarmsms alarm:list) {
				result[i][0] = alarm.getPhoneNum();
				if (alarm.getSmstype()==1) smstypename="系统告警"; 
				if (alarm.getSmstype()==2) smstypename="业务告警"; 
				if (alarm.getSmstype()==3) smstypename="测试短信"; 
				result[i][1] = smstypename;
				result[i][2] = alarm.getSmscontent();
				result[i][3] = null==(date=alarm.getUpdatetime())?null:format.format(date);
				result[i][4] = null==(date=alarm.getFirstsmsdate())?null:format.format(date);
				result[i][5] = null==(date=alarm.getLastsmsdate())?null:format.format(date);
				result[i][6] = alarm.getSmscount()+"";
				result[i][7] = alarm.getSmsresultcode()+"";
				result[i][8] = alarm.getRemark();
				i++;
			}
			reStr = exportExcelReport.exportReport(result, headerStr,title);
			ar.setResultCode(0);
			if(null!=reStr){
				ar.setReturnObject(reStr);
			}
		} catch (Exception e){
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
}