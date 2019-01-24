package com.countout.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.countout.dao.AuthUserRoleDao;
import com.countout.service.AuthUserRoleService;

/**
 * 用户角色关联关系
 * @author Mr.tang
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class AuthUserRoleServiceImpl implements AuthUserRoleService {
	
	private final Logger logger = Logger.getLogger(AuthUserRoleServiceImpl.class);
	
	@Autowired
	private AuthUserRoleDao authUserRoleDao;

	/**
	 * 根据用户ID(userId)查找用户角色(roles)信息
	 * @param id
	 * @return
	 */
	@Override
	public List<Integer> findRoleIdByUserId(Integer userId) {
		logger.info("根据用户ID(userId)查找用户角色(roles)信息");
		return this.authUserRoleDao.findRoleIdByUserId(userId);
	}
	
	/**
	 * 根据角色ID(roleId)查找用户(userId)信息
	 */
	@Override
	public List<Integer> findUserIdByRoleId(Integer RoleId) {
		logger.info("根据角色ID(roleId)查找用户(userId)信息");
		return this.authUserRoleDao.findUserIdByRoleId(RoleId);
	}
}
