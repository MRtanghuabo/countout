package com.countout.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.countout.entity.AuthUserEntity;
import com.tang.plug.hibernate.HibernateSimpleEntityDao;
import com.tang.util.page.Page;

/**
 * 用户持久层
 * @author Mr.tang
 */
@Repository
public class AuthUserDao extends HibernateSimpleEntityDao<AuthUserEntity> {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 * 根据用户名查找用户信息
	 * @param username 用户名
	 * @return 用户信息
	 */
	public AuthUserEntity getByUsernameAndstate(String username) {
		Criteria dc = createCriteria(AuthUserEntity.class);
		dc.add(Restrictions.eq("username", username));
		dc.add(Restrictions.eq("del", 1));
		dc.add(Restrictions.eq("enabled", 1));
		return super.getByCriteria(dc);
	}

	/**
	 * 分页查询
	 * @return
	 */
	public Page<AuthUserEntity> pageQuery(Map<String, Object> requestMap) {
		Criteria dc = createCriteria(AuthUserEntity.class);
		int start = (Integer) requestMap.get("pageNum");
		int pageSize = (Integer) requestMap.get("pageSize");
		int pageNum = (start-1) * pageSize;
		
		dc.createAlias("this._AuthOrgEntity", "_AuthOrgEntity", JoinType.LEFT_OUTER_JOIN);//left_join
		String name = (String) requestMap.get("name");
		Integer orgId = (Integer) requestMap.get("orgId");

		if (StringUtils.isNotEmpty(name)) {
			dc.add(Restrictions.like("this.name", name, MatchMode.ANYWHERE));
		}
		if (orgId != null) {
			dc.add(Restrictions.eq("this.orgId", orgId));
		}
		
		dc.add(Restrictions.eq("this.del", 1));
		dc.addOrder(Order.asc("this.createTime"));
//		dc.setProjection(Projections.projectionList()
//				.add(Projections.property("this.orgName").as("_AuthOrgEntity.name")));
		return super.pagedQuery(dc, pageNum, pageSize);
	}

	/**
	 * 根据id集合查询数据
	 * @param ids
	 * @return
	 */
	public List<AuthUserEntity> queryUserByIds(List<Integer> ids) {
		Criteria dc = createCriteria(AuthUserEntity.class);
		dc.add(Property.forName("id").in(ids));
		return super.findByCriteria(dc);
	}

	/**
	 * 启用或禁用用户
	 * @param requestMap
	 */
	public Integer enabled(Map<String, Object> map) {
		String sql = "update auth_user set enabled = '"+ map.get("enabled") +"' where id = '"+ map.get("id") +"' ";
		return this.jdbcTemplate.update(sql);
	}

	/**
	 * 删除用户
	 * @param requestMap
	 */
	public Integer delete(Map<String, Object> map) {
		String sql = "update auth_user set del = 0 where id = '"+ map.get("id") +"' ";
		return this.jdbcTemplate.update(sql);
	}
	
}
