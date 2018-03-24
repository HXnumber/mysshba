package edu.dhu.service;

import org.springframework.stereotype.Service;

import edu.dhu.pageModel.PMUser;

@Service
public interface UserServiceI {


	// 登录使用
	public PMUser login(PMUser user);

}
