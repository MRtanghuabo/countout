package com.countout.dao;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.countout.entity.CarInfoManagerEntity;
import com.tang.plug.hibernate.HibernateSimpleEntityDao;
import com.tang.util.page.Page;

/**
 * 车辆信息管理模块--数据底层
 * @author Mr.tang
 */
@Repository
public class CarInfoManagerDao extends HibernateSimpleEntityDao<CarInfoManagerEntity> {

	/**
	 * 车辆信息管理分页查询
	 * @param requestMap
	 * @return
	 */
	public Page<CarInfoManagerEntity> pageQuery(Map<String, Object> requestMap) {
		Criteria dc = createCriteria(CarInfoManagerEntity.class);
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

}
