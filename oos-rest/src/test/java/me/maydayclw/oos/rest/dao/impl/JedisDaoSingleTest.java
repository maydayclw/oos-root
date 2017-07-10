package me.maydayclw.oos.rest.dao.impl;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/6/6 </p>
 * <p>Time: 11:05 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public class JedisDaoSingleTest {
    @Test
    public void testJedisPool(){
        JedisPool jedisPool = new JedisPool("192.168.139.101",6379);
        long start = System.currentTimeMillis();
        Jedis jedis = jedisPool.getResource();
        String key1 = jedis.get("key1");
        System.out.println(key1);
        jedis.close();
        long end = System.currentTimeMillis();
        System.out.println(end-start);
        jedisPool.close();
    }

    @Test
    public void testSpringJedisSingle() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
        JedisPool pool = (JedisPool) applicationContext.getBean("jedisClient");
        Jedis jedis = pool.getResource();
        String string = jedis.get("key1");
        System.out.println(string);
        jedis.close();
        pool.close();
    }

}