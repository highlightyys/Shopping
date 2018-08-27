package com.neuedu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class CheckInterceptor implements HandlerInterceptor {
	
	/**
	 * 该方法在目标方法执行之前执行，
	 * 若返回值为 true,则继续执行后面拦截器或者目标方法
	 * 若返回值为false,则不会再调用后面的拦截器和目标方法
	 * 可以做权限校验，日志
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		//System.out.println("CheckInterceptor preHandle......");
		
		HttpSession session = request.getSession();
		Object user = session.getAttribute("user");
		if(user != null) {
			return true;
		}
		
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
		return false;
	}
	
	/**
	 * 该方法是在调用目标方法之后，渲染视图之前执行
	 * 
	 */
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		

	}
	
	/*
	 *该方法是在调用完目标方法之后（渲染完视图）执行
	 *主要是做一些释放资源，记录日志
	 */
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		

	}

	
}
