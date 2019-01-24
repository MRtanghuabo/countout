package com.countout.util;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 实体与字符串之间互相转换
 * @author Mr.tang
 */
public class BeanJsonStrUtil<T> {
	
	static ObjectMapper objectMapper;
	
	
	/**
	 * 将对象转换为json格式字符串
	 * 
	 * @param Object
	 * @return json string
	 */
	public static String toJSON(Object obj) {
	    ObjectMapper om = new ObjectMapper();
	    try {
	        String json = om.writeValueAsString(obj);
	        return json;
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
	/**
	 * String 转换为实体
	 * @param str
	 * @return
	 * @throws IOException 
	 * @throws JsonMappingException 
	 * @throws JsonParseException 
	 */
	public static <T> T parse(String jsonStr, Class<T> clazz) {
	    ObjectMapper om = new ObjectMapper();
	    T readValue = null;
	    try {
	        readValue = om.readValue(jsonStr, clazz);
	    } catch (JsonParseException e) {
	        e.printStackTrace();
	    } catch (JsonMappingException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return readValue;
	}
	
	
	/**
	 * bean 转json字符串
	 * @param principal
	 * @return
	 */
	/*public String beanToStr(Entity t){
		
		if (objectMapper == null) {
			objectMapper = new ObjectMapper();
		}
	    try{
	    	return objectMapper.writeValueAsString(t);
	    }catch (Exception e){
	    	e.printStackTrace();
	    }
	     return null;
	}*/
	
	/**
	 * String 转换为实体
	 * @param str
	 * @return
	 * @throws IOException 
	 * @throws JsonMappingException 
	 * @throws JsonParseException 
	 */
	/*public Object strToBean(String str, T t) throws JsonParseException, JsonMappingException, IOException {
		
		ObjectMapper mapper = new ObjectMapper();  
		Object bean = mapper.readValue(str, t.class);
		return bean;
	}*/
}
