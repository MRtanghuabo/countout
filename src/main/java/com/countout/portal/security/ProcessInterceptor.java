package com.countout.portal.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 请求
 * @author Mr.tang
 */
public class ProcessInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		response.setHeader("Access-Control-Allow-Origin", "*");
		 
		response.setHeader("Access-Control-Allow-Headers", "Content-Type,Content-Length, Authorization, Accept,X-Requested-With");
	 
		response.setHeader("Access-Control-Allow-Credentials", "true");
		
		response.setHeader("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
	 
		response.setHeader("X-Powered-By","Jetty");
		
		if(request.getMethod().equals(RequestMethod.OPTIONS.name())) {
            response.setStatus(HttpStatus.OK.value());
            return false;
        }
	 
        String method= request.getMethod();
 
        if (method.equals("OPTIONS")){
        	response.setStatus(200);
            return false;
        }
 
        System.out.println(method);
 
        return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
