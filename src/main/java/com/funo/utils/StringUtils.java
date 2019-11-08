// ~ CopyRight © 2016 AHZY  SOFTWARE CO.LTD All Rights Reserved.
package com.funo.utils;

/**
 * 描述：StringUtils
 * <br />@version:1.0.0
 * <br />@author 吴宝龙
 * <br />@email： wubaolongzy@ahmobile.com
 * <br />@date： 2016年2月2日 下午2:21:31
 * <br />CopyRight © 2016 AHZY All Rights Reserved.
 */
public class StringUtils {

	public static Long stringToLong(String str){
		Long l=0L;
		try {
			l=Long.parseLong(str);
		} catch (NumberFormatException e) {
			// TODO: handle exception
			l=0L;
		}
		return l;
	}
}
