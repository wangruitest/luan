package com.funo.report;

import java.util.Arrays;

public final class StringUtil {
	
	/**
	 * 验证字符串是否为空
	 * @param string
	 * @return
	 */
	public static boolean isEmpty(String string) {
		boolean result = false;
		if(string == null || "".equals(string.trim())){
			result = true;
		}
		return result;
	}

	/**
	 * 将数字字符串转化为int型
	 * @param srcInt
	 * @return int
	 */
	public static int doNullInt(String srcInt) {
		if (srcInt == null || "".equals(srcInt))
			return 0;
		return Integer.parseInt(srcInt);
	}
	
	public static int doNullInt(Object obj) {
		String srcInt = doNullStr(obj);
		if (srcInt == null || "".equals(srcInt))
			return 0;
		return Integer.parseInt(srcInt);
	}

	/**
	 * 将数字字符串转化为long型
	 * @param srcInt
	 * @return
	 */
	public static long doNullLong(String srcInt) {
		if (srcInt == null || "".equals(srcInt))
			return 0;
		return Long.parseLong(srcInt);
	}
	
	public static long doNullLong(Object obj) {
		String srcInt = doNullStr(obj);
		if (srcInt == null || "".equals(srcInt))
			return 0;
		return Long.parseLong(srcInt);
	}

	/**
	 * 转化为字符串
	 * @param obj Object
	 * @return String
	 */
	public static String doNullStr(Object obj) {
		String str = "";
		if (obj != null) {
			str = String.valueOf(obj);
			if (str.equals("null")) {
				str = "";
			}
		}
		return str;
	}

	
	public static Integer doNullInteger(Object obj) {
		String str = doNullStr(obj);
	    if (isEmpty(str)) {
	        str = "0";
	      } else {
	        int i = str.indexOf(".");
	        if (i > 0) {
	          str = str.substring(0, i);
	        }
	      }
	      return Integer.valueOf(str);
	}

	/**
	 * 验证字符串数组是否为空
	 * @param string
	 * @return
	 */
	public static boolean isEmpty(String[] string){
		return string == null || string.length == 0;
	}

	/**
	 * 对字符串进行操作，对于小于指定长度的字符，在其右方按特定字符进行补足。
	 * 
	 * <pre>
	 * 示例：
	 * 	String stringUtils = &quot;abc&quot;;
	 * 	System.out.println(StringUtils.padRight(stringUtils, 5, '0'));
	 * 输出结果为：abc00；
	 * </pre>
	 * 
	 * @param value
	 *            输入值
	 * @param totalWidth
	 *            总长度
	 * @param paddingChar
	 *            不足时填充的字符
	 * @return 重新计算后的字符。
	 */
	public static String padRight(String value, int totalWidth, char paddingChar) {
		String temp = value;
		if (value.length() > totalWidth) {
			return value;
		} else {
			while (temp.length() < totalWidth) {
				temp = temp + paddingChar;
			}
			return temp;
		}
	}

	/**
	 * 对字符串进行操作，对于小于指定长度的字符，在其左方按特定字符进行补足。 示例：
	 * 
	 * <pre>
	 * String stringUtils = &quot;abc&quot;;
	 * System.out.println(StringUtils.padLeft(stringUtils, 5, '0'));
	 * </pre>
	 * 
	 * 输出结果为：00abc；
	 * 
	 * @param value
	 *            输入值
	 * @param totalWidth
	 *            总长度
	 * @param paddingChar
	 *            不足时填充的字符
	 * @return 重新计算后的字符。
	 */
	public static String padLeft(String value, int totalWidth, char paddingChar) {
		String temp = value;
		if (value.length() > totalWidth) {
			return value;
		} else {
			while (temp.length() < totalWidth) {
				temp = paddingChar + temp;
			}
			return temp;
		}
	}

	/**
	 * java trim()重写，取出字符串前后空格
	 * add 2009-5-5 by sumfing
	 * */
	public static String reTrimByString(String value){
		String reValue;
		if(value == null || value.equals("")){
			reValue = "";
		}else{
			reValue = value.trim();
		}
		return reValue;
	}

	public static String reTrimByObject(Object obj){
		String reValue;
		if(obj == null || obj.equals("")){
			reValue = "";
		}else{
			reValue = String.valueOf(obj).trim();
		}
		return reValue;
	}


	/**
	 * 类似String.indexOf()
	 * 返回字符串在数组中的位置
	 * @param strArr
	 * @param str
	 * @return
	 */
	public static int indexOfStringArray(String[] strArr,String str){
		int index = -1;
		if(strArr != null && str != null){
			for(int i=0;i<strArr.length;i++){
				if(str.equals(strArr[i])){
					index = i;
					break;
				}
			}
		}
		return index;
	}

	/**
	 * 替换特定的字符串，替换位置为第一次遇到的
	 * @param whole 完整的字符串
	 * @param strold 要被替换的字符串
	 * @param strnew 替换的字符串
	 * @return 
	 */
	public static String replaceFirst(String whole,String strold,String strnew){

		if(whole.indexOf(strold)>-1&&strnew!=null){
			String whole_one =  whole.substring(0, whole.indexOf(strold));
			String whole_two =  whole.substring(whole.indexOf(strold)+strold.length());
			whole =  whole_one+strnew+whole_two;
		}

		return whole;
	}

	/**
	 * 将String数组转换为Long类型数组
	 * @param strs
	 * @return
	 */
	public static Long[] convertionToLong(String[] strs){
		Long[] longs = null;
		if(!isEmpty(strs)){
			longs = new Long[strs.length];
			for(int i=0;i<strs.length;i++){
				String str = strs[i];
				long thelong = Long.valueOf(str);
				longs[i] = thelong;
			}
		}
		return longs;
	}
	
	/**
	 * 将String转换为Long类型数组
	 * @param strs
	 * @param splitChar 分割字符
	 * @return
	 */
	public static Long[] convertionToLongArr(String strs,String splitChar){
		if(isEmpty(splitChar))splitChar = ",";
		Long[] result = null;
		if(!StringUtil.isEmpty(strs)){
			String[] ids = strs.split(splitChar);
			result = new Long[ids.length];
			for(int i=0; i<ids.length; i++){
				result[i] = new Long(ids[i]);
			}
		}
		return result;
	}

	/**
	 * Long[] 转成 String
	 * @param l
	 * @param splitChar
	 * @return
	 */
	public static String convertionLongToString(Long[] l,String splitChar){
		String result = null;
		if(l != null){
			result = Arrays.toString(l);
			result = result.substring(1, result.length()-1);
			if(!StringUtil.isEmpty(splitChar)){
				result = result.replaceAll(",", splitChar);
			}
		}
		return result;
	}

	/**
	 * 字符编码转换
	 * @param str
	 * @return
	 * @throws Exception
	 */
	public static String charEncoding(String str){
		try{
			str = java.net.URLDecoder.decode(str, "UTF-8");
		}catch(Exception e){
			str = null;
		}finally{
			return str;
		}
	}
	
	  /**
	   * 将字符串str里的某些字符sregex转义成指定的字符sreplace
	   * @param str
	   * @param sregex
	   * @param sreplace
	   * @return String
	   */
	  public static String getStrTransMean(String str, String sregex,String sreplace) {
		  if(!StringUtil.isEmpty(str)){
			  str = str.replaceAll(sregex, sreplace);
		  }
		  return str;
	  }


}