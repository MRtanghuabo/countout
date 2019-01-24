package com.countout.portal.password;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * 密码编码(加密)器实现类(MD5实现)
 * @author Mr.tang
 */
//测试密码：
//admin    : 21232f297a57a5a743894a0e4a801fc3
//password : 5f4dcc3b5aa765d61d8327deb882cf99
//111111   : 96e79218965eb72c92a549dd5a330112
public class PasswordEncoderMd5 implements PasswordEncoder {

	/**
	 * 生成散列密码(目前采用MD5加密,密码加密不可逆)<br/>
	 * @param password 原始密码
	 * @return 加密后的密码
	 */
	public String encode(CharSequence rawPassword) {
		return DigestUtils.md5Hex(rawPassword.toString());
	}

	/**
	 * 匹配密码明文和密文
	 * @param rawPassword 原始密码(明文)
	 * @param encodedPassword 加密后的密码(密文)
	 * @return 如果明文和密文匹配则返回true,否则返回false
	 */
	public boolean matches(CharSequence rawPassword, CharSequence encodedPassword) {
		return encode(rawPassword).equals(encodedPassword);
	}
	
}
