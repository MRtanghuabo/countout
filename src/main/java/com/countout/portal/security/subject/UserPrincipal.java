package com.countout.portal.security.subject;

import java.util.List;

import com.countout.entity.AuthPermissionEntity;
import com.countout.vo.AuthPermissionNodeVo;

/**
 * 用户认证对象，携带登录用户的信息.
 * @author Mr.tang
 */
public interface UserPrincipal {
	
	/**
	 * 获得用户ID
	 * @return 用户ID
	 */
	public Integer getId();

	/**
	 * 获得登录名
	 * @return 登录名
	 */
	public String getUsername();
	
	/**
	 * 获得用户姓名
	 * @return 用户姓名
	 */
	public String getName();

	/**
	 * 获得用户所属机构ID
	 * @return 机构ID
	 */
	public Integer getOrgId();
	
	/**
	 * 获得用户所属机构名称
	 * @return 机构ID
	 */
	public String getCustomerName();
	
	/**
	 *  获得用户所属主商户ID
	 * @return
	 */
	public Integer getMainOrgId();
	
	/**
	 * 手机号
	 * @return 手机号
	 */
	public String getPhone();

	/**
	 * 是否可用0-可用 1-禁用
	 * @return 是否可用0-可用 1-禁用
	 */
	public Integer getEnabled();

	/**
	 * 清分系统账号类型，10-业务员，20-审核员（三级审核），30-前端审核，40-（主子）商户管理员，90-系统账号
	 * @return
	 */
	public Integer getDistributionType();
	
	/**
	 * 见费出单系统账号类型
	 * @return
	 */
	public Integer getChargeIssueType();
	
	/**
	 * 商城系统账号类型
	 * @return
	 */
	public Integer getOnlineMalType();
	
	/**
	 * 是否是主商户
	 * @return
	 */
	public Integer getLevel();
	
	/**
	 * 主商户id
	 * @return
	 */
	public String getPath();
	
	/**
	 * 微信openId
	 * @return
	 */
	public String getOpenId();

	/**
	 * 获得用户所属角色ID列表
	 * @return 角色ID列表
	 */
	public Integer[] getRoleIds();

	/**
	 * 获得用户拥有权限ID列表
	 * @return 权限ID列表
	 */
	public Integer[] getPermissionIds();
	
	/**
	 * 获得用户拥有权限名称列表
	 * @return 权限名称列表
	 */
	public String[] getPermissionNames();
	
	/**
	 * 获得用户拥有权限名称列表包含id及名称
	 * @return 权限名称列表
	 */
	public List<AuthPermissionNodeVo> getPermissions();
	
	/**
	 * 获得用户拥有权限名称列表包含id及名称
	 * @return 权限名称列表
	 */
	public List<AuthPermissionEntity> getPermissionEntity();
	
	/**
	 * 获得用户拥有权限编码列表
	 * @return 权限编码列表
	 */
	public String[] getPermissionCodes();

	/**
	 * 获得用户属性
	 * @param name 属性名
	 * @return 权限ID列表
	 */
	public <T> T getAttribute(String name);

	/**
	 * 设置用户属性
	 * @param name 属性名
	 * @param value 属性值
	 */
	public <T> void setAttribute(String name, T value);
	
}
