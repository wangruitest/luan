package com.funo.system.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContextFactory;

import com.funo.base.other.BusinessException;
import com.funo.basecommon.mgmt.ICommonMgmt;
import com.funo.common.ActionResult;
import com.funo.sysloginlog.mgmt.ISysLoginLogMgmt;
import com.funo.sysloginlog.model.SysLoginLog;
import com.funo.system.mgmt.ISysMenuMgmt;
import com.funo.system.mgmt.ISysOperatorMgmt;
import com.funo.system.mgmt.ISysRoleMgmt;
import com.funo.system.model.SysOperator;
import com.funo.userbusinesscfg.mgmt.IUserBusinessCfgMgmt;
import com.funo.utils.ApplicationContext;
import com.funo.utils.Constants;
import com.funo.utils.CyptoUtils;
import com.funo.utils.Des;
import com.funo.utils.Md5PwdEncoder;

public class LoginAction {
	private ISysOperatorMgmt sysOperatorMgmt;
	private ISysRoleMgmt sysRoleMgmt;
	private ISysMenuMgmt sysMenuMgmt;
	private ICommonMgmt commonMgmt;
	private IUserBusinessCfgMgmt userBusinessCfgMgmt;
	
	private ISysLoginLogMgmt sysLoginLogMgmt;

	public ISysLoginLogMgmt getSysLoginLogMgmt() {
		return sysLoginLogMgmt;
	}
	public void setSysLoginLogMgmt(ISysLoginLogMgmt sysLoginLogMgmt) {
		this.sysLoginLogMgmt = sysLoginLogMgmt;
	}

	public IUserBusinessCfgMgmt getUserBusinessCfgMgmt() {
		return userBusinessCfgMgmt;
	}
	public void setUserBusinessCfgMgmt(IUserBusinessCfgMgmt userBusinessCfgMgmt) {
		this.userBusinessCfgMgmt = userBusinessCfgMgmt;
	}

	public ICommonMgmt getCommonMgmt() {
		return commonMgmt;
	}
	public void setCommonMgmt(ICommonMgmt commonMgmt) {
		this.commonMgmt = commonMgmt;
	}
	
	public ISysOperatorMgmt getSysOperatorMgmt() {
		return sysOperatorMgmt;
	}
	public void setSysOperatorMgmt(ISysOperatorMgmt sysOperatorMgmt) {
		this.sysOperatorMgmt = sysOperatorMgmt;
	}
	public ISysMenuMgmt getSysMenuMgmt() {
		return sysMenuMgmt;
	}
	public void setSysMenuMgmt(ISysMenuMgmt sysMenuMgmt) {
		this.sysMenuMgmt = sysMenuMgmt;
	}
	public ISysRoleMgmt getSysRoleMgmt() {
		return sysRoleMgmt;
	}
	public void setSysRoleMgmt(ISysRoleMgmt sysRoleMgmt) {
		this.sysRoleMgmt = sysRoleMgmt;
	}
	
	public static HttpSession getDwrSession() {
		System.out.println("run LoginAction.getDwrSession");
		System.out.println("null == WebContextFactory.get() is ["+null == WebContextFactory.get()+"]");
		HttpSession result=(null == WebContextFactory.get()) ? null : WebContextFactory.get().getSession();
		System.out.println("return HttpSession = ["+null == WebContextFactory.get().getSession()+"]");
		return result;
	}

	public static HttpServletRequest getDwrRequest() {
		return (null == WebContextFactory.get()) ? null : WebContextFactory
				.get().getHttpServletRequest();
	}

	public synchronized ActionResult login(String username, String password,String validateCode) {
		//解密
//		username = CyptoUtils.decode(username);
//		password = CyptoUtils.decode(password);
		Des des=new Des();
		username=des.strDec(username, "1", "2", "3");
		password=des.strDec(password, "1", "2", "3");
		ActionResult result=new ActionResult();
		try {
			System.out.println("loginstart...");
			HttpSession session = getDwrSession();
			refreshRand();
			System.out.println("end LoginAction.getDwrSession");
			System.out.println("HttpSession session=["+session+"]");
			if(null == session){
				result.setResultCode(-1);
				result.setResultMessage("会话信息丢失，请刷新页面！");
				refreshRand();
				return result;
			}
			
			String rand = (String) session.getAttribute("randdd");
			if (rand == null) {
				result.setResultCode(-1);
				result.setResultMessage("验证码丢失，请刷新页面！");
				refreshRand();
				return result;
			}
			if (!rand.equals(validateCode)) {
				result.setResultCode(-1);
				result.setResultMessage("验证码不正确！");
				return result;
			}
			System.out.println("通过验证！开始获取用户信息！");
			SysOperator userQuery=new SysOperator();
			//System.out.println("打印用户名"+username);
			userQuery.setLoginName(username);
			userQuery.setStatus(0L);
			List<SysOperator> users=sysOperatorMgmt.querySysOperator(userQuery);
			System.out.println("获取到用户信息！["+users+"]");
			if(null!=users && users.size()>0){
				SysOperator curUser=users.get(0);
				
				Md5PwdEncoder pwdEncoder=new Md5PwdEncoder();
				if(username.equals(curUser.getLoginName())){
					if(pwdEncoder.isPasswordValid(curUser.getPassword(), password)){
						//加载用户数据
//						List<SysRole> sysRoles=sysRoleMgmt.queryByCurUser(curUser);
//						curUser.setRoles(sysRoles);
//						List<SysMenu> sysMenus=sysMenuMgmt.queryByCurUser(curUser);
//						curUser.setMenus(sysMenus);
						//修复会话固定漏洞
						session.invalidate();
						HttpSession newSession = getDwrSession();
						
						newSession.setAttribute(Constants.Session_Attribute_UserEnv, curUser);
						ApplicationContext.putSessionId(curUser.getUnid(),newSession.getId());
						result.setResultCode(0);
						refreshRand();
						return result;
					}else{
						result.setResultCode(-1);
						result.setResultMessage("用户名或密码错误！");
						refreshRand();
						return result;
					}
				}else{
					result.setResultCode(-1);
					result.setResultMessage("非法登录！");
					refreshRand();
					return result;
				}
			}else{
				result.setResultCode(-1);
				result.setResultMessage("用户已被注销或用户名密码错误！");
				refreshRand();
				return result;
			}
			
		} catch (BusinessException e) {
			e.printStackTrace();
			result.setResultCode(-1);
			result.setResultMessage(e.getMessage());
			refreshRand();
			return result;
		}
	}
	
	private void refreshRand(){
		HttpSession session = getDwrSession();
		String sRand="";
	   for(int i=0;i<4;i++)
	   {
		 Random random= new Random();
	     String rand=String.valueOf(random.nextInt(10));
	     sRand+=rand;
	   }
	   session.setAttribute("rand",sRand); 
	}
	
	public synchronized String loginWithoutValidate(String username, String password) {
		String errmesg = "";
		try {
			
			HttpSession session = getDwrSession();
			if(null == session){
				errmesg = "会话信息丢失，请刷新页面！";
				return errmesg;
			}
			SysOperator userQuery=new SysOperator();
			userQuery.setLoginName(username);
			List<SysOperator> users=sysOperatorMgmt.querySysOperator(userQuery);
			if(null!=users && users.size()>0){
				SysOperator curUser=users.get(0);
				
				//ADC登录
				if(curUser.getOperatorType()==Constants.OPERATOR_TYPE_ADC){
					//return AdcLogin(curUser);
				}
				
				Md5PwdEncoder pwdEncoder=new Md5PwdEncoder();
				if(username.equals(curUser.getLoginName())){
					if(pwdEncoder.isPasswordValid(curUser.getPassword(), password)){
						session.setAttribute(Constants.Session_Attribute_UserEnv, curUser);
						ApplicationContext.putSessionId(curUser.getUnid(),session.getId());
						return "true";
					}else{
						return "密码错误！";
					}
				}else{
					return "非法登录！";
				}
			}else{
				return "该用户不存在！";
			}
			
		} catch (BusinessException e) {
			e.printStackTrace();
			errmesg = e.getMessage();
			return errmesg;
		}
	}
	
	public String logout() {
		String errmesg = "true";
		try {
			SysOperator user = null;
			HttpSession session = getDwrSession();
			session.setAttribute(Constants.Session_Attribute_UserEnv, user);
		} catch (BusinessException e) {
			e.printStackTrace();
			errmesg = e.getMessage();
			return errmesg;
		}
		return errmesg;
	}
	
	public void recordLoginLog(HttpServletRequest request,String username,String msg,String browser) {
		//username = CyptoUtils.decode(username);
		Des des=new Des();
		username=des.strDec(username, "1", "2", "3");
		String ip = request.getRemoteAddr();
		String time = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss.SSS").format(new Date());
		try {
			SysLoginLog sysLoginLog = new SysLoginLog();
			sysLoginLog.setUnid(sysLoginLogMgmt.getKey());
			if(null!=msg && msg.equals("true")){
				SysOperator user=new SysOperator();
				user.setLoginName(username);
				List<SysOperator> users=sysOperatorMgmt.querySysOperator(user);
				SysOperator curUser=users.get(0);
				sysLoginLog.setUserUnid(curUser.getUnid());
				sysLoginLog.setLoginName(username);
				sysLoginLog.setName(curUser.getName());
				sysLoginLog.setOperatorType(curUser.getOperatorType());
				sysLoginLog.setIpAddress(ip);
				sysLoginLog.setBrowserInfo(browser);
				sysLoginLog.setLoginTime(time);
				sysLoginLog.setLoginType(0L);
				sysLoginLog.setSucOrFail(0L);
			}else{
				sysLoginLog.setLoginName(username);
				sysLoginLog.setIpAddress(ip);
				sysLoginLog.setBrowserInfo(browser);
				sysLoginLog.setLoginTime(time);
				sysLoginLog.setLoginType(0L);
				sysLoginLog.setFailText(msg);
				sysLoginLog.setSucOrFail(1L);
			}
			sysLoginLog = sysLoginLogMgmt.createSysLoginLog(sysLoginLog);
		} catch (BusinessException e) {
			e.printStackTrace();
		}
	}
	
	public void recordLoginOutLog(HttpServletRequest request,String userLoginName,String browser) {
		String ip = request.getRemoteAddr();
		String time = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss.SSS").format(new Date());
		try {
			SysLoginLog sysLoginLog = new SysLoginLog();
			sysLoginLog.setUnid(sysLoginLogMgmt.getKey());
			SysOperator user=new SysOperator();
			user.setLoginName(userLoginName);
			List<SysOperator> users=sysOperatorMgmt.querySysOperator(user);
			SysOperator curUser=users.get(0);
			sysLoginLog.setUserUnid(curUser.getUnid());
			sysLoginLog.setLoginName(userLoginName);
			sysLoginLog.setName(curUser.getName());
			sysLoginLog.setOperatorType(curUser.getOperatorType());
			sysLoginLog.setIpAddress(ip);
			sysLoginLog.setBrowserInfo(browser);
			sysLoginLog.setLoginTime(time);
			sysLoginLog.setLoginType(1L);
			sysLoginLog.setSucOrFail(0L);
			sysLoginLog = sysLoginLogMgmt.createSysLoginLog(sysLoginLog);
		} catch (BusinessException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * <p>
	 *	<b>describe:加密处理</b><br>
	 *	 <br>
	 * <b><i>notice:</i></b>
	 *	<ol>
	 *		<li></li>
	 *	</ol>
	 * </p>
	 * @param data
	 * @return
	 * @author Chen-JY
	 */
	public ActionResult encode(String data){
		ActionResult result=new ActionResult();
		result.setResultCode(0);
		result.setReturnObject(CyptoUtils.encode(data));
		return result;
	}
}
