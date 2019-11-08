package com.funo.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.lang.StringUtils;

public class QueryMgt {
	
	/**
	 * 根据传入的值获取对应的工单优先级名称
	 * @param str
	 * @return
	 */
	public String getWorkerorderPriorityName(String str) {
		try {
			int res = Integer.valueOf(str);
			switch (res) {
			case 1:
				return "最低";
			case 2:
				return "较低";
			case 3:
				return "中等";
			case 4:
				return "较高";
			case 5:
				return "最高";
			default:
				return "匹配错误";

			}
		} catch (Exception e) {
			return "匹配错误";
		}
	}
	
	/**
	 * 根据传入的值获取对应的小区类型名称
	 * @param str
	 * @return
	 */
	public String getCellTypeName(String str) {
		try {
			int res = Integer.valueOf(str);
			switch (res) {
			case 1:
				return "2G";
			case 2:
				return "3G";
			default:
				return "匹配错误";	
			}
		} catch (Exception e) {
			return "匹配错误";
		}
	}
	
	public static String getCellTypeName(Integer index) {
		switch (index) {
		case 1:
			return "2G";
		case 2:
			return "3G";
		default:
			return "匹配错误";	
		}
	}
	/**
	 * 判断是否是手机号码
	 * @param mobiles
	 * @return
	 */
	static public boolean isMobileNO(String mobiles){        
        Pattern p = Pattern.compile("^((13[0-9])|147|(15[^4,\\D])|(18[0,2,5-9]))\\d{8}$");        
        Matcher m = p.matcher(mobiles);                
        return m.matches();        
    }
	
	/**
	 * 判断是否为小于1的正浮点数,保留两位小数
	 * @return
	 */
	public static boolean isFloat(String str) {
		Pattern p = Pattern.compile("(0\\.\\d{1}[1-9])|(0\\.[1-9]\\d?)");        
        Matcher m = p.matcher(str);
        return m.matches();
	}
	
	/**
	 * 判断是否为正浮点数
	 * @param str
	 * @return 若未正浮点数返回true,否则返回false
	 */
	public static boolean isPositiveFloat(String str) {
		try {
			float f = Float.parseFloat(str);
			if(f <= 0) {
				return false;
			}
		} catch(Exception e) {
			return false;
		}
		return true;
	}
	
	public boolean isShowFujian(Integer integer) {
		if(integer == 5) {
			return false;
		}
		return true;
	}
	
	public String formatTarffic(String str) {
		if(str.equals("")) {
			return "";
		}
		return String.valueOf(Float.valueOf(str)/100) + "元";
	}
	
	/*
	 * 统计用金额计算，不显示"元"
	 * */
	public String formatTarffictj(String str) {
		if(str.equals("")) {
			return "";
		}
		if(str.equals("0")){
			return String.valueOf(Long.valueOf(str)/100);
		} else {
			return String.valueOf(Float.valueOf(str)/100);
		}
		
	}
	/**
	 * 发送对象解析，从数据库二进制字符串解析至页面整型数组
	 * @param str
	 * @return
	 */
	public static Integer[] receiveObjectStrToInt(String str) {
		ArrayList<Integer> intList = new ArrayList<Integer>(); 
		char[] aChar = str.toCharArray();
		for(int i=0; i<aChar.length; i++) {
			if(aChar[i] != '0') {
				String str1 = String.valueOf(aChar[i]);
				for(int j=0; j<2-i; j++) {
					str1 += "0";
				}
				intList.add(Integer.valueOf(str1));
			}
		}
		Integer[] aInt = new Integer[intList.size()];
		for(int i=0; i<aInt.length; i++) {
			aInt[i] = Integer.parseInt(intList.get(i).toString(),2);
		}
		return aInt;
	}
	
	/**
	 * 发送对象解析，从页面整型数组解析至数据库二进制字符串
	 * @param aInt
	 * @return
	 */
	public static String receiveObjectIntToStr(Integer[] aInt) {
		Integer receiveObject = 0;
		for(int i=0; i<aInt.length; i++) {
			receiveObject += aInt[i];
		}
		String str = Integer.toBinaryString(receiveObject);
		int k = str.length();
		for(int i=0; i<(3-k); i++) {
			str = "0" + str;
		}
		return str;
	}
	
	
	/**
	 * 验证是否是有效的IP及端口地址
	 * @param str String 
	 * @return 
	 */
	public static boolean isIpPort(String str) {
		String[] aStr = str.split(":");
		Pattern p1 = Pattern.compile("(25[0-5]|2[0-4]\\d|1\\d{2}|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d{2}|[1-9]?\\d)){3}");        
	    Matcher m1 = p1.matcher(aStr[0]);
	    if(!m1.matches() || aStr.length == 1) {
	    	return m1.matches(); 
	    }
	    if(aStr.length > 2) {
	    	return false;
	    }
	    Pattern p2 = Pattern.compile("[1-9]\\d{0,4}");
	    Matcher m2 = p2.matcher(aStr[1]);
	    if(!m2.matches()) {
	    	return false;
	    }
		if(aStr[1].length()>5) {
			return false;
		}
	    if(Integer.valueOf(aStr[1]) > 65535) {
	    	return false;
	    }
	    return true;
	}
	
	/**
	 * 验证是否纯数字(正整数)
	 * @param str
	 * @return
	 */
	public static boolean isNumber(String str) {
		Pattern p = Pattern.compile("\\d+");        
	    Matcher m = p.matcher(str);
	    return m.matches(); 
	}
	
	public String formatBusinessMoney(String str) {
		long money = 0;
		if(StringUtils.isNotBlank(str)){
			money = Long.valueOf(str);
		}
		if(money==0){
			return "0元";
		}else{
			return String.valueOf(new DecimalFormat("#0.00").format(money/100.0)) + "元";
		}
	}
	
	
	/**
	 * 小区经度验证
	 * @param longitude String 小区经度
	 * @return boolean 正确返回true;错误返回false
	 */
	public static boolean isLongitude(String longitude) {
		Pattern p = Pattern.compile("11[7-9](\\.\\d+)?");        
	    Matcher m = p.matcher(longitude);
	    return m.matches(); 
	}
	
	/**
	 * 小区纬度验证
	 * @param latitude String 小区纬度
	 * @return boolean 正确返回true;错误返回false
	 */
	public static boolean isLatitude(String latitude) {
		Pattern p = Pattern.compile("2[4-6](\\.\\d*)?");        
	    Matcher m = p.matcher(latitude);
	    return m.matches(); 
	}
	
	public String getBlacklistSourceName(Byte source) {
		switch(source) {
		case 1:
			return "管理员添加";
		case 2:
			return "用户投诉";
		case 3:
			return "用户自动屏蔽";
		default:
			return "匹配错误";
		}
	}
	
	
	public static boolean validMoney(String money){
		Pattern pt = Pattern.compile("(^0(\\.[0-9]{1,2})?$)|(^[1-9][0-9]*(\\.[0-9]{1,2})?$)");
		Matcher pm =  pt.matcher(money);
		return pm.matches();
	}
	
	/**
	 * 格式化工单时间间隔
	 * @param str
	 * @return
	 */
	public String formatWorkorderSendinterval(String str) {
		if(str == null) {
			return "无";
		}
		if(str.equals("")) {
			return "无";
		}
		return str + "小时";
	}
	
	
	/**
	 * 获取告警短信类型名称
	 * 
	 * @param str String
	 * @return String
	 */
	public String getSysAlarmSmsTypeName(String str) {
		try {
			int res = Integer.valueOf(str);
			switch (res) {
			case 1: return "系统告警"; 
			case 2: return "业务告警"; 
			case 3: return "测试短信";
			default:
				return "";
			}
		} catch (Exception e) {
			return "";
		}
	}
	
	/**
	 * 获取外呼短信结果
	 * @param str String
	 * @return String
	 */
	public String getSmsoutres(String str) {
		try {
			int res = Integer.valueOf(str);
			switch (res) {
			case -2:
				return "接收失败";
			case -1:
				return "取消发送";
			case 0:
				return "已送达";
			case 1:
				return "已发送";
			case 2:
				return "待发送";
			case 3:
				return "发送失败";
			case 9:
				return "发送失败(异常)";
			default:
				return "匹配错误";		
			}
		} catch (Exception e) {
			return "匹配错误";
		}
	}
	
	public static String getErrorAlarmLogSystemName(String str) {
		try {
			int res = Integer.valueOf(str)/100;
			switch (res) {
			case 0:
				return "系统监控进程";
			case 1:
				return "数据采集进程";
			case 2:
				return "话单入库进程";
			case 3:
				return "规则处理进程";
			default:
				return "匹配错误";
			}
		} catch(Exception e) {
			return "匹配错误";
		}
	}
	
	public String getManageTypeName(String str) {
		if(StringUtils.isBlank(str)) {
			return "匹配错误";
		}
		int index = Integer.parseInt(str);
		switch(index) {
		case 1:
			return "代理商";
		case 2:
			return "客户经理";
		default:
			return "匹配错误";
		}
	}
	
	/*
	 * 统计报表中managerTypeName到的
	 * */
	public String getAddManageTypeName(String str) {
		if(StringUtils.isBlank(str)) {
			return "匹配错误";
		}
		int index = Integer.parseInt(str);
		switch(index) {
		case 1:
			return "代理商";
		case 2:
			return "客户经理";
		case 3:
			return "    ";
		default:
			return "匹配错误";
		}
	}
	
	/**
	 * 由于JXL读取EXCEL数据时,有时出现数值精度问题,<br/>
	 * 如:128.20579读取成128.20579000002或128.205789999998<br/>
	 * 现对这些数值统一进行精度处理
	 * @return
	 */
	public static String formatCellLngLat(String str) {
		str = delTailZero(str);
		if(str.length() > 15) {
			double f = Double.parseDouble(str);
			BigDecimal b = new BigDecimal(f);
			double f1 = b.setScale(10, BigDecimal.ROUND_HALF_UP).doubleValue();
			str = delTailZero(String.valueOf(f1));
		}
		return str;
	}
	
	/**
	 * 将数值(字符串)中尾数为0的部分全部删除,<br/>
	 * @param str
	 * @return
	 */
	public static String delTailZero(String str) {
		char[] aChar = str.toCharArray();
		int index = 0;
		for(int i=aChar.length-1; i<0; i--) {
			if(aChar[i] != '0') {
				index = i;
				break;
			}
		}
		String str0 = "";
		if(index == 0) {
			str0 = str;
		} else {
			for(int i=0; i<=index; i++) {
				str0 += String.valueOf(aChar[i]);
			}
		}
		return str0;
	}
	
	public String formatMonitorStr(String str) {
		return str.replaceAll(";", ";<br/>");
	}
	
	public String getBusinessChargeApplyStatusName(Integer status) {
		switch(status.intValue()) {
			case 0 : return "待审核";
			case 1 : return "审核通过";
			case 2 : return "审核不通过";
			default : return "匹配错误";
		}
	}
	
	/**
	 * 将字符串中的 \ % _ 转换为\\ \% \_
	 * @param str
	 * @return
	 */
	public String formatSpecialCharacters(String str) {
		str = str.replaceAll("\\\\", "\\\\\\\\");
		str = str.replaceAll("%", "\\\\%");
		str = str.replaceAll("_", "\\\\_");
		return str;
	}

}
