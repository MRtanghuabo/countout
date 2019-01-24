package com.countout.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.countout.entity.CarInfoManagerEntity;
import com.countout.service.CarInfoManagerService;
import com.tang.util.page.Page;

/**
 * 车辆信息管理模块
 * @author Mr.tang
 */
@Controller
@RequestMapping(value = "/resourceManager")
public class CarInfoManagerController {
	
	private final Logger logger = Logger.getLogger(CarInfoManagerController.class);
	
//	private Map<String, Object> resultMap = new HashMap<String, Object>();

	@Autowired
	private CarInfoManagerService carInfoManagerService;
	
	/**
	 * 分页查询
	 * @param request
	 * @param requestMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/page.do")
	public Object pageQuery(HttpServletRequest request, @RequestBody Map<String, Object> requestMap){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			Page<CarInfoManagerEntity> carInfoList = this.carInfoManagerService.pageQuery(requestMap);
			resultMap.put("carInfoList", carInfoList);
			resultMap.put("msg", "车辆信息列表查询成功");
		} catch (Exception e) {
			resultMap.put("msg", "车辆信息列表查询异常！");
			resultMap.put("flg", Boolean.FALSE);
			logger.error("车辆信息列表查询异常！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
}
