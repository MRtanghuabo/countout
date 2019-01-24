package com.countout.portal.redisCache;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * 单机版
 * @author Mr.tang
 */
public class JedisClientSingle {

    private static JedisPool jedisPool;

    static {
        JedisPoolConfig jedisConfig = new JedisPoolConfig();
        jedisConfig.setMaxTotal(100);
        jedisConfig.setMaxIdle(10);
        jedisConfig.setMaxWaitMillis(100);
        //主机名称和端口号，开启redis的服务器和端口号
        jedisPool = new JedisPool(jedisConfig, "127.0.0.1", 6379);
    }

    public static Jedis getJedis() {
        return jedisPool.getResource();
    }

    public static void close(Jedis jedis) {
        jedis.close();
    }


}
