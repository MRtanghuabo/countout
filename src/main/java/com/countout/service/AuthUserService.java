package com.countout.service;

import java.util.List;
import java.util.Map;

import com.countout.entity.AuthUserEntity;
import com.tang.util.page.Page;

/**
 * 用户
 * @author Mr.tang
 */
public interface AuthUserService {

	/**
	 * 根据用户状态及username查询
	 * @param username
	 * @return
	 */
	AuthUserEntity getByUsernameAndstate(String username);

	/**
	 * 分页查询
	 * @param requestMap
	 * @return
	 */
	Page<AuthUserEntity> pageQuery(Map<String, Object> requestMap);

	/**
	 * 新增或保存用户
	 * @param requestMap
	 * @return
	 */
	void saveOrUpdate(Map<String, Object> requestMap);

	/**
	 * 启用或禁用用户
	 * @param requestMap
	 */
	void enabled(Map<String, Object> requestMap);

	/**
	 * 删除用户
	 * @param requestMap
	 */
	void delete(Map<String, Object> requestMap);

	/**
	 * 根据角色Id查询用户
	 * @param requestMap
	 */
	List<AuthUserEntity> queryUserByRoleId(Map<String, Object> requestMap);

	/**
	 * 查看用户时查询用户信息
	 * @param requestMap
	 */
	AuthUserEntity view(Map<String, Object> requestMap);


}
