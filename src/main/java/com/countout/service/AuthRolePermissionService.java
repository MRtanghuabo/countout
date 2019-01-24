package com.countout.service;

import java.util.List;

import com.countout.entity.AuthPermissionEntity;

/**
 * 角色--菜单
 * @author Mr.tang
 */
public interface AuthRolePermissionService {

	/**
	 * 根据用户角色(roleIds)查找用户权限(permissions)信息
	 * @param roleIds
	 * @return
	 */
	List<AuthPermissionEntity> findEntityByRoleId(List<Integer> roleIds);
	
}
