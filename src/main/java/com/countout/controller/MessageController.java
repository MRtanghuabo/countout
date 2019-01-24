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

import com.countout.entity.MessageEntity;
import com.countout.service.MessageService;
import com.countout.vo.MessageVo;
import com.tang.util.page.Page;

/**
 * 消息推送
 * @author Mr.tang
 */
@Controller
@RequestMapping(value = "/message")
public class MessageController {
	
	private final Logger logger = Logger.getLogger(MessageController.class);
	
//	private Map<String, Object> result = new HashMap<String, Object>();
	
	@Autowired
	private MessageService messageService;
	
	/**
	 * 分页查询
	 * @param request
	 * @param requestMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "page.do")
	public Object pageQuery(HttpServletRequest request, @RequestBody Map<String, Object> requestMap){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Page<MessageEntity> userList = this.messageService.pageQuery(requestMap);
			result.put("userList", userList);
			result.put("msg", "推送消息查询成功查询成功");
		} catch (Exception e) {
			result.put("msg", "推送消息查询出现异常！");
			result.put("flg", Boolean.FALSE);
			logger.error("推送消息分页查询异常！"+e);
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 新增要推送的消息
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/saveOrUpdate.do")
	public Object saveOrUpdate(@RequestBody Map<String, Object> map){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.messageService.saveOrUpdate(map);
			result.put("msg", "操作成功！");
			result.put("flg", Boolean.TRUE);
		} catch (Exception e) {
			result.put("msg", "操作出现异常！");
			result.put("flg", Boolean.FALSE);
			logger.error("新增或修改要推送的消息异常！"+e);
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 推送消息审核操作
	 * @param 审核推送的消息
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/pushMessage.do")
	public Object pushMessage(@RequestBody Map<String, Object> map){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.messageService.pushMessage(map);
			result.put("msg", "操作成功！");
			result.put("flg", Boolean.TRUE);
		} catch (Exception e) {
			result.put("flg", Boolean.FALSE);
			result.put("msg", "操作出现异常！");
			logger.error("推送消息审核操作异常！"+e);
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 查询redis中推送审核通过的消息
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/queryMessage.do")
	public Object queryMessage(@RequestBody Map<String, Object> map){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			List<MessageVo> listVo = this.messageService.queryMessage(map);
			result.put("listVo", listVo);
			result.put("msg", "操作成功！");
			result.put("flg", Boolean.TRUE);
		} catch (Exception e) {
			result.put("flg", Boolean.FALSE);
			result.put("msg", "操作出现异常！");
			logger.error("查询redis中推送审核通过的消息异常！"+e);
			e.printStackTrace();
		}
		return result;
	}
	
}
