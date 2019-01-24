package com.countout.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.countout.entity.AuthUserRoleEntity;
import com.tang.plug.hibernate.HibernateSimpleEntityDao;

/**
 * 用户角色持久层
 * @author Mr.tang
 */
@Repository
public class AuthUserRoleDao extends HibernateSimpleEntityDao<AuthUserRoleEntity> {
	
	/**
	 * 根据用户查询角色
	 * @param userId 用户ID
	 * @return 角色ID列表
	 */
	@SuppressWarnings("unchecked")
	public List<Integer> findRoleIdByUserId(Integer userId) {
		Criteria dc = super.createCriteria(AuthUserRoleEntity.class);
		dc.add(Restrictions.eq("this.userId", userId));
		dc.setProjection(Projections.property("this.roleId"));
		return dc.list();
	}

	/**
	 * 根据角色ID(roleId)查找用户(userId)信息
	 * @param roleId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Integer> findUserIdByRoleId(Integer roleId) {
		Criteria dc = super.createCriteria(AuthUserRoleEntity.class);
		dc.add(Restrictions.eq("this.roleId", roleId));
		dc.setProjection(Projections.property("this.userId"));
		return dc.list();
	}
	
	/**
	 * 根据用户id查询用户角色关联信息
	 * @param userId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<AuthUserRoleEntity> findEntityByUserId(Integer userId){
		Criteria dc = super.createCriteria(AuthUserRoleEntity.class);
		dc.add(Restrictions.eq("this.userId", userId));
		dc.setProjection(Projections.property("this.id"));
		dc.setProjection(Projections.property("this.userId"));
		dc.setProjection(Projections.property("this.roleId"));
		return dc.list();
	}
	
	/**
	 * 根据角色id查询用户角色关联信息
	 * @param userId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<AuthUserRoleEntity> findEntityByRoleId(Integer roleId){
		Criteria dc = super.createCriteria(AuthUserRoleEntity.class);
		dc.add(Restrictions.eq("this.roleId", roleId));
		dc.setProjection(Projections.property("this.id"));
		dc.setProjection(Projections.property("this.userId"));
		dc.setProjection(Projections.property("this.roleId"));
		return dc.list();
	}

	/**
	 * 根据角色Id集合查询用户角色关联实体
	 * @param requestMap
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<AuthUserRoleEntity> queryUserRoleByRoleId(Map<String, Object> requestMap) {
		Criteria dc = createCriteria(AuthUserRoleEntity.class);
		List<Integer> roleIds = (List<Integer>) requestMap.get("roleIds");
		dc.add(Property.forName("roleId").in(roleIds));
		return super.findByCriteria(dc);
	}
	
}
