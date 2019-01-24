package com.countout.portal.exception;

import org.apache.shiro.authc.AuthenticationException;

/**
 * 用户验证不通过是抛出
 * @author Mr.tang
 */
@SuppressWarnings("serial")
public class UserDisabledAuthcException extends AuthenticationException {
	public UserDisabledAuthcException() {
	}

	public UserDisabledAuthcException(String message) {
		super(message);
	}

	public UserDisabledAuthcException(Throwable cause) {
		super(cause);
	}

	public UserDisabledAuthcException(String message, Throwable cause) {
		super(message, cause);
	}
}
