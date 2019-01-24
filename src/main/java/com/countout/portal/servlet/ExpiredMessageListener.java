package com.countout.portal.servlet;

import org.springframework.data.redis.connection.MessageListener;

/**
 * 监听redis过期key
 * @author Mr.tang
 */
public interface ExpiredMessageListener extends MessageListener {

}
