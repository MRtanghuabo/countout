package com.countout.service;

import java.util.List;

/**
 * 用户--角色
 * @author Mr.tang
 */
public interface AuthUserRoleService {
	
	/**
	 * 根据用户ID(userId)查找用户角色(roles)信息
	 * @param id
	 * @return
	 */
	List<Integer> findRoleIdByUserId(Integer userId);
	
	/**
	 * 根据角色ID(roleId)查找用户(userId)信息
	 * @param RoleId
	 * @return
	 */
	List<Integer> findUserIdByRoleId(Integer RoleId);
}
