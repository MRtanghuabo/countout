package com.countout.portal.redisCache;

import redis.clients.jedis.JedisPubSub;

/**
 * 负责监听redis中的key是否到达失效时间， 到达失效时间时调用方法
 * 
 * @author Mr.tang
 */
public class KeyExpiredListener extends JedisPubSub {
	
//	@Autowired
//	private MessageReadLogService messageReadLogService;
	
	/**
	 * redis的key失效时执行的方法
	 * 但是此方法需要订阅者
	 *  JedisPool pool = new JedisPool(new JedisPoolConfig(), "localhost");
     *  Jedis jedis = pool.getResource();
     *  jedis.psubscribe(new KeyExpiredListener(), "__key*__:*");
	 */
	@Override
	public void onPMessage(String pattern, String channel, String message) {
		System.out.println("1111111");
		System.out.println("监控的redis库"  + pattern + "通道" + channel + "失效的key" + message);
		
	}

	/**
	 * 订阅是执行
	 */
	@Override
	public void onPSubscribe(String pattern, int subscribedChannels) {
		System.out.println("订阅时执行 " + pattern + " " + subscribedChannels);
	}
	
	@Override
	public void onMessage(String channel, String message) {
        System.out.println("onMessage");
        System.out.println(message);
    }

}
