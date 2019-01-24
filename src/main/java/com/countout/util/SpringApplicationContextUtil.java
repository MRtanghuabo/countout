package com.countout.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * 当注入失败时，可以使用此方式
 * @author Mr.tang
 */
public class SpringApplicationContextUtil implements ApplicationContextAware {

	private static ApplicationContext context;

	public void setApplicationContext(ApplicationContext contex) throws BeansException {
		SpringApplicationContextUtil.context = contex;
	}

	public static ApplicationContext getContext() {
		return context;
	}

}
