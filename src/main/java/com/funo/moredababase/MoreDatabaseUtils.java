package com.funo.moredababase;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.directwebremoting.WebContextFactory;

import com.funo.system.model.SysMenu;
import com.funo.system.model.SysOperator;
import com.funo.utils.ApplicationContext;
import com.funo.utils.Constants;

public class MoreDatabaseUtils {

	//未登录情况使用
	public static String SOURCE_NAME;
	
	public static String getCurRoutingTag(boolean isClearSession){
		HttpSession session = ApplicationContext.getHttpSesstion();
		String databaseTag="CSMS_590";
		if (session != null) {//用户已登录
			
			//默认连接到CSMS库
			String newDsType=Constants.DB_TYPE_CSMS;
			//默认连到省库
			String newDsCode=Constants.DS_CODE_ALL;
			SysOperator user = null;
			if (session.getAttribute(Constants.Session_Attribute_UserEnv) != null) {
				user = (SysOperator) session
						.getAttribute(Constants.Session_Attribute_UserEnv);
			}
			
			if (null==user) {
				return databaseTag;
			}else if(null!=SOURCE_NAME && !SOURCE_NAME.equals("")){
				String source_result=SOURCE_NAME;
				SOURCE_NAME="";
				return source_result;
			}
			
			//菜单配置中选择的数据类型
			String curPage=(String)WebContextFactory.get().getCurrentPage();
			Map<String,Object> scriptSession=(Map<String,Object>)user.getOtherParams().get(Constants.SCRIPT_SESSION_KEY);
			if(null!=scriptSession){
				SysMenu curMenu=(SysMenu)scriptSession.get(curPage);
				if(null!=curMenu && StringUtils.isNotEmpty(curMenu.getDsTypes())){
					if(curMenu.getDsTypes().equals(Constants.MENU_DB_TYPE_TIS)){
						newDsType=Constants.DB_TYPE_TIS;
					}
				}
			}
			
			//当前用户的直属地市
			if (null!=user.getOrg()) {
				String orgCode=user.getOrg().getCode();
				if(StringUtils.isNotEmpty(orgCode)){
//					newDsCode=orgCode;
				}
			}
			
			//具有多地市查看权限的用户切换地市后连接到选择的地市数据库
			Object curChooseCity=user.getOtherParams().get(Constants.CUR_CHOOSE_CITY);
			if(null!=curChooseCity && StringUtils.isNotEmpty(curChooseCity.toString())){
//				newDsCode=curChooseCity.toString();
			}
			
			//特定连接数据库类型
			Object tempDsType=user.getOtherParams().get(Constants.TEMP_DB_TYPE);
			if(null!=tempDsType && StringUtils.isNotEmpty(tempDsType.toString())){
				newDsType=tempDsType.toString();
				if(isClearSession){
					user.getOtherParams().put(Constants.TEMP_DB_TYPE,"");
				}
			}
			//特定连接地市数据库
			Object tempOrgCode=user.getOtherParams().get(Constants.TEMP_ORG_CODE);
			if(null!=tempOrgCode && StringUtils.isNotEmpty(tempOrgCode.toString())){
//				newDsCode=tempOrgCode.toString();
				if(isClearSession){
					user.getOtherParams().put(Constants.TEMP_ORG_CODE,"");
				}
			}
			
		//	databaseTag=newDsType+"_"+newDsCode;
		}else if(null!=SOURCE_NAME && !SOURCE_NAME.equals("")){
			return SOURCE_NAME;
		}
		return databaseTag;
	}
}
