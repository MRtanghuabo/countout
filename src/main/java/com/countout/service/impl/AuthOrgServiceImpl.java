package com.countout.service.impl;

import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.countout.dao.AuthOrgDao;
import com.countout.entity.AuthOrgEntity;
import com.countout.portal.base.BaseConstants;
import com.countout.portal.security.UserHolder;
import com.countout.service.AuthOrgService;
import com.countout.vo.AuthOrgVo;
import com.countout.vo.NodeFilter;
import com.google.common.collect.Lists;
import com.tang.util.page.Page;

/**
 * 机构实现
 * @author Mr.tang
 */
@Service("AuthOrgServiceImpl")
@Transactional(rollbackFor = Exception.class)
public class AuthOrgServiceImpl implements AuthOrgService{
	
	private final Logger logger = Logger.getLogger(AuthOrgServiceImpl.class);
	
	@Autowired
	private AuthOrgDao authOrgDao;

	@Override
	public Page<AuthOrgEntity> pageQuery(Map<String, Object> requestMap) {
		logger.info("分页查询用户信息");
		Page<AuthOrgEntity> userList = this.authOrgDao.pageQuery(requestMap);
		return userList;
	}

	/**
	 * 新增或保存机构
	 * @param requestMap
	 */
	@Override
	public void saveOrUpdate(Map<String, Object> requestMap) {
		Integer orgId = (Integer) requestMap.get("id");
		AuthOrgEntity entity = convertToEntity(requestMap);
		if(orgId == null){//新增
			entity.setCreateId(UserHolder.getId());
			entity.setCreateTime(new Date());
			logger.info("新增机构");
			this.authOrgDao.save(entity);
		}else{//修改
			logger.info("修改机构");
			this.authOrgDao.update(entity);
			//迭代更新层级下的level
			List<AuthOrgEntity> entities = authOrgDao.findChildren(orgId);
			recursiveSetLevel(entities, orgId, entity.getLevel());
		}
	}
	
	/**
	 * 循环更新级别 --递归
	 * @param entities
	 * @param id
	 * @param level
	 */
	private void recursiveSetLevel(Collection<AuthOrgEntity> entities,Integer parentId, Integer parentLevel) {
		logger.info("循环更新机构级别 --递归");
		for (AuthOrgEntity entity : entities) {
			if(parentId == entity.getParentId()){
				int level = parentLevel + 1;
				entity.setLevel(level);
				authOrgDao.update(entity);
				List<AuthOrgEntity> list = authOrgDao.findChildren(entity.getId());
				recursiveSetLevel(list, entity.getId(), level);
			}
		}
	}

	/**
	 * 将传入参数转为实体
	 * @param requestMap
	 * @return
	 */
	private AuthOrgEntity convertToEntity(Map<String, Object> requestMap) {
		AuthOrgEntity entity = new AuthOrgEntity();
		entity.setId((Integer) requestMap.get("id"));
		entity.setName((String) requestMap.get("name"));
		entity.setCode((String) requestMap.get("code"));
		Integer parentId = (Integer) requestMap.get("parentId");
		entity.setParentId(parentId == null ? 0 : parentId);
		entity.setPhone((String) requestMap.get("phone"));
		entity.setFax((String) requestMap.get("fax"));
		entity.setAddress((String) requestMap.get("address"));
		entity.setState((Integer) requestMap.get("state"));
		entity.setRemark((String) requestMap.get("remark"));
		Integer level = getLevelByParentId(parentId);
		entity.setLevel(level);
		entity.setUpdateId(UserHolder.getId());
		entity.setUpdateTime(new Date());
		
		return entity;
	}

	/**
	 * 根据父机构id获取当前树的深度（level）
	 * @param parentId
	 * @return
	 */
	private Integer getLevelByParentId(Integer parentId) {
		AuthOrgEntity entity = this.authOrgDao.getById(parentId);
		Integer level = entity.getLevel();
		return level == 0 ? 1 : level+1;
	}

	/**
	 * 查询所有--机构树
	 * @return
	 */
	@Override
	public List<AuthOrgVo> getTree() {
		logger.info("查询所有--机构树");
		List<AuthOrgEntity> entities = this.authOrgDao.findEnable();
		return buildTree(BaseConstants.ROOT_ID, DEFAULT_NODE_FILTER, 0, entities);
	}
	
	
	// ==============================InnerClass=======================================

	private List<AuthOrgVo> buildTree(Integer parentId, NodeFilter<AuthOrgEntity> filter, int depth, List<AuthOrgEntity> entities) {
		List<AuthOrgVo> nodes = Lists.newArrayList();
		for (AuthOrgEntity entity : entities) {
			if (entity.getParentId().equals(parentId)) {
				List<AuthOrgVo> children = buildTree(entity.getId(), filter, depth + 1, entities);
				boolean leaf = children.isEmpty();
				if (filter.accept(entity, depth, leaf)) {
					AuthOrgVo node = convertVo(entity);
					node.setChildren(children);
					nodes.add(node);
				}
			}
		}
		return nodes;
	}

	private static NodeFilter<AuthOrgEntity> DEFAULT_NODE_FILTER = new NodeFilter<AuthOrgEntity>() {
		@Override
		public boolean accept(AuthOrgEntity entity, int depth, boolean leaf) {
			return true;
		}
	};
	
	private AuthOrgVo convertVo(AuthOrgEntity entity){
		AuthOrgVo vo = new AuthOrgVo();
		vo.setId(entity.getId());
		vo.setName(entity.getName());
		vo.setCode(entity.getCode());
		vo.setParentId(entity.getParentId());
		vo.setPhone(entity.getPhone());
		vo.setFax(entity.getFax());
		vo.setAddress(entity.getAddress());
		vo.setRemark(entity.getRemark());
		vo.setLevel(entity.getLevel());
		vo.setCreateTime(entity.getCreateTime());
		vo.setCreateId(entity.getId());
		vo.setUpdateId(entity.getUpdateId());
		vo.setUpdateTime(entity.getUpdateTime());

		return vo; 
	}

	/**
	 * 查询单个机构
	 * @param requestMap
	 */
	@Override
	public AuthOrgEntity view(Map<String, Object> requestMap) {
		return this.authOrgDao.getById((Integer) requestMap.get("id"));
	}

	/**
	 * 删除机构
	 * @param requestMap
	 */
	@Override
	public void delete(Map<String, Object> requestMap) {
		this.authOrgDao.delete(requestMap);
	}
}
