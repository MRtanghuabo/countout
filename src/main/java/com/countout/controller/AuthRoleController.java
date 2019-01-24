package com.countout.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.countout.entity.AuthRoleEntity;
import com.countout.service.AuthRoleService;
import com.tang.util.page.Page;

/**
 * 角色
 * @author Mr.tang
 */
@Controller
@RequestMapping(value = "/authRole")
public class AuthRoleController {
	
	private final Logger logger = Logger.getLogger(AuthRoleController.class);
	
//	private Map<String, Object> resultMap = new HashMap<String, Object>();
	
	@Autowired
	private AuthRoleService authRoleService;
	
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
			Page<AuthRoleEntity> userList = this.authRoleService.pageQuery(requestMap);
			resultMap.put("userList", userList);
			resultMap.put("msg", "角色查询成功");
		} catch (Exception e) {
			resultMap.put("msg", "角色查询出现异常！");
			resultMap.put("flg", Boolean.FALSE);
			logger.error("角色分页查询异常！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
	
	/**
	 * 新增或保存角色
	 * @param request
	 * @param requestMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/saveOrUpdate.do")
	public Object saveOrUpdate(HttpServletRequest request, @RequestBody Map<String, Object> requestMap){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			this.authRoleService.saveOrUpdate(requestMap);
			resultMap.put("msg", "保存成功！");
			resultMap.put("flg", Boolean.TRUE);
		} catch (Exception e) {
			resultMap.put("msg", "保存出现异常！");
			resultMap.put("flg", Boolean.FALSE);
			logger.error("新增或修改角色异常！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
	
	/**
	 * 查看角色
	 * @param request
	 * @param requestMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/view.do")
	public Object view(HttpServletRequest request, @RequestBody Map<String, Object> requestMap){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			AuthRoleEntity entity = this.authRoleService.view(requestMap);
			resultMap.put("msg", "查看角色成功！");
			resultMap.put("entity", entity);
			resultMap.put("flg", Boolean.TRUE);
		} catch (Exception e) {
			resultMap.put("msg", "查看角色出现异常！");
			resultMap.put("flg", Boolean.FALSE);
			logger.error("查看角色异常！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
	
	/**
	 * 根据机构id查询角色集合
	 * @param request
	 * @param requestMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/queryRoleByOrgId.do")
	public Object queryRoleByOrgId(HttpServletRequest request, @RequestBody Map<String, Object> requestMap){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<AuthRoleEntity> list = this.authRoleService.queryRoleByOrgId(requestMap);
			resultMap.put("msg", "查询成功！");
			resultMap.put("list", list);
			resultMap.put("flg", Boolean.TRUE);
		} catch (Exception e) {
			resultMap.put("msg", "查询出现异常！");
			resultMap.put("flg", Boolean.FALSE);
			logger.error("查询出现异常！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
	
}
