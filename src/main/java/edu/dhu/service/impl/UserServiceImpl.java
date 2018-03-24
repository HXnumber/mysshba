package edu.dhu.service.impl;

import java.util.HashMap;
import java.util.Map;


import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.dhu.dao.UserDaoI;
import edu.dhu.model.Users;
import edu.dhu.pageModel.PMUser;
import edu.dhu.service.UserServiceI;

//注解userService   在action中使用
@Service("userService")
@Transactional
public class UserServiceImpl implements UserServiceI {

	private UserDaoI userDao;

	public UserDaoI getUserDao() {
		return userDao;
	}

	@Autowired
	public void setUserDao(UserDaoI userDao) {
		this.userDao = userDao;
	}


	// 很好的实现查询然后判读用户是否正确 用户名+密码登录
	@Override
	public PMUser login(PMUser user) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("name", user.getUsername());
		params.put("pwd", user.getPassword());
		Users theUser = userDao.get(
				"from Users t where t.username =:name and t.password=:pwd",
				params);
		if (theUser == null) {
			// logger.info("++++++++数据库中查找不到该用户++++++++");
			return null;
		} else {
			BeanUtils.copyProperties(theUser, user);
			// logger.info("用户名:" + user.getUsername() + "密码:" +
			// user.getPassword());
			return user;
		}
	}
}
