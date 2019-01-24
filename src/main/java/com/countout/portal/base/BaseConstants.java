package com.countout.portal.base;
/**
 * 常量类
 * @author Mr.tang
 */
public class BaseConstants {
	/** NULL标记 */
	public static final String NULL_SYMBOL = "__NULL";
	/** 未定义ID标记 */
	public static final String UNDEFINED_ID = "__UNDEFINED";
	/** 根节点ID标记 */
	public static final Integer ROOT_ID = 0;
	/** 根机构节点ID */
	public static final String ORG_ROOT_ID = "0";
	/** 系统管理员的帐号ID */
	public static final String ADMIN_USER_ID = "__ADMIN_USER";
	/** 系统管理员的角色ID */
	public static final String ADMIN_ROLE_ID = "__ADMIN_ROLE";
	/** 密码占位符 */
	public static final String PASSWORD_PLACEHOLDER = "●●●●●●"; // 密码占位符号
	/** 默认密码 (111111) */
//	public static final String DEFAULT_PASSWORD = Configs.getString("security.default.password", "111111");
	public static final String ADMIN = "admin"; // 密码占位符号
	/**用户session在redis中的标记*/
	public static final String USER_SESSION = "user_";
	/**要推送的消息在redis中的标记*/
	public static final String MESSAGE = "message_";

}