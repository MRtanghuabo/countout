package countout;

import org.junit.Test;

import org.apache.log4j.Logger;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * 3.测试类：
 * @author Administrator
 */
public class TestJedis {
 
	@SuppressWarnings("resource")
    public static void main(String[] args) {
        JedisPool pool = new JedisPool(new JedisPoolConfig(), "localhost");
        Jedis jedis = pool.getResource();
        jedis.set("test", "新浪微博：小叶子一点也不逗");
        jedis.expire("test", 10);
    }
    
    
    Logger logger= Logger.getLogger(TestJedis.class);
    @Test
    public void printLogger(){
        logger.error("直接输出吧");
        try {

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
