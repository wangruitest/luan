package com.funo.system.introductor;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;

import com.funo.system.model.SysOperator;
import com.funo.utils.ActionFilterException;
import com.funo.utils.Constants;
import com.funo.utils.SessionOutException;

/**
 * Action层的切片统一处理逻辑
 * @author ChenXifu
 * @version 1.0
 * @createDate 2014-01-21
 */
public class ActionIntroductor implements MethodBeforeAdvice, AfterReturningAdvice {

	protected Log logger = LogFactory.getLog(getClass());

	/* (non-Javadoc)
	 * @see org.springframework.aop.MethodBeforeAdvice#before(java.lang.reflect.Method, java.lang.Object[], java.lang.Object)
	 */
	public void before(Method method, Object[] args, Object target) throws Throwable {
		Method getUserMth=target.getClass().getMethod("getSessionUser", null);
		if(null==getUserMth)return;
		Object result=getUserMth.invoke(target, null);
		if(null==result){
			throw new SessionOutException(Constants.sessionOutMsg);
		}
		
		if(method.toString().indexOf("com.funo.sendareacfg.action.SendareaCfgAction.getSendareaCfgList")<0){
			System.out.println(method.getName());
			throw new ActionFilterException(Constants.actionRightErrorMsg); 
		}
		
		
		
//		try{
//			SysOperator curUser=(SysOperator)result;
//			
//			if(!checkMethod(method.getName()))return;
//			for(int i=0;i<args.length;i++){
//				Object obj=args[i];
//				PropertyDescriptor[] ps = PropertyUtils.getPropertyDescriptors(obj.getClass());
//				for(int j=0;j<ps.length;j++){
//					String fullName=ps[j].getName();
//					Method setM=ps[j].getWriteMethod();
//					if(!fullName.equals("createUser"))continue;
//					setM.invoke(obj,curUser.getUnid());
//				}
//			}
//		}catch(Exception e){
//			e.printStackTrace();
//		}
	}
	
	public boolean checkMethod(String methodName){
		boolean result=true;
		return result;
	}

	public void afterReturning(Object returnValue, Method method, Object[] args, Object target) throws Throwable {
		
	}
}
