package edu.dhu.action;

import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import org.springframework.beans.factory.annotation.Autowired;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import edu.dhu.pageModel.Json;
import edu.dhu.pageModel.SessionInfo;
import edu.dhu.pageModel.PMUser;
import edu.dhu.service.UserServiceI;


@ParentPackage("basePackage")
@Namespace("/")
@Action(value = "userAction", results = { @Result(name = "user", location = "/front/user/index.jsp") })
public class UserAction extends BaseAction implements ModelDriven<PMUser> {

	private static final long serialVersionUID = 4426765055782995839L;
	// 因为我们已经注解了service，这里我们使用面向接口编程，方便。注重功能，不注重实现形式。
	private UserServiceI userService;
	
	PMUser user = new PMUser();
	private int examId;

	@Override
	public PMUser getModel() {
		return user;
	}

	public UserServiceI getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(UserServiceI userService) {
		this.userService = userService;
	}

	// 返回的页面
	public String user() {
		return "user";
	}
	// 前台登陆页面
	public void login() {
		Json j = userLogin(user);
		super.writeJson(j);
	}

	public Json userLogin(PMUser user) {
		Json j = new Json();
		PMUser u = userService.login(user);
		if (u != null) {
			SessionInfo sessionInfo = new SessionInfo();
			sessionInfo.setUserId(u.getId());
			sessionInfo.setLoginName(u.getUsername());
			sessionInfo.setLoginPassword(u.getPassword());
			sessionInfo.setChineseName(u.getName());
			// 将登录信息放到session中
			Map<String, Object> session = ActionContext.getContext()
					.getSession();
			session.put("sessionInfo", sessionInfo);

			j.setObj(sessionInfo);
			j.setSuccess(true);
			j.setMsg("登录成功");
		} else {
			j.setSuccess(false);
			j.setMsg("登录失败");
		}
		return j;
	}

	// 退出登录
	public void logout() {
		// 删除session中用户登录信息
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.remove("sessionInfo");
		Json j = new Json();
		j.setSuccess(true);
		j.setMsg("退出登录成功");
		super.writeJson(j);
	}
}
