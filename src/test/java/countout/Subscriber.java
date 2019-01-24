package countout;

import org.junit.Test;

import com.countout.portal.redisCache.KeyExpiredListener;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * 订阅redis失效的消息
 * @author Administrator
 */
public class Subscriber {
 
	@SuppressWarnings("resource")
    public static void main(String[] args) {
		JedisPool pool = new JedisPool(new JedisPoolConfig(), "localhost");
        Jedis jedis = pool.getResource();
        jedis.psubscribe(new KeyExpiredListener(), "__key*__:*");
    }
    
    /**
	 *  订阅测试类
	 * @throws Exception
	 */
    @SuppressWarnings("resource")
    @Test  
    public void testSubscribe() throws Exception{  
        Jedis jedis = new Jedis("localhost");  
        KeyExpiredListener listener = new KeyExpiredListener();  
        jedis.subscribe(listener, "__keyevent@0__:expired");  
        //other code  
    }  
    
    /**
     * 发布消息测试类
     * @throws Exception
     */
    @SuppressWarnings("resource")
	@Test  
    public void testPublish() throws Exception{  
        Jedis jedis = new Jedis("localhost");  
        jedis.publish("redisChatTest", "我是天才");  
        Thread.sleep(5000);  
        jedis.publish("redisChatTest", "我牛逼");  
        Thread.sleep(5000);  
        jedis.publish("redisChatTest", "哈哈");  
    }  
 
}