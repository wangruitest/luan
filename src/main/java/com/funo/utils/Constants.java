package com.funo.utils;

/**
 * @author Administrator
 *
 */
public class Constants {

	public static String Session_Attribute_UserEnv = "UserEnv";
	public static String CITY_CODE = "341700";
	
	/**
	 * 目录的分隔符
	 */
	public static final String PATH_SEPARATOR = System.getProperty("path.separator");
	
	/**
	 * 文件的分隔符
	 */
	public static final String FILE_SEPARATOR = System.getProperty("file.separator");
	
	public final static String sessionOutMsg = "用户会话失效，请重新登录！";
	public final static String menuRequestErrorMsg = "菜单访问方式不正确！";
	public final static String menuRightErrorMsg = "对不起，您没有此菜单访问权限！";
	public final static String actionRightErrorMsg = "对不起，您没有此操作权限！";
	public final static String importFileTypeErrorMsg = "导入文件类型必须是xls文件!";
	public final static String importFileErrorMsg = "上传文件失败!";
	public final static String ADMIN_ROLE_ID = "0";
	public final static String YUNWEI_ROLE_ID = "E1D3E3A7D05144979DD5620D7564C57C";
	/**
	 * 文件附件临时文件g
	 */
	public final static String ATTACHMENT_PATH="temp";
	
	/**
	 * 文件上传文件大小最大限制
	 */
	public final static long FILE_UPLOAD_MAX_SIZE=104857600L;//100Mb
	
	/**
	 * 多数据库连接参数定义
	 */
	public final static String DB_TYPE_ALL="ALL";//聚合
	public final static String DB_TYPE_TIS="TIS";//游客采样
	public final static String DB_TYPE_CSMS="CSMS";//小区短信
	public final static String CUR_CHOOSE_CITY="curChooseCity";//当前切换的地市
	public final static String TEMP_DB_TYPE="tempDsType";//临时
	public final static String TEMP_ORG_CODE="tempOrgCode";//临时
	public final static String DS_CODE_ALL="340000";
	public final static String SCRIPT_SESSION_KEY="ScriptSessionKey";
	public final static String MENU_DB_TYPE_CSMS="0";
	public final static String MENU_DB_TYPE_TIS="1";
	public final static String MENU_DB_TYPE_BOTH="2";
	
	/**
	 * 福州618使用参数
	 */
	public final static String FZ618_COMMON_TYPE="FZ618";
	public final static String FZ618_SMSCOUNT_WORKORDERID="FZ618_SMSCOUNT_WORKORDERID";
	public final static String FZ618_FLOW_BEGIN_DATE="FZ618_FLOW_BEGIN_DATE";
	public final static String FZ618_FLOW_FILTER_ECCODE="FZ618_FLOW_FILTER_ECCODE";
	public final static String FZ618_REFRESH_TIME="FZ618_REFRESH_TIME";
	public final static String FZ618_MONITOR_BEGIN_DATE="FZ618_MONITOR_BEGIN_DATE";
	public final static String FZ618_CHINA_MOBILE_PERCENT="FZ618_CHINA_MOBILE_PERCENT";
	public final static String FZ618_FLOW_INFOS_COUNT="FZ618_FLOW_INFOS_COUNT";
	
	/**
	 * 未登录连接省库
	 * */
	public final static String DB_INTEGR_590="CSMS_590";
	
	
	/**
	 * 用户比例在Common表中的标识
	 */
	public final static String MOBILE_USER_PERCENT="MOBILE_USER_PERCENT";
	/**
	 * 提交县市在Common表中的标识
	 */
	public final static String SUBMIT_COUNTY="SUBMIT_COUNTY";
	/**
	 * 全局短信配置发送开始时间在Common表中的标识
	 */
	public final static String OVERALLA_SITUAITON_CONFIG_OUTSMS_STARTTIME="OVERALLA_SITUAITON_CONFIG_OUTSMS_STARTTIME";
	/**
	 * 全局短信配置发送结束时间在Common表中的标识
	 */
	public final static String OVERALLA_SITUAITON_CONFIG_OUTSMS_ENDTIME="OVERALLA_SITUAITON_CONFIG_OUTSMS_ENDTIME";
	/**
	 * 全局短信配置发送时间间隔在Common表中的标识
	 */
	public final static String OVERALLA_SITUAITON_CONFIG_OUTSMS_QUERY_INTEVAL="OVERALLA_SITUAITON_CONFIG_OUTSMS_QUERY_INTEVAL";
	
	/**
	 * 工单管理－工单状态
	 * -1已删除；1：正常；2：关闭；3：驳回；4：待审核；5：草稿；6：草稿（接口同步）；7：已结束（完成发送数量或超出工单发送日期）等
	 */
	public final static Long WORKORDER_STATUS_DEL=-1L;
	public final static Long WORKORDER_STATUS_NORMAL=1L;
	public final static Long WORKORDER_STATUS_CLOSE=2L;
	public final static Long WORKORDER_STATUS_RETURN=3L;
	public final static Long WORKORDER_STATUS_TODOCHECK=4L;
	public final static Long WORKORDER_STATUS_ZZ_TODOCHECK=9L;
	public final static Long WORKORDER_STATUS_DRAFT=5L;
	public final static Long WORKORDER_STATUS_DRAFT_FROMAPI=6L;
	public final static Long WORKORDER_STATUS_ENDED=7L;
	/**
	 * 工单管理－工单日志状态
	 * 工单操作状态：-1：删除；1：启用；2：暂停；3：审批驳回；4：审批通过；5：提交审批等
	 */
	public final static Long WORKORDER_LOG_STATUS_DEL=-1L;
	public final static Long WORKORDER_LOG_STATUS_START=1L;
	public final static Long WORKORDER_LOG_STATUS_PAUSE=2L;
	public final static Long WORKORDER_LOG_STATUS_RETURN=3L;
	public final static Long WORKORDER_LOG_STATUS_PASS=4L;
	public final static Long WORKORDER_LOG_STATUS_SUTMIT=5L;
	/**
	 * 工单管理－默认发送时间间隔
	 */
	public final static Long WORKORDER_WORKORDERSENDINTERVAL=99999L;
	
	/**
	 * 工单管理-工单信息
	 */
	public final static String WORKORDER_CUSTOMER_MANAGER="宁德电业局";
	public final static Long WORKORDER_MANAGER_TYPE=1L;
	public final static String WORKORDER_BUILD_TYPE="1";
	
	/**
	 * 漳州市编码
	 */
	public final static String CITY_CODE_ZZ="596";
	/**
	 * 国际用户代码
	 */
	public final static Long INTER_USER_CODE=595L;
	
	/**
	 * ADC交互相关参数
	 */
	public final static String ADC_LOGIN_BIZCODE="ADC_LOGIN_BIZCODE";//业务编码
	public final static String ADC_LOGIN_REQUEST_WEBSERVICES_URL="ADC_LOGIN_REQUEST_WEBSERVICES_URL";//登录时请求的url地址在Common表中的Key
	public final static String ADC_SI_APP_ID="ADC_SI_APP_ID";//本系统在ADC中注册的标识在Common表中的Key
	public final static String ADC_REQUEST_TRANSID="ADC_REQUEST_TRANSID";//流水号，组成方式：”SI”＋8位日期＋6位唯一数，每天从000001开始，如SI20060801000001
	public final static String ADC_LOGIN_METHOD="AdcSiInterface";//流水号，组成方式：”SI”＋8位日期＋6位唯一数，每天从000001开始，如SI20060801000001
	public final static Long OPERATOR_TYPE_ADC=1L;
	
	/**
	 * 获取当前的输出路径,适用WEB-INF目录与BIN目录
	 * @return 输出路径
	 */
	public static String getOutputPath(){
		String path = "";		
		
		String pathInfo = Constants.class.getProtectionDomain().getCodeSource()
			.getLocation().getPath().toUpperCase();
		
		//Windows 环境输出需要去除第一个字符
		if (isWindows()) {
			pathInfo = pathInfo.substring(1);
			path = pathInfo;
		}else{
			path = pathInfo;
		}
		
		//当前项目
		if(pathInfo.indexOf("CLASSES") > -1){
			path = pathInfo.substring(0, pathInfo.lastIndexOf("CLASSES") + 7);
		}else if(pathInfo.indexOf("WEB-INF") > -1){
			path = pathInfo.substring(0, pathInfo.lastIndexOf("WEB-INF") + 7) + FILE_SEPARATOR + "CLASSES";
		}else{
			path = getAppPath() + "BIN";
		}
		
		return path;
	}
	
	/**
	 * 获取应用的主目录
	 * @return 应用的主目录
	 */
	public static String getAppPath(){
		String path = "";		
		
		String pathInfo = Constants.class.getProtectionDomain().getCodeSource()
				.getLocation().getPath();
		
		//Windows 环境输出需要去除第一个字符
		if (isWindows()) {
			pathInfo = pathInfo.substring(1);
			path = pathInfo;
		}else{
			path = pathInfo;
		}
		
		//当前项目
		if(pathInfo.indexOf("WEB-INF") > -1){
			path = pathInfo.substring(0, pathInfo.lastIndexOf("WEB-INF"));
		}else{
			path = System.getProperty("user.dir");
		}
		
		return path;
	}
	
	/** 
	 * 是否为Windows系统
	 * @return True是Windows系统 
	 */
	public static final boolean isWindows()
	{
		return getOS().startsWith("Windows");
	}
	
	/**
	 * 系统类型
	 * @return 系统类型
	 */
	public static final String getOS()
	{
		return System.getProperty("os.name");
	}
}
