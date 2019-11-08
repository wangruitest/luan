package com.funo.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.funo.system.model.SysOperator;
import com.funo.utils.ApplicationContext;
import com.funo.utils.Constants;
import com.funo.utils.SessionOutException;

/**
 * 登录验证
 * 
 */

public class SessionOutFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		HttpSession session = request.getSession();
		if (session != null) {
			SysOperator user = null;
			if (session.getAttribute(Constants.Session_Attribute_UserEnv) != null) {
				user = (SysOperator) session
						.getAttribute(Constants.Session_Attribute_UserEnv);
			}
			// 判断用户是否已经登录
			if (user == null ) {
				throw new SessionOutException(Constants.sessionOutMsg);
			}
			
			// 判断用户是否已经登录
//			if (!ApplicationContext.validSessionId(user.getUnid(), session
//					.getId())) {
//				session.removeAttribute(Constants.Session_Attribute_UserEnv);
//				throw new SessionOutException(Constants.sessionOutMsg);
//			}
			filterChain.doFilter(request, response);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

	public static void checkUserNull() {
		// 获取用户session信息
		HttpSession session = ApplicationContext.getDwrSession();
		if (session != null) {
			SysOperator user = null;
			if (session.getAttribute(Constants.Session_Attribute_UserEnv) != null) {
				user = (SysOperator) session
						.getAttribute(Constants.Session_Attribute_UserEnv);
			}

			// 判断用户是否已经登录
			if (user == null) {
				throw new SessionOutException(Constants.sessionOutMsg);
			}
			// 判断是否重复登录
//			if (!ApplicationContext.validSessionId(user.getUnid(), session
//					.getId())) {
//				session.removeAttribute(Constants.Session_Attribute_UserEnv);
//				throw new SessionOutException(Constants.sessionOutMsg);
//			}
		}
	}

	public static void checkSessionInfo() throws IOException {
		// 获取用户session信息
		HttpSession session = ApplicationContext.getDwrSession();
		if (session != null) {
			SysOperator user = null;
			if (session.getAttribute(Constants.Session_Attribute_UserEnv) != null) {
				user = (SysOperator) session
						.getAttribute(Constants.Session_Attribute_UserEnv);
			}

			// 判断用户是否已经登录
			if (user == null) {
				throw new SessionOutException(Constants.sessionOutMsg);
			}
			// 判断是否重复登录
			if (!ApplicationContext.validSessionId(user.getUnid(), session
					.getId())) {
				session.removeAttribute(Constants.Session_Attribute_UserEnv);
				throw new SessionOutException(Constants.sessionOutMsg);
			}
		}
	}
}
