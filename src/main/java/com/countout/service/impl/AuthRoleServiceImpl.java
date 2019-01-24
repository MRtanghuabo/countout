package com.countout.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.countout.dao.AuthRoleDao;
import com.countout.dao.AuthRolePermissionDao;
import com.countout.entity.AuthRoleEntity;
import com.countout.entity.AuthRolePermissionEntity;
import com.countout.portal.security.UserHolder;
import com.countout.service.AuthRoleService;
import com.tang.util.page.Page;

/**
 * 角色实现层
 * @author Mr.tang
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class AuthRoleServiceImpl implements AuthRoleService {
	
	private final Logger logger = Logger.getLogger(AuthRoleServiceImpl.class);
	
	@Autowired
	private AuthRoleDao authRoleDao;
	
	@Autowired
	private AuthRolePermissionDao authRolePermissionDao;

	/**
	 * 分页查询角色信息
	 */
	@Override
	public Page<AuthRoleEntity> pageQuery(Map<String, Object> requestMap) {
		logger.info("分页查询用户信息");
		Page<AuthRoleEntity> userList = this.authRoleDao.pageQuery(requestMap);
		return userList;
	}

	/**
	 * 新增或修改角色信息
	 * @param requestMap
	 */
	@Override
	public void saveOrUpdate(Map<String, Object> requestMap) {
		logger.info("新增或修改角色信息");
		Integer roleId = (Integer) requestMap.get("id");
		Integer[] permissions = (Integer[]) requestMap.get("permissions");
		AuthRoleEntity entity = convertToEntity(requestMap);
		if(roleId == null){//新增
			int roleIds = this.authRoleDao.save(entity);
			if(permissions != null && permissions.length>0){
				for (Integer permissionId : permissions) {
					//用户角色关联实体
					AuthRolePermissionEntity rolePermissionEntity = new AuthRolePermissionEntity();
					rolePermissionEntity.setRoleId(roleIds);
					rolePermissionEntity.setPermissionId(permissionId);
					this.authRolePermissionDao.save(rolePermissionEntity);
				}
			}
		}else{//修改
			this.authRoleDao.update(entity);
			List<AuthRolePermissionEntity> rolePermList = this.authRolePermissionDao.findEntityByRoleId(roleId);
			//删除旧的角色菜单关联
			if(rolePermList != null && rolePermList.size()>0){
				for (AuthRolePermissionEntity authRolePermissionEntity : rolePermList) {
					this.authRolePermissionDao.removeById(authRolePermissionEntity.getId());
				}
			}
			if(permissions != null && permissions.length>0){
				for (Integer permissionId : permissions) {
					//用户角色关联实体
					AuthRolePermissionEntity rolePermissionEntity = new AuthRolePermissionEntity();
					rolePermissionEntity.setRoleId(roleId);
					rolePermissionEntity.setPermissionId(permissionId);
					this.authRolePermissionDao.save(rolePermissionEntity);
				}
			}
		}
	}

	/**
	 * 将传入参数转为角色实体
	 * @param requestMap
	 * @return
	 */
	private AuthRoleEntity convertToEntity(Map<String, Object> requestMap) {
		AuthRoleEntity entity = new AuthRoleEntity();
		entity.setId((Integer) requestMap.get("id"));
		entity.setName((String) requestMap.get("name"));
		entity.setRemark((String) requestMap.get("remark"));
		entity.setState((Integer) requestMap.get("state"));
		entity.setCreateId(UserHolder.getId());
		entity.setCreateTime(new Date());
		entity.setUpdateId(UserHolder.getId());
		entity.setUpdateTime(new Date());
		entity.setOrgId(UserHolder.getOrgId());
		return entity;
	}

	/**
	 * 根据机构id集合查询角色集合
	 * @param requestMap
	 * @return
	 */
	@Override
	public List<AuthRoleEntity> queryRoleByOrgId(Map<String, Object> requestMap) {
		logger.info("根据机构id查询角色集合");
		return this.authRoleDao.queryRoleByOrgId(requestMap);
	}

	/**
	 * 查询角色
	 * @param requestMap
	 * @return
	 */
	@Override
	public AuthRoleEntity view(Map<String, Object> requestMap) {
		logger.info("查询角色！");
		return this.authRoleDao.getById((Integer) requestMap.get("id"));
	}

}
