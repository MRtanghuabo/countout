package com.countout.portal.login;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.DefaultSessionManager;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.countout.portal.base.BaseConstants;
import com.countout.portal.redisCache.JedisClientPool;
import com.countout.portal.security.UserHolder;
import com.countout.portal.security.realm.ShiroUserPrincipal;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 用户登录/注销 视图类
 * 
 * @author Mr.tang
 */
@Controller
@RequestMapping(value = "/")
public class LoginController {

	@Autowired
	private JedisClientPool jedisClientPool;

	/**
	 * 用户登录
	 * @param username 用户名
	 * @param password 密码
	 */
	@RequestMapping(value = "/login.do")
	@ResponseBody
	private Object doLogin(@RequestBody Map<String, String> reqMap, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String username = reqMap.get("username");
			String password = reqMap.get("password");
			if (StringUtils.isEmpty(username)) {
				map.put("msg", "用户名不能为空！");
				map.put("state", Boolean.FALSE);
				return map;
			}
			if (StringUtils.isEmpty(password)) {
				map.put("msg", "密码不能为空！");
				map.put("state", Boolean.FALSE);
				return map;
			}

			AuthenticationToken token = new UsernamePasswordToken(username, password, false);
			Subject currentUser = SecurityUtils.getSubject();
			currentUser.login(token);

			// 剔除其他此账号在其它地方登录
			List<Session> loginedList = getLoginedSession(currentUser);
			for (Session session : loginedList) {
				session.setAttribute("loginState", Boolean.TRUE);
//				session.setAttribute("loginMsg", "当前用户已在别处登录，请重新登录！");
				//session.stop();
			}

			if (!currentUser.isAuthenticated()) {
				map.put("msg", "用户名或密码错误！");
				map.put("state", Boolean.FALSE);
				return map;
			}
			ShiroUserPrincipal prical = (ShiroUserPrincipal) currentUser.getPrincipal();
			// 将登陆信息存入redis
			this.jedisClientPool.set(BaseConstants.USER_SESSION + username, beanToStr(prical));
			this.jedisClientPool.expire(BaseConstants.USER_SESSION + username, 1800);

			// 將登陸信息取出
			// ShiroUserPrincipal pa = stringtobean(jedisClientPool.get(BaseConstants.USER_SESSION + username));
			// System.out.println(pa.getName());
			map.put("msg", "登录成功");
			map.put("state", Boolean.TRUE);
		} catch (Exception e) {
			map.put("msg", "用户名或密码错误！");
			map.put("state", Boolean.FALSE);
			return map;
		}
		return map;
	}
	
	/**
	 * 遍历一个账户的session
	 * 
	 * @param currentUser
	 * @return
	 */
	private List<Session> getLoginedSession(Subject currentUser) {
		Collection<Session> list = ((DefaultSessionManager) ((DefaultSecurityManager) SecurityUtils
				.getSecurityManager()).getSessionManager()).getSessionDAO().getActiveSessions();

		List<Session> loginedList = new ArrayList<Session>();
		ShiroUserPrincipal loginUser = (ShiroUserPrincipal) currentUser.getPrincipal();
		for (Session session : list) {
			Subject subject = new Subject.Builder().session(session).buildSubject();
			if (subject.isAuthenticated()) {
				ShiroUserPrincipal user = (ShiroUserPrincipal) subject.getPrincipal();
				if (user.getUsername().equalsIgnoreCase(loginUser.getUsername())) {
					if (!session.getId().equals(currentUser.getSession().getId())) {
						loginedList.add(session);
					}
				}
			}
		}
		return loginedList;
	}

	static ObjectMapper objectMapper;

	/**
	 * bean 转json字符串
	 * 
	 * @param principal
	 * @return
	 */
	public String beanToStr(ShiroUserPrincipal principal) {

		if (objectMapper == null) {
			objectMapper = new ObjectMapper();
		}
		try {
			return objectMapper.writeValueAsString(principal);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * String 转换为实体
	 * 
	 * @param str
	 * @return
	 * @throws IOException
	 * @throws JsonMappingException
	 * @throws JsonParseException
	 */
	public ShiroUserPrincipal stringtobean(String str) throws JsonParseException, JsonMappingException, IOException {

		ObjectMapper mapper = new ObjectMapper();
		ShiroUserPrincipal principal = mapper.readValue(str, ShiroUserPrincipal.class);
		return principal;
	}

	/**
	 * 将用户信息保存至redis
	 */
	/*
	 * public void saveSessionForRedis(Object key, Object value){ Jedis jedis =
	 * JedisClientSingle.getJedis(); jedis.set(getByteKey(key),
	 * SerializeUtil.serialize((Serializable)value));
	 * jedis.expire(getByteKey(key), 1800);//设置过期时间 }
	 */

	/**
	 * 获得byte[]型的key
	 * 
	 * @param key
	 * @return
	 */
	/*
	 * private byte[] getByteKey(Object key){ if(key instanceof String){ String
	 * preKey = this.keyPrefix + key + "_" + System.currentTimeMillis(); return
	 * preKey.getBytes(); }else{ return SerializeUtil.serialize((Serializable)
	 * key); } }
	 */

	/** 定义redis中key的前缀 */
	private String keyPrefix = "redis_session:";

	public String getKeyPrefix() {
		return keyPrefix;
	}

	public void setKeyPrefix(String keyPrefix) {
		this.keyPrefix = keyPrefix;
	}

	/**
	 * 用户登出
	 */
	@RequestMapping(value = "/logout.do")
	@ResponseBody
	private Object doLogout(HttpServletRequest request, HttpServletResponse response) {
		this.jedisClientPool.expire(BaseConstants.USER_SESSION + UserHolder.getUsername(), 1);
		SecurityUtils.getSubject().logout();
		return Boolean.TRUE;
	}
	
	/**
	 * 用户登出
	 */
	@RequestMapping(value = "/logoutSession.do")
	@ResponseBody
	private Object logoutSession(HttpServletRequest request, HttpServletResponse response) {
		SecurityUtils.getSubject().logout();
		return Boolean.TRUE;
	}

	/**
	 * 跳转至登录页
	 * 
	 * @param mode
	 * @return
	 */
	@RequestMapping(value = "/login.html")
	public String index() {
		return "/login";
	}

}
