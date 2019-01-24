package com.countout.dao;

import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.countout.entity.MessageReadLogEntity;
import com.countout.portal.security.UserHolder;
import com.tang.plug.hibernate.HibernateSimpleEntityDao;
import com.tang.util.page.Page;

/**
 * 记录消息读取记录
 * @author Mr.tang
 */
@Repository
public class MessageReadLogDao extends HibernateSimpleEntityDao<MessageReadLogEntity> {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 * 查询读取日志记录
	 * @param requestMap
	 * @return
	 */
	public Page<MessageReadLogEntity> pagedQuery(Map<String, Object> requestMap) {
		Criteria dc = createCriteria(MessageReadLogEntity.class);
		int start = (Integer) requestMap.get("pageNum");
		int pageSize = (Integer) requestMap.get("pageSize");
		int pageNum = (start-1) * pageSize;
		
		dc.add(Restrictions.eq("this.userId", UserHolder.getId()));
		dc.addOrder(Order.asc("this.createTime"));
		return super.pagedQuery(dc, pageNum, pageSize);
	}

	/**
	 * 将消息记录表的读取状态更改至读取状态
	 * @param requestMap
	 */
	public Integer updateById(Map<String, Object> map) {
		String sql = "update message_log set is_read = 1 where id = '"+ map.get("id") +"' ";
		return this.jdbcTemplate.update(sql);
	}

}
