package com.countout.portal.security.credential;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.springframework.beans.factory.annotation.Autowired;

import com.countout.portal.password.PasswordEncoder;


/**
 * 验证
 * @author Mr.tang
 */
public class StandardCredentialsMatcher implements CredentialsMatcher {

	@Autowired
	private PasswordEncoder passwordEncoder;

	public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
		String rawPassword = (String) getSubmittedPassword(token);
		String encodedPassword = (String) getStoredPassword(info);
		return passwordEncoder.matches(rawPassword, encodedPassword);
	}

	private static Object getSubmittedPassword(AuthenticationToken token) {
		Object submitted = ((token != null) ? token.getCredentials() : null);
		if (submitted instanceof char[]) {
			submitted = new String((char[]) (char[]) submitted);
		}
		return submitted;
	}

	private static Object getStoredPassword(AuthenticationInfo info) {
		Object stored = (info != null) ? info.getCredentials() : null;
		if (stored instanceof char[]) {
			stored = new String((char[]) (char[]) stored);
		}
		return stored;
	}
}
