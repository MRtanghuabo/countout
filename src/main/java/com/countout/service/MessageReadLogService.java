package com.countout.service;

import java.util.Map;

import com.countout.entity.MessageEntity;
import com.countout.entity.MessageReadLogEntity;
import com.tang.util.page.Page;

/**
 * 推送消息读取日志
 * @author Mr.tang
 */
public interface MessageReadLogService {

	/**
	 * 查询日志读取记录
	 * @param requestMap
	 * @return
	 */
	Page<MessageReadLogEntity> pageQuery(Map<String, Object> requestMap);

	/**
	 * 查询读取的消息
	 * @param requestMap
	 * @return
	 */
	MessageEntity queryMessage(Map<String, Object> requestMap);

}
