package com.countout.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.countout.service.AuthPermissionService;
import com.countout.vo.AuthPermissionNodeVo;

/**
 * 菜单管理
 * @author Mr.tang
 */
@Controller
@RequestMapping(value = "/authPermission")
public class AuthPermissionController {
	
	private final Logger logger = Logger.getLogger(AuthPermissionController.class);
	
//	private Map<String, Object> resultMap = new HashMap<String, Object>();
	
	@Autowired
	private AuthPermissionService authPermissionService;
	
	/**
	 * 查询所有--菜单树
	 * @return
	 */
	@RequestMapping(value = "/loadTree.do")
	@ResponseBody
	public Object loadTree() {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<AuthPermissionNodeVo> list = authPermissionService.getTree();
			resultMap.put("list", list);
			resultMap.put("flg", Boolean.TRUE);
		} catch (Exception e) {
			resultMap.put("flg", Boolean.FALSE);
			resultMap.put("msg", "查询异常");
			logger.error("查询所有--菜单树异常！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
	
	/**
	 * 根据角色Id查询菜单树--菜单树
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/loadTreeByRoleId.do")
	public Object loadTreeByRoleId(@RequestBody Map<String, Object> requestMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<AuthPermissionNodeVo> list = authPermissionService.loadTreeByRoleId(requestMap);
			resultMap.put("list", list);
			resultMap.put("flg", Boolean.TRUE);
		} catch (Exception e) {
			resultMap.put("flg", Boolean.FALSE);
			resultMap.put("msg", "查询异常");
			logger.error("根据角色Id查询菜单树--菜单树异常！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
	
}
