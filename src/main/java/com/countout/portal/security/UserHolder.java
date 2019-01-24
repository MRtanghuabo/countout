package com.countout.portal.security;


import java.util.List;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import com.countout.entity.AuthPermissionEntity;
import com.countout.portal.base.BaseConstants;
import com.countout.portal.security.subject.UserPrincipal;
import com.countout.vo.AuthPermissionNodeVo;

/**
 * 用于获取登录信息
 * @author Mr.tang
 */
public class UserHolder {
	
	/**
	 * 微信标记openId
	 * @return
	 */
	public static String getOpenId() {
		UserPrincipal principal = getPrincipal();
		return principal == null ? null : principal.getOpenId();
	}

	/**
	 * 获得当前用户ID
	 * @return 用户ID
	 */
	public static Integer getId() {
		UserPrincipal principal = getPrincipal();
		return principal == null ? null : principal.getId();
	}

	/**
	 * 获得当前用户账号
	 * @return 用户账号
	 */
	public static String getUsername() {
		UserPrincipal principal = getPrincipal();
		return principal == null ? null : principal.getUsername();
	}
	
	/**
	 * 获得当前用户姓名
	 * @return 用户姓名
	 */
	public static String getName() {
		UserPrincipal principal = getPrincipal();
		return principal == null ? null : principal.getName();
	}


	/**
	 * 获得当前用户机构ID
	 * @return 机构ID
	 */
	public static Integer getOrgId() {
		UserPrincipal principal = getPrincipal();
		return principal == null ? null : principal.getOrgId();
	}
	
	/**
	 * 获得当前用户机构名称
	 * @return 机构名称
	 */
	public static String getCustomerName() {
		UserPrincipal principal = getPrincipal();
		return principal == null ? null : principal.getCustomerName();
	}
	
	/**
	 * 获得当前用户主商户ID
	 * @return 机构ID
	 */
	public static Integer getMainOrgId() {
		UserPrincipal principal = getPrincipal();
		return principal == null ? null : principal.getMainOrgId();
	}

	/**
	 * 当前登录用户手机
	 * @return
	 */
	public static String getPhone() {
		UserPrincipal principal = getPrincipal();
		return principal == null ? null : principal.getPhone();
	}
	
	/**
	 * 是否可用0-可用 1-禁用
	 * @return
	 */
	public static Integer getEnabled() {
		UserPrincipal principal = getPrincipal();
		return principal == null ? null : principal.getEnabled();
	}
	
	/**
	 * 清分系统账号类型，10-业务员，20-审核员（三级审核），30-前端审核，40-（主子）商户管理员，90-系统账号
	 * @return
	 */
	public static Integer getDistributionType() {
		UserPrincipal principal = getPrincipal();
		return principal == null ? null : principal.getDistributionType();
	}
	
	/**
	 * 算费出单系统账号类型
	 * @return
	 */
	public static Integer getChargeIssueType() {
		UserPrincipal principal = getPrincipal();
		return principal == null ? null : principal.getChargeIssueType();
	}
	/**
	 * 商城系统账号类型
	 * @return
	 */
	public static Integer getOnlineMalType() {
		UserPrincipal principal = getPrincipal();
		return principal == null ? null : principal.getOnlineMalType();
	}
	
	/**
	 * 是否是主商户
	 * @return
	 */
	public static Integer getLevel(){
		UserPrincipal principal = getPrincipal();
		return principal == null ? null : principal.getLevel();
	}
	
	/**
	 * 主商户id
	 * @return
	 */
	public static String getPath(){
		UserPrincipal principal = getPrincipal();
		return principal == null ? null : principal.getPath();
	}
	
	/**
	 * 获得当前用户角色
	 * @return 角色ID列表
	 */
	public static Integer[] getRoleIds() {
		UserPrincipal principal = getPrincipal();
//		return principal == null ? ArrayUtils.EMPTY_STRING_ARRAY : principal.getRoleIds();
		return principal == null ? null : principal.getRoleIds();
	}

	/**
	 * 获得当前用户权限
	 * @return 功能ID列表
	 */
	public static Integer[] getPermissionIds() {
		UserPrincipal principal = getPrincipal();
//		return principal == null ? ArrayUtils.EMPTY_STRING_ARRAY : principal.getPermissionIds();
		return principal == null ? null : principal.getPermissionIds();
	}
	
	/**
	 * 获得当前用户权限
	 * @return 功能名称列表
	 */
	public static String[] getPermissionNames() {
		UserPrincipal principal = getPrincipal();
		return principal == null ? ArrayUtils.EMPTY_STRING_ARRAY : principal.getPermissionNames();
	}
	
	/**
	 * 获得当前用户权限(包含菜单id，及名称)
	 * @return 功能名称列表
	 */
	public static List<AuthPermissionNodeVo> getPermissions() {
		UserPrincipal principal = getPrincipal();
		return principal == null ? null : principal.getPermissions();
	}
	
	/**
	 * 获得当前用户权限(包含菜单id，及名称)
	 * @return 功能名称列表
	 */
	public static List<AuthPermissionEntity> getPermissionEntity() {
		UserPrincipal principal = getPrincipal();
		return principal == null ? null : principal.getPermissionEntity();
	}

	/**
	 * 获得当前用户权限
	 * @return 功能编码列表
	 */
	public static String[] getPermissionCodes() {
		UserPrincipal principal = getPrincipal();
		return principal == null ? ArrayUtils.EMPTY_STRING_ARRAY : principal.getPermissionCodes();
	}

	/**
	 * 判断当前用户是否管理员
	 * @return 如果用户是管理员则返回true，否则返回false
	 */
	public static Boolean isAdmin() {
		UserPrincipal principal = getPrincipal();
		if (principal == null) {
			return false;
		}
		if (BaseConstants.ADMIN_USER_ID.equals(principal.getId())) {
			return true;
		}
		return ArrayUtils.contains(principal.getRoleIds(), BaseConstants.ADMIN_ROLE_ID);
	}

	/**
	 * 获得用户属性
	 * @param name 属性名
	 * @return 属性值
	 */
	@SuppressWarnings("unchecked")
	public static <T> T getAttribute(String name) {
		UserPrincipal principal = getPrincipal();
		return (T) (principal == null ? null : principal.getAttribute(name));
	}

	/**
	 * 获得当前登录用户信息
	 * @return 用户信息
	 */
	public static UserPrincipal getPrincipal() {
		Subject subject = getSubject();
		Object principal = subject.getPrincipal();
		if (principal instanceof UserPrincipal) {
			return (UserPrincipal) principal;
		}
		return null;
	}

	/**
	 * 验证当前用户是否有权限
	 * @param code 权限 编码
	 * @return 如果有该权限返回true，否则返回false.
	 */
	public static boolean hasPermCode(String code) {
		if (StringUtils.isEmpty(code)) {
			return true;
		}
		String[] permissions = getPermissionCodes();
		if (permissions == null) {
			return false;
		}
		if (isAdmin()) {
			return true;
		}
		for (String permission : permissions) {
			if (permission.startsWith(code)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 验证当前用户是否认证通过(是否登录)
	 * @return 如果认证通过返回true，否则返回false.
	 */
	public static boolean isAuthc() {
		return getSubject().isAuthenticated();
	}

	/**
	 * 获得当前登录用户权限主体
	 * @return 权限主体
	 */
	private static Subject getSubject() {
		return SecurityUtils.getSubject();
	}
	
	
}
