package com.countout.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.countout.entity.AuthPermissionEntity;
import com.countout.service.AuthRolePermissionService;

/**
 * 角色菜单关联实现
 * @author Mr.tang
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class AuthRolePermissionServiceImpl implements AuthRolePermissionService {
	
	
	/**
	 * 根据用户角色(roleIds)查找用户权限(permissions)信息
	 * @param roleIds
	 * @return
	 */
	@Override
	public List<AuthPermissionEntity> findEntityByRoleId(List<Integer> roleIds) {
		// TODO Auto-generated method stub
		
		return null;
	}

}
