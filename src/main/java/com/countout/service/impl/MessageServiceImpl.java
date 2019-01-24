package com.countout.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.countout.dao.MessageDao;
import com.countout.dao.MessageReadLogDao;
import com.countout.entity.MessageEntity;
import com.countout.entity.MessageReadLogEntity;
import com.countout.portal.base.BaseConstants;
import com.countout.portal.redisCache.JedisClientPool;
import com.countout.portal.security.UserHolder;
import com.countout.service.MessageService;
import com.countout.util.BeanJsonStrUtil;
import com.countout.vo.MessageVo;
import com.tang.util.page.Page;

/**
 * 消息推送信息等
 * @author Mr.tang
 */
@Service("messageServiceImpl")
@Transactional(rollbackFor = Exception.class)
public class MessageServiceImpl implements MessageService {
	
	private final Logger logger = Logger.getLogger(MessageServiceImpl.class);
	
//	@Autowired
//	private  JedisClient jedisClient;
	
	@Autowired
	private JedisClientPool jedisClientPool; 
	
	@Autowired
	private MessageDao messageDao;
	
	@Autowired
	private MessageReadLogDao messageReadLogDao;
	
	/**
	 * 分页查询
	 * @param requestMap
	 * @return
	 */
	@Override
	public Page<MessageEntity> pageQuery(Map<String, Object> requestMap) {
		logger.info("分页查询用户信息");
		Page<MessageEntity> list = this.messageDao.pageQuery(requestMap);
		return list;
	}

	/**
	 * 新增要推送的消息
	 * @param map
	 */
	@Override
	public void saveOrUpdate(Map<String, Object> map) {
		MessageEntity entity = convertToEntity(map);
		Integer id = entity.getId();
		
		if(id != null){//新增消息提醒
			logger.info("新增要推送的消息");
			this.messageDao.save(entity);
		}else{//修改要提醒的消息
			logger.info("修改要提醒的消息");
			//1、修改删除redis中的提醒数据
			MessageEntity delEntity = this.messageDao.getById(id);
			String userId = delEntity.getUserIds();
			String[] userIds = userId.split(",");
			for (int i = 0; i < userIds.length; i++) {
				this.jedisClientPool.del(BaseConstants.MESSAGE+userIds[i]);
			}
			
			//2、修改数据库中的数据
			this.messageDao.update(entity);
			
			String userId1 = delEntity.getUserIds();
			String[] userIds1 = userId1.split(",");
			for (int i = 0; i < userIds1.length; i++) {
				//数据存储至redis
				MessageVo vo = new MessageVo();
				vo.setMessageId(entity.getId());
				vo.setUserId(Integer.parseInt(userIds[i]));
				vo.setTitle(entity.getTitle());
				vo.setMode(entity.getMode());
				vo.setPushTime(entity.getPushTime());//推送时间
				vo.setTimes(entity.getTimes());
				vo.setIsRead(0);//消息标记为未读
				this.jedisClientPool.set(BaseConstants.MESSAGE+userIds[i], BeanJsonStrUtil.toJSON(vo));
				
				
				//设置redis的过期时间
				Calendar cal = Calendar.getInstance();
				Date aboveData = entity.getPushTime();
				Date afterDate = entity.getPushTime();
				//推送次数 0-推送一次，1-一天，2-一周，3-一月
				if(entity.getTimes() == 1){//
					cal.setTime(afterDate);//设置起时间
					cal.add(Calendar.DATE, 1);//增加一天  
					int second = interval(aboveData,afterDate)+10;
					this.jedisClientPool.expire(BaseConstants.MESSAGE+userIds[i], second);
				}else if(entity.getTimes() == 2){
					cal.setTime(afterDate);//设置起时间
					cal.add(Calendar.DATE, 7);//增加七天  
					int second = interval(aboveData,afterDate)+10;
					this.jedisClientPool.expire(BaseConstants.MESSAGE+userIds[i], second);
				}else if(entity.getTimes() == 3){
					cal.setTime(afterDate);//设置起时间
					cal.add(Calendar.MONTH, 1);//增加一个月 
					int second = interval(aboveData,afterDate)+10;
					this.jedisClientPool.expire(BaseConstants.MESSAGE+userIds[i], second);
				}
			}
		}
	}
	
	/**
	 * 计算时间相差多少秒
	 * @param aboveData
	 * @param afterDate
	 * @return
	 */
	public Integer interval(Date aboveData, Date afterDate){
		int interval = (int) ((afterDate.getTime() - aboveData.getTime())/1000);
		return interval;
	}

	/**
	 * 将传入的map转换为实体
	 * @param map
	 * @return
	 */
	private MessageEntity convertToEntity(Map<String, Object> map) {
		MessageEntity entity = new MessageEntity();
		entity.setId((Integer) map.get("id"));
		entity.setOrgIds((String) map.get("orgIds"));
		entity.setRoleIds((String) map.get("roleIds"));
		entity.setUserIds((String) map.get("userIds"));
		entity.setTitle((String) map.get("title"));
		entity.setContext((String) map.get("context"));
		entity.setMode((Integer) map.get("mode"));
		entity.setPushTime((Date) map.get("pushTime"));
		entity.setTimes((Integer) map.get("times"));
		entity.setCreateUser(UserHolder.getId());
		entity.setCreateTime(new Date());
		entity.setUpdateUser(UserHolder.getId());
		entity.setUpdateTime(new Date());
		return entity;
	}

	/**
	 * 推送消息审核操作
	 * @param map
	 */
	@Override
	public void pushMessage(Map<String, Object> map) {
		logger.info("推送消息审核操作");
		//1、更改消息推送状态
		this.messageDao.pushMessage(map);
		Integer id = (Integer) map.get("id");
		int state = (Integer) map.get("state");
		if(state==2){
			//2、将消息推送的消息保存至redis
			MessageEntity entity = this.messageDao.getById(id);
			String userId = entity.getUserIds();
			String[] userIds = userId.split(",");
			for (int i = 0; i < userIds.length; i++) {
				//1、数据存储至数据库日志表
				MessageReadLogEntity logEntity = new MessageReadLogEntity();
				logEntity.setMessageId(entity.getId());
				logEntity.setUserId(Integer.parseInt(userIds[i]));
				logEntity.setCreateTime(new Date());
				logEntity.setIsRead(0);
				this.messageReadLogDao.save(logEntity);
				
				//2、数据存储至redis
				MessageVo vo = new MessageVo();
				vo.setMessageId(entity.getId());
				vo.setUserId(Integer.parseInt(userIds[i]));
				vo.setTitle(entity.getTitle());
				vo.setMode(entity.getMode());
				vo.setPushTime(entity.getPushTime());//推送时间
				vo.setTimes(entity.getTimes());
				vo.setIsRead(0);//消息标记为未读
				
				this.jedisClientPool.set(BaseConstants.MESSAGE+userIds[i], BeanJsonStrUtil.toJSON(vo));
				
				//3、设置redis的过期时间
				Calendar cal = Calendar.getInstance();
				Date aboveData = entity.getPushTime();
				Date afterDate = entity.getPushTime();
				//推送次数 0-推送一次，1-一天，2-一周，3-一月
				if(entity.getTimes() == 1){//
					cal.setTime(afterDate);//设置起时间
					cal.add(Calendar.DATE, 1);//增加一天  
					int second = interval(aboveData,afterDate)+10;
					this.jedisClientPool.expire(BaseConstants.MESSAGE+userIds[i], second);
				}else if(entity.getTimes() == 2){
					cal.setTime(afterDate);//设置起时间
					cal.add(Calendar.DATE, 7);//增加七天  
					int second = interval(aboveData,afterDate)+10;
					this.jedisClientPool.expire(BaseConstants.MESSAGE+userIds[i], second);
				}else if(entity.getTimes() == 3){
					cal.setTime(afterDate);//设置起时间
					cal.add(Calendar.MONTH, 1);//增加一个月 
					int second = interval(aboveData,afterDate)+10;
					this.jedisClientPool.expire(BaseConstants.MESSAGE+userIds[i], second);
				}
			}
		}
	}

	/**
	 * 查询redis中推送审核通过的消息
	 * @param map
	 * @return
	 */
	@Override
	public List<MessageVo> queryMessage(Map<String, Object> map) {
//		String key = "*" + UserHolder.getId();
		String str = "*" + map.get("id");
		Set<String> keys = this.jedisClientPool.keys(str);
		List<MessageVo> listVo = new ArrayList<MessageVo>();
		if(keys != null && keys.size()>0){
			for (String key : keys) {
				listVo.add(BeanJsonStrUtil.parse(this.jedisClientPool.get(key), MessageVo.class));
			}
		}
		return listVo;
	}

}
