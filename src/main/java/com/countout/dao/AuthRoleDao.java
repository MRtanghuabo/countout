package com.countout.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.countout.entity.AuthRoleEntity;
import com.countout.portal.security.UserHolder;
import com.tang.plug.hibernate.HibernateSimpleEntityDao;
import com.tang.util.page.Page;

/**
 * 角色dao
 * @author Mr.tang
 */
@Repository
public class AuthRoleDao extends HibernateSimpleEntityDao<AuthRoleEntity> {

	/**
	 * 分页查询角色信息
	 * @param requestMap
	 * @return
	 */
	public Page<AuthRoleEntity> pageQuery(Map<String, Object> requestMap) {
		Criteria dc = createCriteria(AuthRoleEntity.class);
		int start = (Integer) requestMap.get("pageNum");
		int pageSize = (Integer) requestMap.get("pageSize");
		int pageNum = (start-1) * pageSize;
		
		String name = (String) requestMap.get("name");

		if (StringUtils.isNotEmpty(name)) {
			dc.add(Restrictions.like("this.name", name, MatchMode.ANYWHERE));
		}
		
		dc.add(Restrictions.eq("this.orgId", UserHolder.getOrgId()));
		dc.add(Restrictions.eq("this.state", 1));
		dc.addOrder(Order.asc("this.createTime"));
		
		return super.pagedQuery(dc, pageNum, pageSize);
	}

	/**
	 * 根据机构id集合查询角色集合
	 * @param requestMap
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<AuthRoleEntity> queryRoleByOrgId(Map<String, Object> requestMap) {
		Criteria dc = createCriteria(AuthRoleEntity.class);
		List<Integer> orgIds = (List<Integer>) requestMap.get("orgIds");
		dc.add(Property.forName("orgId").in(orgIds));
		return super.findByCriteria(dc);
	}
	
}
