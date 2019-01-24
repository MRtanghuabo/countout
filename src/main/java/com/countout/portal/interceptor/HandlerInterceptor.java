package com.countout.portal.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.countout.portal.base.BaseConstants;
import com.countout.portal.redisCache.JedisClientPool;
import com.countout.portal.security.UserHolder;


@Component("handlerInterceptor")
public class HandlerInterceptor extends HandlerInterceptorAdapter {
	
	// ==============================Fields===========================================
	@Autowired
	private JedisClientPool jedisClientPool;
	// ==============================Method===========================================
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		//请求的路径
//		String url = WebUtil.getPathWithinApplication(request);
		String username = UserHolder.getUsername();
//		System.out.println("用户【" + username + "】访问的路径为：" + url);
		if(StringUtils.isNoneBlank(username)){
			this.jedisClientPool.expire(BaseConstants.USER_SESSION + username, 1800);
		}
	}
}
