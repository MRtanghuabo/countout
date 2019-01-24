package com.countout.service;

import java.util.List;
import java.util.Map;

import com.countout.entity.MessageEntity;
import com.countout.vo.MessageVo;
import com.tang.util.page.Page;

/**
 * 推送消息
 * @author Mr.tang
 */
public interface MessageService {

	/**
	 * 新增或修改要推送的消息
	 * @param map
	 */
	void saveOrUpdate(Map<String, Object> map);

	/**
	 * 推送消息审核操作
	 * @param map
	 */
	void pushMessage(Map<String, Object> map);

	/**
	 * 分页查询
	 * @param requestMap
	 * @return
	 */
	Page<MessageEntity> pageQuery(Map<String, Object> requestMap);

	/**
	 * 查询redis中推送审核通过的消息
	 * @param map
	 * @return
	 */
	List<MessageVo> queryMessage(Map<String, Object> map);

}
