package com.countout.portal.redisCache;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * jedis操作类
 * @author Mr.tang
 */
public class JedisClientPool {
	
	@Autowired
	private JedisPool jedisPool;

	public String get(String key) {
		Jedis jedis = jedisPool.getResource();
		String result = jedis.get(key);
		jedis.close();
		return result;
	}

	public String set(String key, String value) {
		Jedis jedis = jedisPool.getResource();
		String string = jedis.set(key, value);
		jedis.close();
		return string;
	}

	public long incr(String key) {
		Jedis jedis = jedisPool.getResource();
		Long result = jedis.incr(key);
		jedis.close();
		return result;
	}

	public Long hset(String hkey, String key, String value) {
		Jedis jedis = jedisPool.getResource();
		Long hset = jedis.hset(hkey, key, value);
		jedis.close();
		return hset;
	}

	public String hget(String hkey, String key) {
		Jedis jedis = jedisPool.getResource();
		String result = jedis.hget(hkey, key);
		jedis.close();
		return result;
	}

	public Long del(String key) {
		Jedis jedis = jedisPool.getResource();
		Long result = jedis.del(key);
		jedis.close();
		return result;
	}

	public Long hdel(String hkey, String key) {
		Jedis jedis = jedisPool.getResource();
		Long result = jedis.hdel(hkey, key);
		jedis.close();
		return result;
	}

	/**
	 * 设置过期时间
	 * @param key
	 * @param second
	 * @return
	 */
	public Long expire(String key, int second) {
		Jedis jedis = jedisPool.getResource();
		Long result = jedis.expire(key, second);
		jedis.close();
		return result;
	}

	public List<String> hvals(String key) {
		Jedis jedis = jedisPool.getResource();
		List<String> hvals = jedis.hvals(key);
		jedis.close();
		return hvals;
	}

	public Long hlen(String key) {
		Jedis jedis = jedisPool.getResource();
		Long hlen = jedis.hlen(key);
		jedis.close();
		return hlen;
	}
	
	public Set<String> keys(String pattern) {
		Jedis jedis = jedisPool.getResource();
	    Set<String> keys = jedis.keys(pattern);
		jedis.close();
		return keys;
	}
	
	/**
	 * redis中的key失效时的监听
	 */
	/*public void jedisLinster (){
		Jedis jedis = jedisPool.getResource();
        jedis.psubscribe(new KeyExpiredListener(), "__key*__:*");
	}*/

}
