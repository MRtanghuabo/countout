package com.countout.service;

import java.util.List;
import java.util.Map;

import com.countout.entity.AuthRoleEntity;
import com.tang.util.page.Page;

/**
 * 角色
 * @author Mr.tang
 */
public interface AuthRoleService {

	/**
	 * 分页查询
	 * @param requestMap
	 * @return
	 */
	Page<AuthRoleEntity> pageQuery(Map<String, Object> requestMap);

	/**
	 * 新增或修改角色信息
	 * @param requestMap
	 */
	void saveOrUpdate(Map<String, Object> requestMap);

	/**
	 * 根据机构id查询角色集合
	 * @param requestMap
	 * @return
	 */
	List<AuthRoleEntity> queryRoleByOrgId(Map<String, Object> requestMap);

	/**
	 * 查询角色
	 * @param requestMap
	 * @return
	 */
	AuthRoleEntity view(Map<String, Object> requestMap);

}
