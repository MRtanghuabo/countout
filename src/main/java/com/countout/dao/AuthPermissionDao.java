package com.countout.dao;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.countout.entity.AuthPermissionEntity;
import com.google.common.collect.Lists;

import com.tang.plug.hibernate.HibernateSimpleEntityDao;

/**
 * 菜单dao
 * @author Mr.tang
 */
@Repository
public class AuthPermissionDao extends HibernateSimpleEntityDao<AuthPermissionEntity> {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * 根据角色id查询菜单信息
	 * @param roleIds
	 * @return
	 */
	public List<AuthPermissionEntity> findByRoleId(List<Integer> roleIds) {
		logger.info("根据角色id查询菜单信息");
		if (CollectionUtils.isEmpty(roleIds)) {
			return Lists.newArrayList();
		}

		Criteria dc = super.createCriteria(AuthPermissionEntity.class);
		dc.createAlias("this._AuthRolePermissionEntity", "_AuthRolePermissionEntity", JoinType.LEFT_OUTER_JOIN);
		dc.add(Restrictions.in("_AuthRolePermissionEntity.roleId", roleIds));
		dc.addOrder(Order.asc("this.createTime"));
		return super.findByCriteria(dc);
	}

	/**
	 * 查询菜单树
	 * @return
	 */
	public List<AuthPermissionEntity> find() {
		logger.info("查询菜单树");
		Criteria dc = createCriteria(AuthPermissionEntity.class);
		return super.findByCriteria(dc);
	}

	/**
	 * 根据角色查询菜单树
	 * @return
	 */
	/*public List<AuthPermissionEntity> loadTreeByRoleId(Integer roleId) {
		// TODO Auto-generated method stub
		List<Integer> roleIds = new ArrayList<Integer>();
		roleIds.add(roleId);
		Criteria dc = super.createCriteria(AuthPermissionEntity.class);
		dc.createAlias("this._AuthRolePermissionEntity", "_AuthRolePermissionEntity", JoinType.LEFT_OUTER_JOIN);
		dc.add(Restrictions.in("_AuthRolePermissionEntity.roleId", roleIds));
		dc.addOrder(Order.asc("this.createTime"));
		return super.findByCriteria(dc);
		
	}*/
}
