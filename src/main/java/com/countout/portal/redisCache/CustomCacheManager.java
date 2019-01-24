package com.countout.portal.redisCache;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;

/**
 * 序列化与反序列化
 * 
 * @author Mr.tang
 */
public class CustomCacheManager implements CacheManager {

    @Override
    public <K, V> Cache<K, V> getCache(String name) throws CacheException {
        return new RedisCache<K,V>();
    }
}
