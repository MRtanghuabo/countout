package com.countout.portal.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import com.countout.portal.base.BaseConstants;
import com.countout.portal.redisCache.JedisClientPool;
import com.countout.portal.security.UserHolder;

public class SessionFilter implements Filter {
	
//	@Autowired
	private JedisClientPool jedisClientPool;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
//		if (jedisClientPool == null) {
//			jedisClientPool = (JedisClientPool) SpringApplicationContextUtil.getContext().getBean("jedisClientPool");
//        }
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		 // 获取容器
		HttpServletRequest hreq = (HttpServletRequest) req;
        String url = hreq.getRequestURI().trim();
        String username = UserHolder.getUsername();
		System.out.println("用户(" + username + ")，访问了[" + url + "]页面");
		if (StringUtils.isNotBlank(url)) {
			chain.doFilter(req, resp);
			if (username != null) {
				this.jedisClientPool.expire(BaseConstants.USER_SESSION + username, 1800);
			}
		}

		
		
		
		/*HttpServletRequest hreq = (HttpServletRequest) req;
		String url = hreq.getRequestURI().trim();

		String username = UserHolder.getUsername();
		System.out.println("用户(" + username + ")，访问了[" + url + "]页面");
		System.out.println(req.getServletContext().getContextPath());
		if (StringUtils.isNotBlank(url)) {
			chain.doFilter(req, resp);
			if (username != null) {
				this.jedisClientPool.set("111", "111");
				this.jedisClientPool.expire(BaseConstants.USER_SESSION + username, 1800);
			}
		}*/
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
