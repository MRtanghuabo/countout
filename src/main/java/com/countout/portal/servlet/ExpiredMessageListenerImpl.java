package com.countout.portal.servlet;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.listener.PatternTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;


/**
 * 监听redis过期key
 * @author Mr.tang
 */
//@Service
public class ExpiredMessageListenerImpl implements InitializingBean, ExpiredMessageListener {
 
    @Autowired(required=true)
    private RedisMessageListenerContainer redisMessageListenerContainer;
    
    @Autowired(required=true)
    private StringRedisTemplate stringRedisTemplate;
 
    @Override
    public void onMessage(Message message, byte[] pattern) {
        System.out.println("onMessage");
        System.out.println(new String(message.getBody()));
    }
 
    @Override
    public void afterPropertiesSet() throws Exception {
        System.out.println("111111");
        redisMessageListenerContainer.addMessageListener(this,new PatternTopic("__key*__:*"));
        redisMessageListenerContainer.setConnectionFactory(stringRedisTemplate.getConnectionFactory());
    }
    
}

