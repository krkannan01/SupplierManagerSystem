package cn.xt.sms.realm;

import cn.xt.sms.dao.IUserDao;
import cn.xt.sms.entity.User;
import cn.xt.sms.service.IPrivilegeService;
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

public class CheckRealm extends AuthorizingRealm {

    @Autowired
    private IUserDao userDao;

    @Autowired
    private IPrivilegeService privilegeService;

	//认证方法
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken passwordToken = (UsernamePasswordToken)token;
        String username = passwordToken.getUsername();
        User user = userDao.findUserByUsername(username);
        if(user == null)
            return null;
        //认证
        AuthenticationInfo info = new SimpleAuthenticationInfo(user,user.getPassword(),this.getName());
        return info;
	}
	//授权方法
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        User user = (User) arg0.getPrimaryPrincipal();
        /*授权*/
        if (user.getIsSu() == 1) {
            info.addStringPermission("admin");
        } else {
            info.addStringPermissions(privilegeService.getPrivilegeList(user.getId()));
        }
        return info;
	}

}
