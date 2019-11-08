package com.funo.utils;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.directwebremoting.WebContextFactory;

import com.funo.system.model.SysOperator;

public class ApplicationContext {
	protected static Log logger = LogFactory.getLog(ApplicationContext.class);

	private static Map<String, String> userSessionIds = new HashMap<String, String>();


	/**
	 * 验证SessionId的是否合法（去除重新登录）
	 * 
	 * @param customerId
	 * @param sessionId
	 * @return
	 */
	public static boolean validSessionId(String customerId, String sessionId) {
		if (userSessionIds.containsKey(customerId)
				&& userSessionIds.get(customerId).equals(sessionId)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 合法登录时记录SessionId
	 * 
	 * @param customerId
	 * @param sessionId
	 */
	public static void putSessionId(String customerId, String sessionId) {
		userSessionIds.put(customerId, sessionId);
	}

	public static HttpSession getDwrSession() {
		HttpSession httpSession=getHttpSesstion();
		if (httpSession != null) {
			if (httpSession.getAttribute(Constants.Session_Attribute_UserEnv) != null) {
				SysOperator user = (SysOperator) httpSession
						.getAttribute(Constants.Session_Attribute_UserEnv);
				if (user == null) {
					throw new SessionOutException("用户会话失效，请重新登录！");
				}
			} else {
				throw new SessionOutException("用户会话失效，请重新登录！");
			}
		}

		return httpSession;
	}
	
	public static HttpSession getHttpSesstion(){
		HttpSession httpSession = (null == WebContextFactory.get()) ? null
				: WebContextFactory.get().getSession();
		return httpSession;
	}

	public static HttpServletRequest getDwrRequest() {

		return (null == WebContextFactory.get()) ? null : WebContextFactory
				.get().getHttpServletRequest();
	}

	public static HttpServletResponse getDwrResponse() {
		return (null == WebContextFactory.get()) ? null : WebContextFactory
				.get().getHttpServletResponse();
	}

	private static Map<Integer, Integer> formCode = new HashMap<Integer, Integer>();

	private static String dateCode = "";

	public static String getYear() {
		return DateUtils.formatDate(new Date(), "yyyy");
	}

	public static String getDate() {
		String today = DateUtils.formatDate(new Date(), "MMddHHmmss");
		if (!today.equals(dateCode)) {
			dateCode = today;
			formCode.clear();
		}
		return dateCode;
	}

	public static String getFormCode(Integer formType) {
		String today = DateUtils.formatDate(new Date(), "MMddHHmmss");
		if (!today.equals(dateCode)) {
			dateCode = today;
			formCode.clear();
		}
		if (!formCode.containsKey(formType)) {
			formCode.put(formType, 1);
			return "01";
		}
		int num = formCode.get(formType).intValue() + 1;
		if (num > 99)
			num = 1;

		formCode.put(formType, num);
		if (num < 10)
			return "0" + num;
		else
			return "" + num;
	}

	public static String getRealPath(String path) {
		HttpSession session = getDwrSession();
		String formPath = "";
		if (session != null) {
			formPath = session.getServletContext().getRealPath(path);
			formPath = formPath.replaceAll("\\\\", "/");
		}
		return formPath;
	}

}
