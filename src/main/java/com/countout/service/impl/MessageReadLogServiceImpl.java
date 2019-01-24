package com.countout.service.impl;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.countout.dao.MessageDao;
import com.countout.dao.MessageReadLogDao;
import com.countout.entity.MessageEntity;
import com.countout.entity.MessageReadLogEntity;
import com.countout.service.MessageReadLogService;
import com.tang.util.page.Page;


/**
 * 推送消息日志记录
 * @author Mr.tang
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class MessageReadLogServiceImpl implements MessageReadLogService {
	
	private final Logger logger = Logger.getLogger(MessageReadLogServiceImpl.class);
	
	@Autowired
	private MessageDao messageDao;
	
	@Autowired
	private MessageReadLogDao messageReadLogDao;

	/**
	 * 查询日志读取记录
	 * @param requestMap
	 * @return
	 */
	@Override
	public Page<MessageReadLogEntity> pageQuery(Map<String, Object> requestMap) {
		logger.info("查询日志读取记录");
		return this.messageReadLogDao.pagedQuery(requestMap);
	}

	/**
	 * 查询读取的消息
	 * @param requestMap
	 * @return
	 */
	@Override
	public MessageEntity queryMessage(Map<String, Object> requestMap) {
		logger.info("查询读取的消息");
		//1、将消息记录表的读取状态更改至读取状态
		this.messageReadLogDao.updateById(requestMap);
		
		//2、查询消息信息
		return this.messageDao.getById((Integer) requestMap.get("messageId"));
	}
}
