package com.countout.portal.servlet;

import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServlet;

import com.countout.portal.redisCache.KeyExpiredListener;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * 监控redis的key失效
 * @author Mr.tang
 */
@SuppressWarnings("serial")
public class JedisServlet extends HttpServlet {
	
	public void init() {
		Timer timer = new Timer();
		timer.schedule(new TimerTask() {
			private JedisPool pool;
			public void run() {
				System.out.println("-------设定要指定任务--------");
				pool = new JedisPool(new JedisPoolConfig(), "localhost");
				Jedis jedis = pool.getResource();
		        jedis.psubscribe(new KeyExpiredListener(), "__key*__:*");
			}
		}, 2000);// 设定指定的时间time,此处为2000毫秒
	}
}
