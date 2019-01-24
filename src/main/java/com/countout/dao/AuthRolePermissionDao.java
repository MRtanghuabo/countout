package com.countout.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.countout.entity.AuthRolePermissionEntity;

import com.tang.plug.hibernate.HibernateSimpleEntityDao;

/**
 * 角色菜单关联dao
 * @author Mr.tang
 */
@Repository
public class AuthRolePermissionDao extends HibernateSimpleEntityDao<AuthRolePermissionEntity> {

	/**
	 * 根据角色id查询角色菜单关联信息
	 * @param roleId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<AuthRolePermissionEntity> findEntityByRoleId(Integer roleId) {
		Criteria dc = super.createCriteria(AuthRolePermissionEntity.class);
		dc.add(Restrictions.eq("this.roleId", roleId));
		dc.setProjection(Projections.property("this.id"));
		dc.setProjection(Projections.property("this.roleId"));
		dc.setProjection(Projections.property("this.permissionId"));
		return dc.list();
	}

	
}
