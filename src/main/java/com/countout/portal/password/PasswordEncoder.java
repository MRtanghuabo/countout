package com.countout.portal.password;

/**
 * 密码编码(加密)器
 * @author Mr.tang
 */
public abstract interface PasswordEncoder {

	/**
	 * 对原始密码进行加密
	 * @param rawPassword 原始密码
	 * @return 加密后的字符串
	 */
	public abstract String encode(CharSequence rawPassword);

	/**
	 * 匹配密码明文和密文
	 * @param rawPassword 原始密码(明文)
	 * @param encodedPassword 加密后的密码(密文)
	 * @return 如果明文和密文匹配则返回true,否则返回false
	 */
	public abstract boolean matches(CharSequence rawPassword, CharSequence encodedPassword);
}
