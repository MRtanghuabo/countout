package com.countout.portal.security;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;

/**
 * shiro安全校验凭证
 * @author Mr.tang
 */
public class Securitys {

	/**
	 * 用户登录
	 * @param token 登录凭证
	 * @throws AuthenticationException 登录失败抛出认证异常
	 */
	public static void login(AuthenticationToken token) throws AuthenticationException {
		SecurityUtils.getSubject().login(token);
	}

	/**
	 * 用户登出
	 */
	public static void logout() {
		SecurityUtils.getSubject().logout();
	}

}
