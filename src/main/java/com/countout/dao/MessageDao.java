package com.countout.dao;

import java.util.Date;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.countout.entity.MessageEntity;
import com.tang.plug.hibernate.HibernateSimpleEntityDao;
import com.tang.util.page.Page;

/**
 * 推送消息
 * @author Mr.tang
 */
@Repository
public class MessageDao extends HibernateSimpleEntityDao<MessageEntity>{

	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	/**
	 * 分页查询
	 * @param requestMap
	 * @return
	 */
	public Page<MessageEntity> pageQuery(Map<String, Object> requestMap) {
		Criteria dc = createCriteria(MessageEntity.class);
		int start = (Integer) requestMap.get("pageNum");
		int pageSize = (Integer) requestMap.get("pageSize");
		int pageNum = (start-1) * pageSize;
		
		//查询参数
		Integer orgIds = (Integer) requestMap.get("orgIds");
		Date beginTime = (Date)  requestMap.get("beginTime");
		Date endTime = (Date)  requestMap.get("endTime");
		/*if (StringUtils.isNotEmpty(name)) {
			dc.add(Restrictions.like("this.name", name, MatchMode.ANYWHERE));
		}*/
		if (orgIds != null) {
			dc.add(Restrictions.eq("this.orgIds", orgIds));
		}
		if(beginTime != null){
			dc.add(Restrictions.and(Restrictions.gt("this.createTime", beginTime)));
		}
		if(endTime != null ){
			dc.add(Restrictions.and(Restrictions.le("this.createTime",endTime)));
		}
		
		dc.add(Restrictions.eq("this.del", 1));
		dc.addOrder(Order.asc("this.createTime"));
		
		return super.pagedQuery(dc, pageNum, pageSize);
	}
	
	/**
	 * 更改消息推送状态
	 * @param map
	 */
	public Integer pushMessage(Map<String, Object> map) {
		String sql = "update message set state = '"+ map.get("state") +"' where id = '"+ map.get("id") +"' ";
		return this.jdbcTemplate.update(sql);
	}
}
