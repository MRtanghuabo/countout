package com.countout.portal.security.realm;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.countout.entity.AuthPermissionEntity;
import com.countout.entity.AuthUserEntity;
import com.countout.service.AuthPermissionService;
import com.countout.service.AuthUserRoleService;
import com.countout.service.AuthUserService;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;


/**
 * 权限验证的支持类 (授权域)<br>
 * Realm 是一个能够访问应用程序特定的安全数据（如用户、角色及权限）的组件。<br>
 * Realm 通常和数据源是一对一的对应关系，如关系数据库，LDAP 目录，文件系统，或其他类似资源。<br>
 * 因为这些数据源大多通常存储身份验证数据（如密码的凭证）以及授权数据（如角色或权限），每个Realm能够执行身份验证和授权操作。<br>
 * 
 * @author Mr.tang
 */
public class ShiroDbAuthorizingRealm extends AuthorizingRealm {

	// ==============================Fields===========================================
	@Autowired
	private AuthUserService authUserService;
	
	@Autowired
	private AuthUserRoleService authUserRoleService; 
	
	@Autowired
	private AuthPermissionService authPermissionService;
	
	// ==============================Methods==========================================
	/**
	 * (登陆验证)认证回调函数,登录时调用.
	 * 
	 * @param authcToken
	 *            认证凭据
	 * @return 认证信息
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
			throws AuthenticationException {

		// 使用的是用户名密码凭据
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		
		//处理session
       /* DefaultWebSecurityManager securityManager = (DefaultWebSecurityManager) SecurityUtils.getSecurityManager();
        DefaultWebSessionManager sessionManager = (DefaultWebSessionManager)securityManager.getSessionManager();
        Collection<Session> sessions = sessionManager.getSessionDAO().getActiveSessions();//获取当前已登录的用户session列表
        for(Session session:sessions){
            //清除该用户以前登录时保存的session
            if(token.getUsername().equals(String.valueOf(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY)))) {
                sessionManager.getSessionDAO().delete(session);
            }
        }*/
		
		// 根据用户名称(登录名)，查询用户信息
		AuthUserEntity user = authUserService.getByUsernameAndstate(token.getUsername());
		
		// 如果查询到用户，那么封装用户的认证信息并返回
		if (user != null) {
			
			ShiroUserPrincipal principal = new ShiroUserPrincipal();
			principal.setId(user.getId());
			principal.setUsername(user.getUsername());
			principal.setName(user.getName());
			principal.setOrgId(user.getOrgId());

			List<Integer> roleIds = Lists.newArrayList();
//			Collection<Integer> permissionIds = Lists.newArrayList();
			Collection<Integer> permissionIds = Sets.newHashSet();
			Collection<String> permissionCodes = Sets.newHashSet();
			if (StringUtils.equals(user.getPassword(), new String(token.getPassword()))) {
				//根据用户ID(userId)查找用户角色(roles)信息
				roleIds = authUserRoleService.findRoleIdByUserId(principal.getId());
				//根据用户角色(roleIds)查找用户权限(permissions)信息
				List<AuthPermissionEntity> permissions = authPermissionService.findEntityByRoleId(roleIds);
				if(permissions != null){
					principal.setPermissionEntity(removeListDuplicateObject(permissions));
					for (AuthPermissionEntity permission : permissions) {
						Integer id = permission.getId();
						String code = permission.getCode();
						permissionIds.add(id);
						if (StringUtils.isNotEmpty(code)) {
							permissionCodes.add(code);
						}
					}
				}
			}
			
			principal.setRoleIds(roleIds.toArray(new Integer[roleIds.size()]));//角色
			principal.setPermissionIds(permissionIds.toArray(new Integer[permissionIds.size()]));//菜单id
			principal.setPermissionCodes(permissionCodes.toArray(ArrayUtils.EMPTY_STRING_ARRAY));
			
			return new SimpleAuthenticationInfo(//
					// 1. 认证对象 (可以是任意对象，此处使用自定义的认证对象，放置了一些用户基础数据)
					principal,
					// 2. 认证凭据(此处是密码)
					user.getPassword(), //
					// 3. 授权域名称(默认是{当前类名+初始化的序号})
					getName()//
			);
		}
		
		// 没有查询到用户，直接返回空(NULL)
		return null;
	}
	
	private List<AuthPermissionEntity> removeListDuplicateObject(List<AuthPermissionEntity> list) { 
		Set<AuthPermissionEntity> set = new HashSet<AuthPermissionEntity>(); 
		set.addAll(list); 
		List<AuthPermissionEntity> listnewList = new ArrayList<AuthPermissionEntity>(set);
		return listnewList;
	}
	
	public static void main(String[] args) {
		/*String aaa[] = "".split(",");
		System.out.println(aaa[0]);
		for (int i = 0; i < aaa.length; i++) {
			System.out.println(aaa[i]);
		}*/
		

		List<Integer> list = new ArrayList<Integer>();
		list.add(3);
		list.add(4);
		Integer[] array = list.toArray(new Integer[list.size()]);//能正确运行
		for(Integer element:array){
		     System.out.println(element);
		}
		
	}

	/**
	 * (权限验证)授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
	 * 
	 * @param principals
	 *            身份集合信息
	 * @return 授权信息
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

		// 获得认证对象(登陆验证doGetAuthenticationInfo方法中设置的认证对象)
		ShiroUserPrincipal principal = (ShiroUserPrincipal) principals.getPrimaryPrincipal();

		// 基本授权信息对象
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

		// 获得用户角色(roles)信息
		Integer[] roleIds = principal.getRoleIds();
		List<String> strRoleIds = new ArrayList<String>();
		for (Integer roleId : roleIds) {
			strRoleIds.add(roleId.toString());
		}
		// 将角色信息授权
		info.addRoles(Lists.newArrayList(strRoleIds));

		// 获得用户权限(permissionId)信息
		Integer[] permissionIds = principal.getPermissionIds();
		List<String> strPermissionIds = new ArrayList<String>();
		for (Integer permissionId : permissionIds) {
			strPermissionIds.add(permissionId.toString());
		}
		// 将权限信息授权
		info.setStringPermissions(Sets.newHashSet(strPermissionIds));
		return info;
	}
}
