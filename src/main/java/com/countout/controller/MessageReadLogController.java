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

import com.countout.entity.MessageEntity;
import com.countout.entity.MessageReadLogEntity;
import com.countout.service.MessageReadLogService;
import com.tang.util.page.Page;

/**
 * 日志读取记录
 * @author Mr.tang
 */
@Controller
@RequestMapping(value = "/messageReadLog")
public class MessageReadLogController {
	
	private final Logger logger = Logger.getLogger(MessageReadLogController.class);
	
//	private Map<String, Object> result = new HashMap<String, Object>();
	
	@Autowired
	private MessageReadLogService messageReadLogService;

	/**
	 * 分页查询
	 * @param request
	 * @param requestMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/page.do")
	public Object pageQuery(HttpServletRequest request, @RequestBody Map<String, Object> requestMap){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Page<MessageReadLogEntity> logList = this.messageReadLogService.pageQuery(requestMap);
			result.put("logList", logList);
			result.put("flg", Boolean.TRUE);
			result.put("msg", "日志读取记录分页查询成功");
		} catch (Exception e) {
			result.put("msg", "查询出现异常！");
			result.put("flg", Boolean.FALSE);
			logger.error("日志读取记录分页查询异常！"+e);
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 读取消息
	 * @param request
	 * @param requestMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/viewMessage")
	public Object viewMessage(HttpServletRequest request, @RequestBody Map<String, Object> requestMap){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			MessageEntity userList = this.messageReadLogService.queryMessage(requestMap);
			result.put("userList", userList);
			result.put("msg", "消息信息查询成功");
			result.put("flg", Boolean.TRUE);
		} catch (Exception e) {
			result.put("msg", "消息信息查询出现异常！");
			result.put("flg", Boolean.FALSE);
			logger.error("读取消息出现异常！"+e);
			e.printStackTrace();
		}
		return result;
	}
	
}
