package com.funo.report;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

//import javax.faces.model.SelectItem;

//import org.jboss.seam.annotations.Name;

import com.funo.db.DBUtil;
import com.funo.db.ProxoolUtil;
import com.funo.util.Result;


//@Name("ReportMgt")
public class ReportMgt {
	private static ResultSet rs=null;
	private static Statement stmt=null;
	private static Connection conn=null;
	
	//获取所有景区类型
	public static Map<String,String> getALLRegionType(){
		String sql = "select * from region_type_cfg order by id desc";
		StringBuffer sb= new StringBuffer();
		Map<String,String> map = new LinkedHashMap<String, String>();
		try {
			conn = ProxoolUtil.getConnection("funo");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				map.put(rs.getString("id"), rs.getString("typename"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeConn();
		}
		return map;
	}
	
	//根据景区类型，获取该类型的所有景区名称
	public static Map<String,String> getRegionByType(String regionTypeId){
		String sql = "select region_name,id from region_cfg where typeid = "+regionTypeId+" order by id";
		String[] str = null;
		StringBuffer sb= new StringBuffer();
		Map<String,String> map = new LinkedHashMap<String, String>();
		try {
			conn = ProxoolUtil.getConnection("funo");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				map.put(rs.getString("id"), rs.getString("region_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeConn();
		}
		return map;
	}
	
	/**
	 * 获取除福建以外的其他省份信息
	 * @return
	 */
	public static String getProvinces(){
		String sql = "select distinct provinces_code,provinces from prefix_cfg where provinces<>'福建' order by provinces_code";
		StringBuffer sb= new StringBuffer();
		try {
			conn = ProxoolUtil.getConnection("funo");
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
			while(rs.next()){
				sb.append(","+rs.getString("provinces")+","+rs.getString("provinces_code"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeConn();
		}
		return sb.toString().substring(1);
	}
	
	public static String getAllAreaCodes(){
		String sql = "select distinct area_code,city from prefix_cfg order by area_code";
		StringBuffer sb= new StringBuffer();
		try {
			conn = ProxoolUtil.getConnection("funo");
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
			while(rs.next()){
				sb.append(","+rs.getString("city")+","+rs.getString("area_code"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeConn();
		}
		return sb.toString().substring(1);
	}
	
	public static String getAllProvinces(){
		String sql = "select distinct provinces from prefix_cfg";
		StringBuffer sb= new StringBuffer();
		try {
			conn = ProxoolUtil.getConnection("funo");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				sb.append(","+rs.getString("provinces"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeConn();
		}
		return sb.toString().substring(1);
	}
	
	public static String getCityByProvince(String province){
		String sql = "select distinct city,area_code from prefix_cfg where provinces='"+province+"' order by area_code";
		Connection conn;
		StringBuffer sb= new StringBuffer();
		try {
			conn = ProxoolUtil.getConnection("funo");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				sb.append(","+rs.getString("city")+","+rs.getString("area_code"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeConn();
		}
		return sb.toString().substring(1);
	}
	
	public static String getAllRegion(){
		//从数据库获取景区名称和景区ID
		StringBuffer regions=new StringBuffer();
		String regionStr=null;
		try {
			conn = ProxoolUtil.getConnection("funo");
			stmt = conn.createStatement();
			rs =stmt.executeQuery("select region_name,id from region_cfg");
			while(rs.next()){
				String regionName = rs.getString("region_name");
				String regionId   = rs.getString("id");
				regions.append(','+regionId+'/'+regionName);
			}
			regionStr = regions.toString().substring(1,regions.toString().length());
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeConn();
		}
		return regionStr;
	}
	
	public static String getFirstRegion(){
		String regionStr=null;
		//从数据库获取景区名称和景区ID
		try {
			conn = ProxoolUtil.getConnection("funo");
			stmt = conn.createStatement();
			rs =stmt.executeQuery("select region_name,id from region_cfg where rownum ='1'");
			if(rs.next()){
				regionStr=rs.getString("id")+","+rs.getString("region_name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeConn();
		}
		return regionStr;
	}
	
	
	public static void closeConn(){
		try {
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static Map<String,String> getRegMaps() {
		return getSelectMap("SELECT ID,REGION_NAME FROM REGION_CFG ORDER BY ID");
	}
	
//	/**
//	 * 获取所有景区下拉列表
//	 * @return SelectItem[]
//	 */
//	public SelectItem[] getRegItems() {
//		return getSelectItem("select id,region_name from region_cfg");
//	}
//	
//	/**
//	 * 获取所有景区下拉列表
//	 * @return SelectItem[]
//	 */
//	public SelectItem[] getRegType() {
//		return getSelectItem("select id,TYPENAME from region_type_cfg");
//	}
	
	/**
	 * 将sql查询到得数据存入map
	 * @param sql String
	 * @return Map<String,String>
	 */
	public static Map<String,String> getSelectMap(String sql) {
		Map<String,String> selectType = new LinkedHashMap<String,String>();
		Result rsQuery = DBUtil.executeSql(sql, "funo");
        if(rsQuery.aaResult!=null&&rsQuery.aaResult.length>0) {
            for(int i=0;i<rsQuery.aaResult.length;i++) {
                selectType.put(rsQuery.aaResult[i][0],rsQuery.aaResult[i][1]);
            }
        }
		return selectType;
	}
	
//	/**
//	 * 将sql查询到得数据存入下拉框列表
//	 * @param sql String
//	 * @return SelectItem[]
//	 */
//	public static SelectItem[] getSelectItem(String sql) {
//		Result rsQuery = DBUtil.executeSql(sql, Authenticator.POOL_NAME);
//		SelectItem[] selectItem = new SelectItem[rsQuery.aaResult.length];
//		if(rsQuery.aaResult!=null&&rsQuery.aaResult.length>0) {
//			for(int i=0; i<rsQuery.aaResult.length; i++) {
//				selectItem[i] = new SelectItem(rsQuery.aaResult[i][0],rsQuery.aaResult[i][1]);
//			}
//		}
//		return selectItem;
//	}
}

