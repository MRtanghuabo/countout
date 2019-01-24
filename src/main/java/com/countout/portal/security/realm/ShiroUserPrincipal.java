package com.countout.portal.security.realm;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.countout.entity.AuthPermissionEntity;
import com.countout.portal.security.subject.UserPrincipal;
import com.countout.vo.AuthPermissionNodeVo;

/**
 * session存储用户信息
 * @author Mr.tang
 */
public class ShiroUserPrincipal implements UserPrincipal ,Serializable {
	private static final long serialVersionUID = -731252140291433863L;
	// ==============================Fields===========================================
	private Integer id;//用户名
	private String username;//登录名
	private String name;//员工编号
	private Integer orgId; //所属商户
	private String customerName; //所属商户
	private Integer mainOrgId;//所属主商户
	private String phone;//手机号
	private Integer enabled;//是否可用0-可用 1-禁用
	private Integer distributionType;//
	private Integer chargeIssueType;//
	private Integer onlineMalType;//
	private Integer level;
	private String path;
	private String openId;
	
	
	private Integer[] roleIds = new Integer[0]; //所属角色
	private Integer[] permissionIds = new Integer[0];// 拥有权限(ID)
	private String[] permissionNames = new String[0];// 拥有权限(name)
	private List<AuthPermissionEntity> permissionEntity = new ArrayList<AuthPermissionEntity>();
	private List<AuthPermissionNodeVo> permissions = new ArrayList<AuthPermissionNodeVo>();
	private String[] permissionCodes = new String[0];// 拥有权限(编码)
	private Map<String, Object> attributes = new ConcurrentHashMap<String, Object>();

	// ==============================Constructors=====================================
	public ShiroUserPrincipal() {
	}
	
	public ShiroUserPrincipal(Integer id, String username, String name, Integer orgId, String customerName,
			Integer mainOrgId, String phone, Integer enabled, Integer distributionType, Integer chargeIssueType,
			Integer onlineMalType, Integer level, String path, String openId, Integer[] roleIds,
			Integer[] permissionIds, String[] permissionNames, //List<AuthPermissionNodeVo> permissions,
			String[] permissionCodes, Map<String, Object> attributes) {
		super();
		this.id = id;
		this.username = username;
		this.name = name;
		this.orgId = orgId;
		this.customerName = customerName;
		this.mainOrgId = mainOrgId;
		this.phone = phone;
		this.enabled = enabled;
		this.distributionType = distributionType;
		this.chargeIssueType = chargeIssueType;
		this.onlineMalType = onlineMalType;
		this.level = level;
		this.path = path;
		this.openId = openId;
		this.roleIds = roleIds;
		this.permissionIds = permissionIds;
		this.permissionNames = permissionNames;
//		this.permissions = permissions;
		this.permissionCodes = permissionCodes;
		this.attributes = attributes;
	}

	// ==============================Methods==========================================
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public Integer[] getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(Integer[] roleIds) {
		this.roleIds = roleIds;
	}

	public Integer[] getPermissionIds() {
		return permissionIds;
	}

	public void setPermissionIds(Integer[] permissionIds) {
		this.permissionIds = permissionIds;
	}
	
	public String[] getPermissionNames() {
		return permissionNames;
	}

	public void setPermissionNames(String[] permissionNames) {
		this.permissionNames = permissionNames;
	}
	
	public List<AuthPermissionEntity> getPermissionEntity() {
		return permissionEntity;
	}

	public void setPermissionEntity(List<AuthPermissionEntity> permissionEntity) {
		this.permissionEntity = permissionEntity;
	}

	public String[] getPermissionCodes() {
		return permissionCodes;
	}

	public void setPermissionCodes(String[] permissionCodes) {
		this.permissionCodes = permissionCodes;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getEnabled() {
		return enabled;
	}

	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	public Integer getDistributionType() {
		return distributionType;
	}

	public void setDistributionType(Integer distributionType) {
		this.distributionType = distributionType;
	}

	public Integer getChargeIssueType() {
		return chargeIssueType;
	}

	public void setChargeIssueType(Integer chargeIssueType) {
		this.chargeIssueType = chargeIssueType;
	}

	public Integer getOnlineMalType() {
		return onlineMalType;
	}

	public void setOnlineMalType(Integer onlineMalType) {
		this.onlineMalType = onlineMalType;
	}

	@SuppressWarnings("unchecked")
	public <T> T getAttribute(String name) {
		return (T) attributes.get(name);
	}

	public void setAttribute(String name, Object value) {
		this.attributes.put(name, value);
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Integer getMainOrgId() {
		return mainOrgId;
	}

	public void setMainOrgId(Integer mainOrgId) {
		this.mainOrgId = mainOrgId;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}
	
	public Map<String, Object> getAttributes() {
		return attributes;
	}

	public void setAttributes(Map<String, Object> attributes) {
		this.attributes = attributes;
	}
	
	public List<AuthPermissionNodeVo> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<AuthPermissionNodeVo> permissions) {
		this.permissions = permissions;
	}

	@Override
	public String toString() {
		return "ShiroUserPrincipal [id=" + id + ", username=" + username + ", name=" + name + ", orgId=" + orgId
				+ ", customerName=" + customerName + ", mainOrgId=" + mainOrgId + ", phone=" + phone + ", enabled="
				+ enabled + ", distributionType=" + distributionType + ", chargeIssueType=" + chargeIssueType
				+ ", onlineMalType=" + onlineMalType + ", level=" + level + ", path=" + path + ", openId=" + openId
				+ ", roleIds=" + Arrays.toString(roleIds) + ", permissionIds=" + Arrays.toString(permissionIds)
				+ ", permissionNames=" + Arrays.toString(permissionNames) + ", permissions=" //+ //permissions
				+ ", permissionCodes=" + Arrays.toString(permissionCodes) + ", attributes=" + attributes + "]";
	}

}
