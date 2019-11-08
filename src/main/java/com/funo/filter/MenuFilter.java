package com.funo.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import com.funo.system.model.SysMenu;
import com.funo.system.model.SysOperator;
import com.funo.utils.Constants;
import com.funo.utils.MenuFilterException;
import com.funo.utils.SessionOutException;

/**
 * 菜单权限验证
 * 
 */

public class MenuFilter implements Filter {
	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		HttpSession session = request.getSession();
		if (null==session) {
			throw new SessionOutException(Constants.sessionOutMsg);
		}else{
			SysOperator user = null;
			if (session.getAttribute(Constants.Session_Attribute_UserEnv) != null) {
				user = (SysOperator) session
						.getAttribute(Constants.Session_Attribute_UserEnv);
			}
			// 判断用户是否已经登录
			if (user == null) {
				throw new SessionOutException(Constants.sessionOutMsg);
			}
			
			//临时处理
			String specialPage="/Select_CellCfg_Manager_For_Workorder.jsp#/Select_CellCfg_Manager.jsp#/" +
					"Select_Mas_Manager.jsp#/Mas592_Manager.jsp#/Mas595_Manager.jsp#/Mas596_Manager.jsp#/Mas597_Manager.jsp#/" +
					"Workorder_Editor.jsp#/SendareaCfg_Manager.jsp#/CellCfg_Manager.jsp#/Mas591_Manager.jsp#";
			String currentPage=request.getRequestURI();
			currentPage=currentPage.substring(currentPage.lastIndexOf("/"),currentPage.length());
			if(specialPage.indexOf(currentPage)<0 && request.getRequestURI().indexOf("/readonlypage/")<0){
				String menuId=request.getParameter("unid");
				//菜单访问必须带上id
				if(StringUtils.isEmpty(menuId)){
					throw new MenuFilterException(Constants.menuRequestErrorMsg);
				}
				//查看当前用户有无此菜单权限
				List<SysMenu> menus=user.getMenus();
				SysMenu curMenu=null;
				if(null==menus)throw new MenuFilterException(Constants.menuRightErrorMsg);
				boolean hasRightOpenMenu=false;
				for (int i = 0; i < menus.size(); i++) {
					if(menuId.equals(menus.get(i).getUnid())){
						hasRightOpenMenu=true;
						curMenu=menus.get(i);
						break;
					}
				}
				if(!hasRightOpenMenu)throw new MenuFilterException(Constants.menuRightErrorMsg);
				
				if(null!=curMenu){
					Map<String,Object> scriptSession=new HashMap<String,Object>();
					if(null!=user.getOtherParams().get(Constants.SCRIPT_SESSION_KEY)){
						scriptSession=(Map<String,Object>)user.getOtherParams().get(Constants.SCRIPT_SESSION_KEY);
					}
					scriptSession.put(request.getRequestURI(), curMenu);
					user.getOtherParams().put(Constants.SCRIPT_SESSION_KEY, scriptSession);
				}
			}
			
			filterChain.doFilter(request, response);
		}
		
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

	
}
