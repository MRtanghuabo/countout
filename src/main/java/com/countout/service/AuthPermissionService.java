package com.countout.service;

import java.util.List;
import java.util.Map;

import com.countout.entity.AuthPermissionEntity;
import com.countout.vo.AuthPermissionNodeVo;

/**
 * 菜单
 * @author Mr.tang
 */
public interface AuthPermissionService {

	/**
	 * 根据用户角色(roleIds)查找用户权限(permissions)信息
	 * @param roleIds
	 * @return
	 */
	List<AuthPermissionEntity> findEntityByRoleId(List<Integer> roleIds);

	/**
	 * 查询所有--菜单树
	 * @return
	 */
	List<AuthPermissionNodeVo> getTree();

	/**
	 * 根据角色查询菜单树
	 * @return
	 */
	List<AuthPermissionNodeVo> loadTreeByRoleId(Map<String, Object> requestMap);

}
