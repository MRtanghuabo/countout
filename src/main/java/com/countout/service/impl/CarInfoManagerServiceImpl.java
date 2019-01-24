package com.countout.service.impl;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.countout.dao.CarInfoManagerDao;
import com.countout.entity.CarInfoManagerEntity;
import com.countout.service.CarInfoManagerService;
import com.tang.util.page.Page;

/**
 * 车辆信息管理模块--实现方法
 * @author Mr.tang
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class CarInfoManagerServiceImpl implements CarInfoManagerService {

	private final Logger logger = Logger.getLogger(CarInfoManagerServiceImpl.class);
	
	@Autowired
	private CarInfoManagerDao carInfoManagerDao;

	/**
	 * 车辆信息管理分页查询
	 * @param requestMap
	 * @return
	 */
	@Override
	public Page<CarInfoManagerEntity> pageQuery(Map<String, Object> requestMap) {
		logger.info("分页查询车辆信息！");
		Page<CarInfoManagerEntity> carInfoList = this.carInfoManagerDao.pageQuery(requestMap);
		return carInfoList;
	}
}
