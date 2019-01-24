package com.countout.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.countout.dao.AuthUserDao;
import com.countout.dao.AuthUserRoleDao;
import com.countout.entity.AuthUserEntity;
import com.countout.entity.AuthUserRoleEntity;
import com.countout.portal.security.UserHolder;
import com.countout.service.AuthUserService;
import com.tang.util.page.Page;

/**
 * 系统用户实现
 * @author Mr.tang
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class AuthUserServiceImpl implements AuthUserService {
	
	private final Logger logger = Logger.getLogger(AuthUserServiceImpl.class);
	
	@Autowired
	private AuthUserDao authUserDao; 
	
	@Autowired
	private AuthUserRoleDao authUserRoleDao;
	

	/**
	 * 根据用户名查询用户信息
	 */
	@Override
	public AuthUserEntity getByUsernameAndstate(String username) {
		logger.info("根据用户名查询用户信息");
		return this.authUserDao.getByUsernameAndstate(username);
	}

	/**
	 * 分页查询用户
	 */
	@Override
	public Page<AuthUserEntity> pageQuery(Map<String, Object> requestMap) {
		logger.info("分页查询用户信息");
		Page<AuthUserEntity> userPage = this.authUserDao.pageQuery(requestMap);
		List<AuthUserEntity> userList = userPage.getRecords();
		for (AuthUserEntity entity : userList) {
			if(entity.getOrgId() != null){
				entity.setOrgName(entity.get_AuthOrgEntity().getName());
			}
		}
		return userPage;
	}

	/**
	 * 新增或保存用户
	 * @param requestMap
	 * @return
	 */
	@Override
	public void saveOrUpdate(Map<String, Object> requestMap) {
		logger.info("新增或保存用户");
		Integer id = (Integer) requestMap.get("id");
		//传入的数据转用户实体
		AuthUserEntity userEntity = convertToEntity(requestMap);
		Integer[] roleIds = (Integer[]) requestMap.get("roleId");
		if(id == null){//新增
			userEntity.setCreateId(UserHolder.getId());
			userEntity.setCreateTime(new Date());
			AuthUserEntity vo = this.authUserDao.save(userEntity);
			int userId = vo.getId();
			if(roleIds != null && roleIds.length>0){
				for (Integer roleId : roleIds) {
					//用户角色关联实体
					AuthUserRoleEntity userRoleEntity = new AuthUserRoleEntity();
					userRoleEntity.setRoleId(roleId);
					userRoleEntity.setUserId(userId);
					this.authUserRoleDao.save(userRoleEntity);
				}
			}
		}else{//修改
			this.authUserDao.update(userEntity);
			List<AuthUserRoleEntity> userRoleList = this.authUserRoleDao.findEntityByUserId(id);
			if(userRoleList.size()>0 && userRoleList != null){
				for (AuthUserRoleEntity authUserRoleEntity : userRoleList) {
					this.authUserRoleDao.removeById(authUserRoleEntity.getId());
				}
			}
			if(roleIds != null && roleIds.length > 0){
				for (Integer roleId : roleIds) {
					//用户角色关联实体
					AuthUserRoleEntity userRoleEntity = new AuthUserRoleEntity();
					userRoleEntity.setUserId(id);
					userRoleEntity.setRoleId(roleId);
					this.authUserRoleDao.save(userRoleEntity);
				}
			}
		}
	}

	/**
	 * 请求参数转为实体AuthUserEntity
	 * @param requestMap
	 * @return
	 */
	private AuthUserEntity convertToEntity(Map<String, Object> requestMap) {
		AuthUserEntity entity = new AuthUserEntity();
		entity.setId((Integer) requestMap.get("id"));
		String username = (String) requestMap.get("username");
		if(StringUtils.isNoneBlank(username)){
			entity.setUsername(username);
		}
		String password = (String) requestMap.get("password");
		if(StringUtils.isNoneBlank(password)){
			entity.setPassword(password);
		}
		
		String name = (String) requestMap.get("name");
		if(StringUtils.isNoneBlank(name)){
			entity.setName(name);
		}
		String orgId = (String) requestMap.get("orgId");
		if(StringUtils.isNoneBlank(orgId)){
			entity.setOrgId((Integer) requestMap.get("orgId"));
		}
		
		String sex = (String) requestMap.get("sex");
		if(StringUtils.isNoneBlank(sex)){
			entity.setSex(sex);
		}
		
		String birthday = (String) requestMap.get("birthday"); 
		if(StringUtils.isNoneBlank(birthday)){
			entity.setBirthday((Date) requestMap.get("birthday"));
		}
		
		String idCard = (String) requestMap.get("idCard"); 
		if(StringUtils.isNoneBlank(idCard)){
			entity.setIdCard(idCard);
		}
		
		String phone = (String) requestMap.get("phone"); 
		if(StringUtils.isNoneBlank(phone)){
			entity.setPhone(phone);
		}

		String mobile = (String) requestMap.get("mobile"); 
		if(StringUtils.isNoneBlank(mobile)){
			entity.setMobile(mobile);
		}
		
		String email = (String) requestMap.get("email"); 
		if(StringUtils.isNoneBlank(email)){
			entity.setEmail(email);
		}

		String enabled = (Integer) requestMap.get("enabled") + ""; 
		if(StringUtils.isNoneBlank(enabled)){
			entity.setEnabled((Integer) requestMap.get("enabled"));
		}
		
		String del = (Integer) requestMap.get("del") + ""; 
		if(StringUtils.isNoneBlank(del)){
			entity.setDel((Integer) requestMap.get("del"));
		}
		
		String remark = (String) requestMap.get("remark"); 
		if(StringUtils.isNoneBlank(remark)){
			entity.setRemark(remark);
		}
		entity.setUpdateId(UserHolder.getId());
		entity.setUpdateTime(new Date());
		return entity;
	}
	
	public static void main(String[] args) {
		Integer[] roleIds = {1,2,3,4,5};
		for (Integer aaa : roleIds) {
			System.out.println(aaa);
		}
		
	}

	/**
	 * 启用或禁用用户
	 * @param requestMap
	 */
	@Override
	public void enabled(Map<String, Object> requestMap) {
		logger.info("启用或禁用用户");
		this.authUserDao.enabled(requestMap);
	}

	/**
	 * 删除用户
	 * @param requestMap
	 */
	@Override
	public void delete(Map<String, Object> requestMap) {
		logger.info("启用或禁用用户");
		this.authUserDao.delete(requestMap);
	}

	/**
	 * 根据角色Id集合查询用户
	 * @param requestMap
	 */
	@Override
	public List<AuthUserEntity> queryUserByRoleId(Map<String, Object> requestMap) {
		logger.info("根据角色Id集合查询用户");
		List<AuthUserRoleEntity> userRoleList = this.authUserRoleDao.queryUserRoleByRoleId(requestMap);
		List<Integer> ids = new ArrayList<Integer>();
		for (AuthUserRoleEntity authUserRoleEntity : userRoleList) {
			ids.add(authUserRoleEntity.getUserId());
		}
		List<AuthUserEntity> userList = this.authUserDao.queryUserByIds(ids);
		return userList;
	}

	/**
	 * 查看用户时查询用户信息
	 * @param requestMap
	 */
	@Override
	public AuthUserEntity view(Map<String, Object> requestMap) {
		// TODO Auto-generated method stub
		return this.authUserDao.getById((Integer) requestMap.get("id"));
	}

}
