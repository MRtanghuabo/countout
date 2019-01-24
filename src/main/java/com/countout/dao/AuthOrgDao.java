package com.countout.dao;

import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.countout.entity.AuthOrgEntity;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.tang.plug.hibernate.HibernateSimpleEntityDao;
import com.tang.util.page.Page;

/**
 * 机构dao
 * @author Mr.tang
 */
@Repository
public class AuthOrgDao extends HibernateSimpleEntityDao<AuthOrgEntity> {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * 分页查询机构列表
	 * @param requestMap
	 * @return
	 */
	public Page<AuthOrgEntity> pageQuery(Map<String, Object> requestMap) {
		Criteria dc = createCriteria(AuthOrgEntity.class);
		int start = (Integer) requestMap.get("pageNum");
		int pageSize = (Integer) requestMap.get("pageSize");
		int pageNum = (start-1) * pageSize;
		
		String name = (String) requestMap.get("name");

		if (StringUtils.isNotEmpty(name)) {
			dc.add(Restrictions.like("this.name", name, MatchMode.ANYWHERE));
		}
		
		dc.add(Restrictions.eq("this.state", 1));
		dc.addOrder(Order.asc("this.createTime"));
		
		return super.pagedQuery(dc, pageNum, pageSize);
	}

	/**
	 * 查询子机构(包含子机构的子机构)
	 * @param parentId 机构ID
	 * @return 子机构列表
	 */
	public List<AuthOrgEntity> findAllChildren(Integer parentId) {
		List<AuthOrgEntity> entities = Lists.newArrayList();
		Queue<Integer> idQueue = Lists.newLinkedList();//待处理队列
		Set<Integer> idSet = Sets.newHashSet();//已经处理集合
		idQueue.add(parentId);//QUEUE<-I
		for (; !idQueue.isEmpty();) {
			Integer id = idQueue.remove();//QUEUE->I
			idSet.add(id);//
			for (AuthOrgEntity entity : findChildren(id)) {
				if (!idSet.contains(entity.getId())) {
					entities.add(entity);
					idQueue.add(entity.getId());//QUEUE<-I
				}
			}
		}
		return entities;
	}
	
	/**
	 * 查询子机构
	 * @param parentId 机构ID
	 * @return 子机构列表
	 */
	public List<AuthOrgEntity> findChildren(Integer parentId) {
		Criteria dc = createCriteria(AuthOrgEntity.class);
		dc.add(Restrictions.eq("this.parentId", parentId));
		
		dc.add(Restrictions.eq("this.state", 1));
		dc.addOrder(Order.asc("this.createTime"));
		return super.findByCriteria(dc);
	}

	/**
	 * 查询所有可用机构
	 * @return
	 */
	public List<AuthOrgEntity> findEnable() {
		Criteria dc = createCriteria(AuthOrgEntity.class);
		dc.add(Restrictions.eq("this.state", 1));
		return super.findByCriteria(dc);
	}

	/**
	 * 删除机构--将state状态改变
	 * @param requestMap
	 */
	public Integer delete(Map<String, Object> map) {
		String sql = "update auth_org set state = '"+ map.get("state") +"' where id = '"+ map.get("id") +"' ";
		return this.jdbcTemplate.update(sql);
	}

}
