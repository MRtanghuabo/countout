package com.countout.service;

import java.util.List;
import java.util.Map;

import com.countout.entity.AuthOrgEntity;
import com.countout.vo.AuthOrgVo;
import com.tang.util.page.Page;

/**
 * 机构
 * @author Mr.tang
 */
public interface AuthOrgService {

	/**
	 * 分页查询机构
	 * @param requestMap
	 * @return
	 */
	Page<AuthOrgEntity> pageQuery(Map<String, Object> requestMap);

	/**
	 * 新增或保存机构
	 * @param requestMap
	 */
	void saveOrUpdate(Map<String, Object> requestMap);

	/**
	 * 查询所有--机构树
	 * @return
	 */
	List<AuthOrgVo> getTree();

	/**
	 * 查询单个机构
	 * @param requestMap
	 */
	AuthOrgEntity view(Map<String, Object> requestMap);

	/**
	 * 删除机构
	 * @param requestMap
	 */
	void delete(Map<String, Object> requestMap);
	
}
