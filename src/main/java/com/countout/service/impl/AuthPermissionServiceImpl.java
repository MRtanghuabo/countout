package com.countout.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.countout.dao.AuthPermissionDao;
import com.countout.entity.AuthPermissionEntity;
import com.countout.portal.base.BaseConstants;
import com.countout.service.AuthPermissionService;
import com.countout.vo.AuthPermissionNodeVo;
import com.countout.vo.NodeFilter;
import com.google.common.collect.Lists;


/**
 * 菜单及按钮
 * @author Mr.tang
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class AuthPermissionServiceImpl implements AuthPermissionService {
	
	private final Logger logger = Logger.getLogger(AuthPermissionServiceImpl.class);

	@Autowired
	private AuthPermissionDao authPermissionDao;
	
	/**
	 * 根据角色id查询菜单信息
	 */
	@Override
	public List<AuthPermissionEntity> findEntityByRoleId(List<Integer> roleIds) {
		logger.info("根据角色id查询菜单信息");
		return authPermissionDao.findByRoleId(roleIds);
	}

	/**
	 * 获得功能树
	 * @return 功能树
	 */
	@Override
	public List<AuthPermissionNodeVo> getTree() {
		logger.info("获得功能树");
		List<AuthPermissionEntity> entities = this.authPermissionDao.find();
		return buildTree(BaseConstants.ROOT_ID, DEFAULT_NODE_FILTER, 0, entities);
	}
	
	/**
	 * 根据角色查询菜单树
	 * @return
	 */
	@Override
	public List<AuthPermissionNodeVo> loadTreeByRoleId(Map<String, Object> requestMap) {
		logger.info("根据角色查询菜单树");
		List<Integer> roleIds = new ArrayList<Integer>();
		roleIds.add((Integer) requestMap.get("id"));
		List<AuthPermissionEntity> entities = this.authPermissionDao.findByRoleId(roleIds);
		return buildTree(BaseConstants.ROOT_ID, DEFAULT_NODE_FILTER, 0, entities);
	}
	
	
	// ==============================InnerClass=======================================

	private List<AuthPermissionNodeVo> buildTree(Integer parentId, NodeFilter<AuthPermissionEntity> filter, int depth, List<AuthPermissionEntity> entities) {
		List<AuthPermissionNodeVo> nodes = Lists.newArrayList();
		for (AuthPermissionEntity entity : entities) {
			if (entity.getParentId().equals(parentId)) {
				List<AuthPermissionNodeVo> children = buildTree(entity.getId(), filter, depth + 1, entities);
				boolean leaf = children.isEmpty();
				if (filter.accept(entity, depth, leaf)) {
					AuthPermissionNodeVo node = new AuthPermissionNodeVo();
					node.setId(entity.getId());
					node.setName(entity.getName());
					node.setParentId(entity.getParentId());
					node.setPath(entity.getPath());
					node.setCode(entity.getCode());
					node.setType(entity.getType());
					node.setRemark(entity.getRemark());
					node.setChildren(children);
					nodes.add(node);
				}
			}
		}
		return nodes;
	}

	private static NodeFilter<AuthPermissionEntity> DEFAULT_NODE_FILTER = new NodeFilter<AuthPermissionEntity>() {
		@Override
		public boolean accept(AuthPermissionEntity entity, int depth, boolean leaf) {
			return true;
		}
	};

}
