package com.countout.service;

import java.util.Map;

import com.countout.entity.CarInfoManagerEntity;
import com.tang.util.page.Page;

/**
 * 车辆信息管理模块--实现接口
 * @author Mr.tang
 */
public interface CarInfoManagerService {

	/**
	 * 车辆信息管理分页查询
	 * @param requestMap
	 * @return
	 */
	Page<CarInfoManagerEntity> pageQuery(Map<String, Object> requestMap);

}
