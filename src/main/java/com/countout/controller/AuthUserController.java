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

import com.countout.entity.AuthUserEntity;
import com.countout.service.AuthUserService;
import com.tang.util.page.Page;

/**
 * 用户controller层
 * @author Mr.tang
 */
@Controller
@RequestMapping(value="/authUser")
public class AuthUserController {
	
	private final Logger logger = Logger.getLogger(AuthUserController.class);
	
//	private Map<String, Object> resultMap = new HashMap<String, Object>();
	
	@Autowired
	private AuthUserService authUserService;
	
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
			Page<AuthUserEntity> userList = this.authUserService.pageQuery(requestMap);
			resultMap.put("userList", userList);
			resultMap.put("msg", "用户查询成功");
		} catch (Exception e) {
			resultMap.put("msg", "用户查询出现异常！");
			resultMap.put("flg", Boolean.FALSE);
			logger.error("用户分页查询异常！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
	
	/**
	 * 新增或修改用户
	 * @param request
	 * @param requestMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "saveOrUpdate.do")
	public Object saveOrUpdate(HttpServletRequest request, @RequestBody Map<String, Object> requestMap){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			this.authUserService.saveOrUpdate(requestMap);
			resultMap.put("msg", "保存成功！");
			resultMap.put("flg", Boolean.TRUE);
		} catch (Exception e) {
			resultMap.put("msg", "保存出现异常！");
			resultMap.put("flg", Boolean.FALSE);
			logger.error("用户新增或修改异常！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
	
	/**
	 * 启用或禁用用户
	 * @param request
	 * @param requestMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "enabled.do")
	public Object enabled(HttpServletRequest request, @RequestBody Map<String, Object> requestMap){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			this.authUserService.enabled(requestMap);
			resultMap.put("msg", "操作成功！");
			resultMap.put("flg", Boolean.TRUE);
		} catch (Exception e) {
			resultMap.put("msg", "操作失败！");
			resultMap.put("flg", Boolean.FALSE);
			logger.error("启用或禁用用户异常！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
	
	/**
	 * 删除用户
	 * @param request
	 * @param requestMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "delete.do")
	public Object delete(HttpServletRequest request, @RequestBody Map<String, Object> requestMap){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			this.authUserService.delete(requestMap);
			resultMap.put("msg", "操作成功！");
			resultMap.put("flg", Boolean.TRUE);
		} catch (Exception e) {
			resultMap.put("msg", "操作失败！");
			resultMap.put("flg", Boolean.FALSE);
			logger.error("删除用户异常！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
	
	/**
	 * 查看用户时查询用户信息
	 * @param request
	 * @param requestMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "view.do")
	public Object view(HttpServletRequest request, @RequestBody Map<String, Object> requestMap){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			AuthUserEntity entity = this.authUserService.view(requestMap);
			entity.setOrgName(entity.get_AuthOrgEntity().getName());
			resultMap.put("entity", entity);
			resultMap.put("msg", "操作成功！");
			resultMap.put("flg", Boolean.TRUE);
		} catch (Exception e) {
			resultMap.put("msg", "操作失败！");
			resultMap.put("flg", Boolean.FALSE);
			logger.error("查看用户时查询用户信息！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
	
	/**
	 * 根据角色Id集合查询用户
	 * @param request
	 * @param requestMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "queryUserByRoleId.do")
	public Object queryUserByRoleId(HttpServletRequest request, @RequestBody Map<String, Object> requestMap){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<AuthUserEntity> list = this.authUserService.queryUserByRoleId(requestMap);
			resultMap.put("msg", "操作成功！");
			resultMap.put("list", list);
			resultMap.put("flg", Boolean.TRUE);
		} catch (Exception e) {
			resultMap.put("msg", "操作失败！");
			resultMap.put("flg", Boolean.FALSE);
			logger.error("根据角色Id集合查询用户异常！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
}
