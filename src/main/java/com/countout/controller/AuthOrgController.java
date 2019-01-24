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

import com.countout.entity.AuthOrgEntity;
import com.countout.service.AuthOrgService;
import com.countout.vo.AuthOrgVo;
import com.tang.util.page.Page;


/**
 * 机构请求
 * @author Mr.tang
 */
@Controller
@RequestMapping(value = "/authOrg")
public class AuthOrgController {
	
	private final Logger logger = Logger.getLogger(AuthOrgController.class);
	
//	private Map<String, Object> resultMap = new HashMap<String, Object>();
	
	@Autowired
	private AuthOrgService authOrgService;
	
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
			Page<AuthOrgEntity> list = this.authOrgService.pageQuery(requestMap);
			resultMap.put("list", list);
			resultMap.put("msg", "查询成功");
		} catch (Exception e) {
			resultMap.put("msg", "查询出现异常！");
			resultMap.put("flg", Boolean.FALSE);
			logger.error("机构分页查询异常！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
	
	/**
	 * 新增或保存机构
	 * @param request
	 * @param requestMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "saveOrUpdate.do")
	public Object saveOrUpdate(HttpServletRequest request, @RequestBody Map<String, Object> requestMap){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			this.authOrgService.saveOrUpdate(requestMap);
			resultMap.put("msg", "保存成功！");
			resultMap.put("flg", Boolean.TRUE);
		} catch (Exception e) {
			resultMap.put("msg", "保存出现异常！");
			resultMap.put("flg", Boolean.FALSE);
			logger.error("新增或保存机构异常！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
	
	/**
	 * 查询单个机构
	 * @param request
	 * @param requestMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "view.do")
	public Object view(HttpServletRequest request, @RequestBody Map<String, Object> requestMap){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			AuthOrgEntity entity = this.authOrgService.view(requestMap);
			resultMap.put("msg", "查询单个机构成功！");
			resultMap.put("flg", Boolean.TRUE);
			resultMap.put("entity", entity);
		} catch (Exception e) {
			resultMap.put("msg", "查询单个机构出现异常！");
			resultMap.put("flg", Boolean.FALSE);
			logger.error("查询单个机构异常！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
	
	/**
	 * 删除单个机构
	 * @param request
	 * @param requestMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "delete.do")
	public Object delete(HttpServletRequest request, @RequestBody Map<String, Object> requestMap){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			this.authOrgService.delete(requestMap);
			resultMap.put("msg", "删除机构成功！");
			resultMap.put("flg", Boolean.TRUE);
		} catch (Exception e) {
			resultMap.put("msg", "删除机构机构出现异常！");
			resultMap.put("flg", Boolean.FALSE);
			logger.error("删除机构异常！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
	
	/**
	 * 查询所有--机构树
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/loadTree.do")
	public Object loadTree(){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<AuthOrgVo> list = this.authOrgService.getTree();
			resultMap.put("list", list);
			resultMap.put("flg", Boolean.TRUE);
		} catch (Exception e) {
			resultMap.put("flg", Boolean.FALSE);
			resultMap.put("msg", "查询异常");
			logger.error("查询所有--机构树异常！"+e);
			e.printStackTrace();
		}
		return resultMap;
	}
}
